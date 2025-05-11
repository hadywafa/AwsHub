# Course Exam

## Incorrect Answer

### Q2

![exam_1_q2](images/exam_1_q2.png)

---

### Q6

![exam_1_q6](images/exam_1_q6.png)

---

### Q11

![exam_1_q11](images/exam_1_q11.png)

---

### Q12

![exam_1_q12](images/exam_1_q12.png)

---

### Q14

![exam_1_q14](images/exam_1_q14.png)

---

### Q16

> - Since the application replicates the dataset across instances, durability isn’t a concern — which is important because instance store data is lost when an instance is stopped or terminated.
>
> - Instance Store volumes (a.k.a. ephemeral storage) are physically attached SSDs or NVMe devices, offering very high IOPS and low latency — ideal for high random I/O workloads.

![exam_1_q16](images/exam_1_q16.png)

---

### Q20

![exam_1_q20](images/exam_1_q20.png)

---

### Q25

> - AWS Shield Advanced has a monthly subscription fee of \$3,000 per account per organization, regardless of how many resources are protected within that account.
>
> - However, if you use AWS Organizations with consolidated billing, you are only charged once per organization — not per individual account.
>
> - Therefore, not enabling consolidated billing results in each account being charged the full fee, leading to unexpectedly high costs.

![exam_1_q25](images/exam_1_q25.png)

---

### Q33

> Me and ChatGpt Agree that my answer is correct. But the trick here in the size of test files.

| Storage Type     | Cost Per GB/Month              | Total Cost for 1 GB Test File             |
| ---------------- | ------------------------------ | ----------------------------------------- |
| **S3 Standard**  | \~\$0.023                      | **\$0.023**                               |
| **EFS Standard** | \~\$0.30                       | **\$0.30**                                |
| **EBS (gp2)**    | \~\$0.10 \* 100 GB provisioned | **\$10.00** (charged on provisioned size) |

![exam_1_q33](images/exam_1_q33.png)

### Q49

![exam_1_q49](images/exam_1_q49.png)

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

![exam_1_q51](images/exam_1_q51.png)

---

### Q58 😱

![exam_1_q58](images/exam_1_q58.png)

---

### Q60

> - Minimal application refactoring — which means staying within the same database engine where possible (Aurora)

![exam_1_q60](images/exam_1_q60.png)

---

### Q62

> **When you copy an AMI across regions, AWS:**
>
> - Copies the snapshot(s) backing the AMI into the target region (Region B)
> - Registers a new AMI in Region B that points to the new snapshot
> - So yes, a new snapshot is created in Region B as part of this AMI copy process

![exam_1_q62](images/exam_1_q62.png)

## Correct Answer

### Q32

![exam_1_q32](images/exam_1_q32.png)

---

### Q35

![exam_1_q35](images/exam_1_q35.png)

---

### Q37

![exam_1_q37](images/exam_1_q37.png)

---

### Q42

![exam_1_q42](images/exam_1_q42.png)

---

### Q57

![exam_1_q57](images/exam_1_q57.png)
