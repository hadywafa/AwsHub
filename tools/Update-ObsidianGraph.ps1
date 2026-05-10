Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Convert-ToSlug {
    param([string]$Text)
    $s = $Text.ToLowerInvariant()
    $s = $s -replace '[^\p{L}\p{Nd}]+', '-'
    $s = $s.Trim('-')
    if ([string]::IsNullOrWhiteSpace($s)) { return "note" }
    return $s
}

function Convert-ToTitle {
    param([string]$Text)
    $s = [System.IO.Path]::GetFileNameWithoutExtension($Text)
    $s = $s -replace '^[._\s-]+', ''
    $s = $s -replace '^(x+|z+|ا+)[._-]+', ''
    $s = $s -replace '^\d+(\.\d+)*[._-]+', ''
    $s = $s -replace '[_-]+', ' '
    $s = $s -replace '\s+', ' '
    $s = $s.Trim()
    if ([string]::IsNullOrWhiteSpace($s)) { return "Index" }
    $title = (Get-Culture).TextInfo.ToTitleCase($s.ToLowerInvariant())
    $title = $title -replace '\bAws\b', 'AWS'
    $title = $title -replace '\bApi\b', 'API'
    $title = $title -replace '\bIam\b', 'IAM'
    $title = $title -replace '\bEc2\b', 'EC2'
    $title = $title -replace '\bS3\b', 'S3'
    $title = $title -replace '\bEbs\b', 'EBS'
    $title = $title -replace '\bEfs\b', 'EFS'
    $title = $title -replace '\bRds\b', 'RDS'
    $title = $title -replace '\bVpc\b', 'VPC'
    $title = $title -replace '\bAcl\b', 'ACL'
    $title = $title -replace '\bKms\b', 'KMS'
    $title = $title -replace '\bSqs\b', 'SQS'
    $title = $title -replace '\bSns\b', 'SNS'
    $title = $title -replace '\bEcs\b', 'ECS'
    $title = $title -replace '\bEks\b', 'EKS'
    $title = $title -replace '\bEcr\b', 'ECR'
    return $title
}

function Get-FirstHeading {
    param([string]$Content, [string]$Fallback)
    foreach ($line in ($Content -split "`r?`n")) {
        if ($line -match '^\s*#\s+(.+?)\s*$') {
            $heading = $Matches[1]
            $heading = $heading -replace '<[^>]+>', ''
            $heading = $heading -replace '[#*_`~>\[\]()]', ''
            $heading = $heading -replace '[^\p{L}\p{Nd}\s/&+.-]', ''
            $heading = $heading -replace '\s+', ' '
            $heading = $heading.Trim()
            if ($heading.Length -gt 2) { return $heading }
        }
    }
    return $Fallback
}

function Get-BodyWithoutManagedSections {
    param([string]$Content)
    $normalized = $Content -replace "`r`n", "`n"
    $normalized = [regex]::Replace($normalized, '(?ms)\n?---\s*\n## Related Notes\n.*?\n---\s*(?=\n|$)', '')
    if ($normalized -match '(?s)^---\n.*?\n---\n') {
        $normalized = $normalized -replace '(?s)^---\n.*?\n---\n+', ''
    }
    return $normalized.TrimStart()
}

