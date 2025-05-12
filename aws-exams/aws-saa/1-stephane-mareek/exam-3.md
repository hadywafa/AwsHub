# Exam 3

## Incorrect Answer

### Q1

<div style="text-align: center;">
    <img src="images/exam_3_q1.png" alt="exam_3_q1" style="border-radius: 10px; width: 60%;">
</div>

### Q3

> ✅ AWS Managed Microsoft AD is the only AWS Directory Service offering that supports:
>
> - Trust relationships with on-premises Active Directory domains.
> - Running directory-aware workloads like SQL Server, which require full Active Directory functionality.
> - Single Sign-On (SSO) across on-prem and AWS environments via trust relationships.

---

> ❌ Active Directory Connector: A proxy that redirects authentication requests to your on-prem AD
>
> - ✅ Useful for joining EC2 instances to on-prem AD
> - ❌ But it doesn’t run directory-aware workloads or support trust relationships in AWS

<div style="text-align: center;">
    <img src="images/exam_3_q3.png" alt="exam_3_q3" style="border-radius: 10px; width: 60%;">
</div>

### Q7

<div style="text-align: center;">
    <img src="images/exam_3_q7.png" alt="exam_3_q7" style="border-radius: 10px; width: 60%;">
</div>

### Q8

<div style="text-align: center;">
    <img src="images/exam_3_q8.png" alt="exam_3_q8" style="border-radius: 10px; width: 60%;">
</div>

### Q9

> When using an AWS Network Load Balancer (NLB) with instance targets (as opposed to IP targets):
>
> - You register instance IDs with the NLB.
> - The NLB uses the primary private IP address of the primary network interface (eth0) of each instance to route traffic.
> - This applies regardless of whether the instance is in a public or private subnet.

<div style="text-align: center;">
    <img src="images/exam_3_q9.png" alt="exam_3_q9" style="border-radius: 10px; width: 60%;">
</div>

### 🥴 Q12

<div style="text-align: center;">
    <img src="images/exam_3_q12.png" alt="exam_3_q12" style="border-radius: 10px; width: 60%;">
</div>

### Q22

> **DNS Records**: Zone apex domains typically use **A records** to point directly to an IP address.
>
> - ⚠️ Unlike subdomains, they cannot use **CNAME records** due to DNS restrictions, though alternatives like **ALIAS** or **ANAME records** can serve similar purposes.
> - **ANAME and ALIAS are _not standard DNS records_** — they are **custom solutions by DNS providers** (like AWS Route 53 or Cloudflare) to allow **CNAME-like functionality at the root domain**, which standard DNS doesn’t support.
> - **They behave like CNAMEs**, resolving domain names to other domain names, but **can be used at the apex/root (e.g., `example.com`)**, unlike traditional CNAME records which are only valid on subdomains.

<div style="text-align: center;">
    <img src="images/exam_3_q22.png" alt="exam_3_q22" style="border-radius: 10px; width: 60%;">
</div>

### Q24

<div style="text-align: center;">
    <img src="images/exam_3_q24.png" alt="exam_3_q24" style="border-radius: 10px; width: 60%;">
</div>

### 🥴 Q28

<div style="text-align: center;">
    <img src="images/exam_3_q28.png" alt="exam_3_q28" style="border-radius: 10px; width: 60%;">
</div>

### Q29

> - When EC2 recovers an instance, it's not terminated or replaced — it's rebooted and moved to healthy hardware behind the scenes.
> - Because it's the same instance, it retains its public IPv4 address, as long as it was assigned at launch (i.e., not reallocated dynamically via reassociation).

<div style="text-align: center;">
    <img src="images/exam_3_q29.png" alt="exam_3_q29" style="border-radius: 10px; width: 60%;">
</div>

### Q30

<div style="text-align: center;">
    <img src="images/exam_3_q30.png" alt="exam_3_q30" style="border-radius: 10px; width: 60%;">
</div>

### Q38

> VPC sharing does not make the entire VPC visible or usable to other accounts. Instead, you explicitly share selected subnets within a VPC.

<div style="text-align: center;">
    <img src="images/exam_3_q38.png" alt="exam_3_q38" style="border-radius: 10px; width: 60%;">
</div>

### Q40

<div style="text-align: center;">
    <img src="images/exam_3_q40.png" alt="exam_3_q40" style="border-radius: 10px; width: 60%;">
</div>

### Q43

<div style="text-align: center;">
    <img src="images/exam_3_q43.png" alt="exam_3_q43" style="border-radius: 10px; width: 60%;">
</div>

### Q46

> AWS Resource Access Manager (RAM):
>
> - RAM is used for sharing resources, not deploying infrastructure.
> - It does not deploy templates or enforce configurations.

<div style="text-align: center;">
    <img src="images/exam_3_q46.png" alt="exam_3_q46" style="border-radius: 10px; width: 60%;">
</div>

### Q51 😱

> Me and ChatGpt chosen DynamoDb

<div style="text-align: center;">
    <img src="images/exam_3_q51.png" alt="exam_3_q51" style="border-radius: 10px; width: 60%;">
</div>

### Q55

> 1. **"When you cancel an active spot request, it terminates the associated instance as well"** ❌
>
>    - **Incorrect**. Canceling the spot request **does not automatically terminate** the running instance. You must terminate it separately.
>
> 2. **"When you cancel an active spot request, it does not terminate the associated instance"** ✅
>
>    - **Correct**. Canceling the request **leaves the instance running**, and it must be terminated manually if desired.
>
> 3. **"If a spot request is persistent, then it is opened again after your Spot Instance is interrupted"** ✅
>
>    - **Correct**. A **persistent** spot request automatically attempts to launch a replacement instance if the previous one is interrupted (e.g., due to capacity).
>
> 4. **"Spot Fleets cannot maintain target capacity by launching replacement instances after Spot Instances in the fleet are terminated"** ❌
>
>    - **Incorrect**. Spot Fleets **can** automatically launch replacement instances to maintain target capacity.
>
> 5. **"If a spot request is persistent, then it is opened again after you stop the Spot Instance"** ❌
>
>    - **Incorrect**. **Stopping** a Spot Instance is not the same as **interruption**; AWS does not allow manual stopping of spot instances unless hibernation is enabled and supported.
>
> 6. **"Spot Fleets can maintain target capacity by launching replacement instances after Spot Instances in the fleet are terminated"** ✅
>
>    - **Correct**. Spot Fleets are designed to automatically **replace interrupted or terminated instances** to maintain the desired capacity.

<div style="text-align: center;">
    <img src="images/exam_3_q55.png" alt="exam_3_q55" style="border-radius: 10px; width: 60%;">
</div>

### Q64

<div style="text-align: center;">
    <img src="images/exam_3_q64.png" alt="exam_3_q64" style="border-radius: 10px; width: 60%;">
</div>

## Correct Answers

### Q65

<div style="text-align: center;">
    <img src="images/exam_3_q65.png" alt="exam_3_q65" style="border-radius: 10px; width: 60%;">
</div>
