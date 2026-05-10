---
tags:
  - aws
  - aws/exam
  - aws/cert/aws-saa
  - aws/cert/stephane-mareek
aliases:
---

# Exam 1

## Incorrect Answer

### Q2

<div style="text-align: center;">
    <img src="images/exam_1_q2.png" alt="exam_1_q2" style="border-radius: 10px; width: 60%;">
</div>

---

### Q6

<div style="text-align: center;">
    <img src="images/exam_1_q6.png" alt="exam_1_q6" style="border-radius: 10px; width: 60%;">
</div>

---

### Q11

<div style="text-align: center;">
    <img src="images/exam_1_q11.png" alt="exam_1_q11" style="border-radius: 10px; width: 60%;">
</div>

---

### Q12

<div style="text-align: center;">
    <img src="images/exam_1_q12.png" alt="exam_1_q12" style="border-radius: 10px; width: 60%;">
</div>

---

### Q14

<div style="text-align: center;">
    <img src="images/exam_1_q14.png" alt="exam_1_q14" style="border-radius: 10px; width: 60%;">
</div>

---

### Q16

> - Since the application replicates the dataset across instances, durability isn’t a concern — which is important because instance store data is lost when an instance is stopped or terminated.
>
> - Instance Store volumes (a.k.a. ephemeral storage) are physically attached SSDs or NVMe devices, offering very high IOPS and low latency — ideal for high random I/O workloads.

---

<div style="text-align: center;">
    <img src="images/exam_1_q16.png" alt="exam_1_q16" style="border-radius: 10px; width: 60%;">
</div>

---

### Q20

<div style="text-align: center;">
    <img src="images/exam_1_q20.png" alt="exam_1_q20" style="border-radius: 10px; width: 60%;">
</div>

---

### Q25

> - AWS Shield Advanced has a monthly subscription fee of \$3,000 per account per organization, regardless of how many resources are protected within that account.
>
> - However, if you use AWS Organizations with consolidated billing, you are only charged once per organization — not per individual account.
>
> - Therefore, not enabling consolidated billing results in each account being charged the full fee, leading to unexpectedly high costs.

---

<div style="text-align: center;">
    <img src="images/exam_1_q25.png" alt="exam_1_q25" style="border-radius: 10px; width: 60%;">
</div>

---

### Q33

> Me and ChatGpt Agree that my answer is correct. But the trick here in the size of test files.

| Storage Type     | Cost Per GB/Month              | Total Cost for 1 GB Test File             |
| ---------------- | ------------------------------ | ----------------------------------------- |
| **S3 Standard**  | \~\$0.023                      | **\$0.023**                               |
| **EFS Standard** | \~\$0.30                       | **\$0.30**                                |
| **EBS (gp2)**    | \~\$0.10 \* 100 GB provisioned | **\$10.00** (charged on provisioned size) |

---

<div style="text-align: center;">
    <img src="images/exam_1_q33.png" alt="exam_1_q33" style="border-radius: 10px; width: 60%;">
</div>

### Q49

<div style="text-align: center;">
    <img src="images/exam_1_q49.png" alt="exam_1_q49" style="border-radius: 10px; width: 60%;">
</div>

---

### Q51

> - S3 One Zone-IA is Cheaper
>
>   - ~20% cheaper than S3 Standard-IA.
>   - Since the assets are re-creatable, the lower resilience of One Zone-IA (single AZ storage) is acceptable.
>
> - Minimum 30-Day Requirement
>
>   - S3 One Zone-IA has a 30-day minimum storage duration, so transitioning earlier (e.g., at 7 days) would incur early deletion charges.
>   - Therefore, waiting 30 days avoids penalties.

---

<div style="text-align: center;">
    <img src="images/exam_1_q51.png" alt="exam_1_q51" style="border-radius: 10px; width: 60%;">
</div>

---

### Q58 😱

<div style="text-align: center;">
    <img src="images/exam_1_q58.png" alt="exam_1_q58" style="border-radius: 10px; width: 60%;">
</div>

---

### Q60

> - Minimal application refactoring — which means staying within the same database engine where possible (Aurora)

---

<div style="text-align: center;">
    <img src="images/exam_1_q60.png" alt="exam_1_q60" style="border-radius: 10px; width: 60%;">
</div>

---

### Q62

> **When you copy an AMI across regions, AWS:**
>
> - Copies the snapshot(s) backing the AMI into the target region (Region B)
> - Registers a new AMI in Region B that points to the new snapshot
> - So yes, a new snapshot is created in Region B as part of this AMI copy process

---

<div style="text-align: center;">
    <img src="images/exam_1_q62.png" alt="exam_1_q62" style="border-radius: 10px; width: 60%;">
</div>

## Correct Answer

### Q32

<div style="text-align: center;">
    <img src="images/exam_1_q32.png" alt="exam_1_q32" style="border-radius: 10px; width: 60%;">
</div>

---

### Q35

<div style="text-align: center;">
    <img src="images/exam_1_q35.png" alt="exam_1_q35" style="border-radius: 10px; width: 60%;">
</div>

---

### Q37

<div style="text-align: center;">
    <img src="images/exam_1_q37.png" alt="exam_1_q37" style="border-radius: 10px; width: 60%;">
</div>

---

### Q42

<div style="text-align: center;">
    <img src="images/exam_1_q42.png" alt="exam_1_q42" style="border-radius: 10px; width: 60%;">
</div>

---

### Q57

<div style="text-align: center;">
    <img src="images/exam_1_q57.png" alt="exam_1_q57" style="border-radius: 10px; width: 60%;">
</div>
---

## Related Notes
- [[aws-exams/aws-saa/1-stephane-mareek/exam-0|Course Exam]] - previous lesson
- [[aws-exams/aws-saa/1-stephane-mareek/exam-2|Exam 2]] - next lesson
- [[aws-services/1.management-governance/2.1.organizations/1.aws-organizations|AWS Organizations The Smart Way to Manage Multiple AWS Accounts]] - mentions AWS Organizations
- [[aws-services/5.compute/1.1.ec2/2.2.instance-store|Amazon EC2 Instance Store Ephemeral Storage]] - mentions Instance Store
- [[aws-services/5.compute/2.ebs/4.1.snapshot|Amazon EBS Snapshots Efficient Scalable Backup for Your Volumes]] - mentions Snapshot
- [[aws-services/5.compute/2.ebs/1.1.ebs|Amazon EBS Elastic Block Store Scalable Persistent Storage for EC2]] - mentions EBS
- [[aws-services/4.storage/2.1.efs/2.1.efs|Amazon Elastic File System EFS]] - mentions EFS

---
