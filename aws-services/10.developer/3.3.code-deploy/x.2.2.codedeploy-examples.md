---
tags:
  - aws
  - aws/service
  - aws/domain/developer-tools
  - aws/topic/code-deploy
aliases:
  - "Full Deployment Examples With Explanations .NET & Angular EC2 S3 Amplify"
  - "Codedeploy Examples"
---

# 🚀 Full Deployment Examples (With Explanations): .NET & Angular → EC2, S3, Amplify

## 🖥️ 1. Deploying a .NET API to EC2 with CodeDeploy

### 📦 `buildspec.yml` (Line-by-Line Explanation)

```yaml
version: 0.2

phases:
  install:
    runtime-versions:
      dotnet: 6.0 # ✅ Use .NET 6 runtime
    commands:
      - echo "Installing .NET SDK..." # Log install step
  build:
    commands:
      - echo "Publishing app..." # Log build step
      - dotnet publish -c Release -o ./publish # ✅ Publish output to /publish
  post_build:
    commands:
      - echo "Zipping app for deployment..."
      - zip -r myapp.zip publish appspec.yml scripts/ # ✅ Zip everything needed

artifacts:
  files:
    - myapp.zip # ✅ Artifact that gets uploaded to S3 for CodeDeploy
```

---

### 🧾 `appspec.yml` (EC2)

```yaml
version: 0.0
os: linux
files:
  - source: /
    destination: /var/www/myapp # ✅ Location where files will be copied on EC2
hooks:
  ApplicationStart:
    - location: scripts/start.sh
```

---

### ▶️ `scripts/start.sh`

```bash
#!/bin/bash
cd /var/www/myapp
dotnet MyApi.dll > /dev/null 2>&1 &  # ✅ Starts the API silently in background
```

🧠 **CodeDeploy automatically unzips your `myapp.zip`** on the EC2 instance before executing any hook.

---

## 🌐 2. Deploying Angular App to EC2 via CodeDeploy (With nginx)

### 📦 `buildspec.yml`

```yaml
version: 0.2

phases:
  install:
    runtime-versions:
      nodejs: 18
    commands:
      - npm ci # ✅ Clean install using lock file
  build:
    commands:
      - npm run build -- --configuration production # ✅ Outputs to /dist
  post_build:
    commands:
      - zip -r angular-app.zip dist appspec.yml scripts/ # ✅ Package for CodeDeploy

artifacts:
  files:
    - angular-app.zip
```

---

### 🧾 `appspec.yml`

```yaml
version: 0.0
os: linux
files:
  - source: /
    destination: /var/www/html # ✅ Default nginx root directory
hooks:
  ApplicationStart:
    - location: scripts/restart-nginx.sh
```

---

### ▶️ `scripts/restart-nginx.sh`

```bash
#!/bin/bash
systemctl restart nginx  # ✅ Refresh nginx to serve the updated Angular app
```

> 💡 **No need to unzip manually**. CodeDeploy does it before the hook runs.

---

## 🪣 3. Deploying Angular App to S3 (Static Website)

### 📦 `buildspec.yml`

```yaml
version: 0.2

phases:
  install:
    runtime-versions:
      nodejs: 18
    commands:
      - npm ci
  build:
    commands:
      - npm run build -- --configuration production
  post_build:
    commands:
      - aws s3 sync dist/your-app-name/ s3://your-s3-bucket-name --delete
        # ✅ Upload all files to S3
        # ✅ --delete removes outdated files
```

📌 **No hooks or AppSpec needed** — this is direct S3 sync after build.

---

## ✅ Final Comparison

| Case           | Method        | Tool       | Notes                       |
| -------------- | ------------- | ---------- | --------------------------- |
| .NET to EC2    | Zip + AppSpec | CodeDeploy | Fully controlled deployment |
| Angular to EC2 | Build + nginx | CodeDeploy | Serve via Nginx             |
| Angular to S3  | Direct sync   | AWS CLI    | Fast & simple               |
---

## Related Notes
- [[aws-services/10.developer/2.3.code-deploy/|AWS CodeDeploy Deployment Strategies EC2 Lambda and ECS]] - folder map
-[[x.2.1.appspec|AWS CodeDeploy appspec.yml Full Syntax & Usage Guide]]] - previous lesson
-[[x.3.1.monorepo-deployment|Monorepo Deployment with CodePipeline CodeBuild and CodeDeploy]]] - next lesson
-[[2.1.buildspec.yml|AWS CodeBuild buildspec.yml]]] - mentions Buildspec.Yml
-[[1.1.codedeploy|Introduction to AWS CodeDeploy]]] - mentions Codedeploy
- [[aws-services/10.developer/1.1.aws-cli/aws-cli|Aws Cli]] - mentions Aws Cli

---