function Get-RelativeVaultPath {
    param([string]$Root, [string]$FullName)
    $rootPath = $Root.TrimEnd('\') + '\'
    if ($FullName.StartsWith($rootPath, [System.StringComparison]::OrdinalIgnoreCase)) {
        $relative = $FullName.Substring($rootPath.Length)
    } else {
        $rootUri = New-Object System.Uri($rootPath)
        $fileUri = New-Object System.Uri($FullName)
        $relative = [System.Uri]::UnescapeDataString($rootUri.MakeRelativeUri($fileUri).ToString())
    }
    return ($relative -replace '\\', '/')
}

$root = (Resolve-Path ".").Path
$allFiles = Get-ChildItem -Path $root -Recurse -File -Filter "*.md" |
    Where-Object {
        $_.FullName -notmatch '\\\.git\\' -and
        $_.FullName -notmatch '\\\.obsidian\\' -and
        $_.FullName -notmatch '\\tools\\'
    } |
    Sort-Object FullName

$notes = @()
foreach ($file in $allFiles) {
    $relative = Get-RelativeVaultPath $root $file.FullName
    $content = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
    $body = Get-BodyWithoutManagedSections $content
    $fallbackTitle = Convert-ToTitle $file.Name
    $title = Get-FirstHeading $body $fallbackTitle
    $pathNoExt = $relative.Substring(0, $relative.Length - 3)
    $parts = $relative -split '/'
    $folderParts = @()
    if ($parts.Count -gt 1) { $folderParts = $parts[0..($parts.Count - 2)] }
    $notes += [pscustomobject]@{
        File = $file
        Relative = $relative
        PathNoExt = $pathNoExt
        Title = $title
        FallbackTitle = $fallbackTitle
        Body = $body
        Folder = [System.IO.Path]::GetDirectoryName($relative).Replace('\','/')
        FolderParts = $folderParts
        BaseSlug = Convert-ToSlug ([System.IO.Path]::GetFileNameWithoutExtension($file.Name))
    }
}

$categoryAliases = @{
    '1.management-governance' = 'Management and Governance'
    '2.security' = 'Security'
    '3.network' = 'Networking'
    '4.storage' = 'Storage'
    '5.compute' = 'Compute'
    '6.containers' = 'Containers'
    '7.application-integration' = 'Application Integration'
    '8.database' = 'Database'
    '9.migration-and-transfer' = 'Migration and Transfer'
    '10.developer' = 'Developer Tools'
    '11.analytics' = 'Analytics'
    '12.machine-learning' = 'Machine Learning'
    '13.bussiness-applications' = 'Business Applications'
    '14.end-user-computing' = 'End User Computing'
    '15.front-end-web-mobile' = 'Front End Web Mobile'
    '16.blockchain' = 'Blockchain'
    '17.internet-of-things' = 'Internet Of Things'
    '18.media-services' = 'Media Services'
}

$genericTerms = @(
    'aws','amazon','service','services','overview','summary','notes','questions','question',
    'demo','hands on','pricing','billing','security','monitoring','logging','concept','concepts',
    'fundamentals','basics','internals','integrations','use cases','examples','resources',
    'references','roadmap','exam','course','review','design','index','how it works',
    'the scenario','the big picture','root','notes','vip notes','exam 1','exam 0',
    'stephan course mock exam'
)

$tagFixes = @{
    'fundmmentals' = 'fundamentals'
    'fundmenals' = 'fundamentals'
    'prequesite' = 'prerequisite'
    'bussiness' = 'business'
    'comparision' = 'comparison'
    'eycosystem' = 'ecosystem'
    'stratigies' = 'strategies'
    'scailing' = 'scaling'
}

function Get-Aliases {
    param($Note)
    $candidates = New-Object System.Collections.Generic.List[string]
    $candidates.Add($Note.Title)
    $candidates.Add($Note.FallbackTitle)
    $candidates.Add(($Note.FallbackTitle -replace '\bAws\b', 'AWS'))
    $candidates.Add(($Note.FallbackTitle -replace '\bCfn\b', 'CloudFormation'))
    $candidates.Add(($Note.FallbackTitle -replace '\bDdb\b', 'DynamoDB'))
    $candidates.Add(($Note.FallbackTitle -replace '\bKds\b', 'Kinesis Data Streams'))
    $candidates.Add(($Note.FallbackTitle -replace '\bCw\b', 'CloudWatch'))
    $candidates.Add(($Note.FallbackTitle -replace '\bAgw\b', 'API Gateway'))
    $candidates.Add(($Note.FallbackTitle -replace '\bEcr\b', 'ECR'))
    $candidates.Add(($Note.FallbackTitle -replace '\bEcs\b', 'ECS'))
    $candidates.Add(($Note.FallbackTitle -replace '\bEks\b', 'EKS'))
    $candidates.Add(($Note.FallbackTitle -replace '\bEc2\b', 'EC2'))
    $candidates.Add(($Note.FallbackTitle -replace '\bS3\b', 'S3'))

    $out = New-Object System.Collections.Generic.List[string]
    foreach ($candidate in $candidates) {
        $clean = $candidate -replace '[^\p{L}\p{Nd}\s/&+.-]', ' '
        $clean = $clean -replace '\s+', ' '
        $clean = $clean.Trim()
        if ($clean.Length -lt 3) { continue }
        if ($genericTerms -contains $clean.ToLowerInvariant()) { continue }
        if ($clean -match '^(Exam|Demo|Questions?|Summary|Notes?|Index)(\s+\d+)?$') { continue }
        if (($clean -split '\s+').Count -eq 1 -and $clean.Length -lt 4 -and $clean -notmatch '^(S3|EC2|IAM|VPC|EBS|EFS|ECS|EKS|ECR|RDS|SQS|SNS|KMS|WAF)$') { continue }
        if (-not $out.Contains($clean)) { $out.Add($clean) }
    }
    return $out
}

function Get-Tags {
    param($Note)
    $tags = New-Object System.Collections.Generic.List[string]
    $tags.Add('aws')
    if ($Note.Relative -like 'aws-services/*') { $tags.Add('aws/service') }
    if ($Note.Relative -like 'aws-exams/*') { $tags.Add('aws/exam') }
    if ($Note.Relative -like 'aws-daily/*') { $tags.Add('aws/daily') }
    if ($Note.Relative -like 'quizes/*') { $tags.Add('aws/quiz') }
    if ($Note.Relative -like 'TaskNotes/*') { $tags.Add('aws/task-notes') }
    if ($Note.Relative -eq 'AWS Knowledge Hub.md') { $tags.Add('aws/moc') }

    foreach ($part in $Note.FolderParts) {
        if ([string]::IsNullOrWhiteSpace($part)) { continue }
        $clean = $part -replace '^\d+(\.\d+)*[._-]*', ''
        $clean = $clean -replace '^(x+|z+|_+|ا+)[._-]+', ''
        $slug = Convert-ToSlug $clean
        foreach ($bad in $tagFixes.Keys) {
            $slug = $slug -replace [regex]::Escape($bad), $tagFixes[$bad]
        }
        if ($slug -and $slug -ne 'note' -and $slug -ne 'notes') {
            if ($Note.Relative -like 'aws-services/*') {
                if ($categoryAliases.ContainsKey($part)) {
                    $tags.Add('aws/domain/' + (Convert-ToSlug $categoryAliases[$part]))
                } elseif ($part -ne 'aws-services') {
                    $tags.Add('aws/topic/' + $slug)
                }
            } elseif ($Note.Relative -like 'aws-exams/*') {
                if ($part -ne 'aws-exams') { $tags.Add('aws/cert/' + $slug) }
            } elseif ($Note.Relative -like 'aws-daily/*') {
                if ($part -ne 'aws-daily') { $tags.Add('aws/topic/' + $slug) }
            }
        }
    }
    return @($tags | Select-Object -Unique)
}

$aliasIndex = @()
foreach ($note in $notes) {
    foreach ($alias in (Get-Aliases $note)) {
        if ($alias.Length -ge 4 -or $alias -match '^(S3|EC2|IAM|VPC|EBS|EFS|ECS|EKS|ECR|RDS|SQS|SNS|KMS|WAF)$') {
            $aliasIndex += [pscustomobject]@{
                Note = $note
                Alias = $alias
                Pattern = [regex]::Escape($alias)
                Weight = $alias.Length
            }
        }
    }
}
$aliasIndex = $aliasIndex | Sort-Object Weight -Descending

function Add-Link {
    param(
        [System.Collections.Generic.List[object]]$Links,
        $Target,
        [string]$Reason
    )
    if ($null -eq $Target) { return }
    foreach ($existing in $Links) {
        if ($existing.Path -eq $Target.PathNoExt) { return }
    }
    $Links.Add([pscustomobject]@{
        Path = $Target.PathNoExt
        Title = $Target.Title
        Reason = $Reason
    })
}

$folderIndex = @{}
foreach ($group in ($notes | Group-Object Folder)) {
    $folderIndex[$group.Name] = @($group.Group | Sort-Object Relative)
}

$changed = 0
foreach ($note in $notes) {
    $links = New-Object System.Collections.Generic.List[object]
    $siblings = @()
    if ($folderIndex.ContainsKey($note.Folder)) { $siblings = $folderIndex[$note.Folder] }

    $folderIndexNote = $siblings | Where-Object { $_.File.Name -eq '.md' -or $_.File.Name -eq 'README.md' } | Select-Object -First 1
    if ($folderIndexNote -and $folderIndexNote.Relative -ne $note.Relative) {
        Add-Link $links $folderIndexNote "folder map"
    }

    $position = [array]::IndexOf($siblings.Relative, $note.Relative)
    if ($position -gt 0) { Add-Link $links $siblings[$position - 1] "previous lesson" }
    if ($position -ge 0 -and $position -lt ($siblings.Count - 1)) { Add-Link $links $siblings[$position + 1] "next lesson" }

    if ($note.FolderParts.Count -gt 1) {
        for ($i = $note.FolderParts.Count - 1; $i -ge 0; $i--) {
            $parentFolder = ($note.FolderParts[0..$i] -join '/')
            if ($folderIndex.ContainsKey($parentFolder)) {
                $parentIndex = $folderIndex[$parentFolder] | Where-Object { $_.File.Name -eq '.md' -or $_.File.Name -eq 'README.md' } | Select-Object -First 1
                if ($parentIndex -and $parentIndex.Relative -ne $note.Relative) {
                    Add-Link $links $parentIndex "parent topic"
                    break
                }
            }
        }
    }

    $plain = $note.Body
    $plain = [regex]::Replace($plain, '(?s)```.*?```', ' ')
    $plain = [regex]::Replace($plain, '(?s)<[^>]+>', ' ')
    foreach ($entry in $aliasIndex) {
        if ($entry.Note.Relative -eq $note.Relative) { continue }
        if ($links.Count -ge 12) { break }
        if ($plain -match ('(?i)(?<![\p{L}\p{Nd}])' + $entry.Pattern + '(?![\p{L}\p{Nd}])')) {
            Add-Link $links $entry.Note ("mentions " + $entry.Alias)
        }
    }

    if ($links.Count -eq 0 -and $siblings.Count -gt 1) {
        foreach ($sibling in $siblings | Select-Object -First 4) {
            if ($sibling.Relative -ne $note.Relative) { Add-Link $links $sibling "same topic cluster" }
        }
    }

    $tags = Get-Tags $note
    $yaml = "---`n"
    $yaml += "tags:`n"
    foreach ($tag in $tags) { $yaml += "  - $tag`n" }
    $yaml += "aliases:`n"
    foreach ($alias in ((Get-Aliases $note) | Select-Object -First 5)) {
        $safeAlias = $alias.Replace('"','\"')
        $yaml += "  - `"$safeAlias`"`n"
    }
    $yaml += "---`n`n"

    $related = "`n---`n`n## Related Notes`n"
    foreach ($link in $links) {
        $related += "- [[$($link.Path)|$($link.Title)]] - $($link.Reason)`n"
    }
    $related += "`n---`n"

    $newContent = $yaml + $note.Body.TrimEnd() + $related
    $oldContent = Get-Content -LiteralPath $note.File.FullName -Raw -Encoding UTF8
    if (($oldContent -replace "`r`n", "`n") -ne $newContent) {
        Set-Content -LiteralPath $note.File.FullName -Value $newContent -Encoding UTF8 -NoNewline
        $changed++
    }
}

Write-Host "Processed $($notes.Count) notes; changed $changed notes."
