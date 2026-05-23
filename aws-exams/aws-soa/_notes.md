---
tags:
  - aws
  - aws/exam
  - aws/cert/aws-soa
aliases:
  - "Hady Wafa Notes"
---

# Hady Wafa Notes

## 📌 1. AWS RAM is used to **share resources** (e.g., VPCs, subnets, Transit Gateways), **not for deploying IAM roles** or managing permissions.

## 📌 2. If there is at least one healthy target in a target group, the load balancer routes requests only to the healthy targets. If a target group contains only unhealthy targets, the load balancer routes requests to the unhealthy targets.

- Hence, it is advised to configure an Auto Scaling Group, if the instances are hosting a business-critical application.

## 📌 3. change sets being deleted by CloudFormation after it successfully executes

## 📌 4. Traffic between two EC2 instances in the same AWS Region stays within the AWS network, even when it goes over public IP addresses

## 📌 5. Traffic between EC2 instances in different AWS Regions stays within the AWS network, if there is an Inter-Region VPC Peering connection (using transit gateways) between the VPCs where the two instances reside

## 📌 6. The **default security group**:

- **Inbound traffic**: all inbound traffic is blocked
- **Outbound traffic**: all outbound traffic is allowed.

## 📌 7. Steps to Encrypt an Unencrypted RDS Instance (Multi-AZ Compatible):

1. **Create a Snapshot**: Take a manual snapshot of your unencrypted RDS instance.

2. **Copy the Snapshot with Encryption Enabled**

   - Go to the snapshot in the AWS Console.
   - Choose **Copy Snapshot**.
   - In the copy settings, enable **Encryption** and select a KMS key (you can use the default or a custom one).

3. **Restore a New DB Instance from the Encrypted Snapshot**

   - Use the encrypted snapshot to create a new RDS instance.
   - During the restore process, choose **Multi-AZ deployment** if needed.
   - Configure other settings to match your original instance.

4. **Redirect Traffic**: Once the new encrypted instance is up and running, update your application or DNS to point to the new endpoint.

5. **Clean Up**: After verifying everything works, you can delete the old unencrypted instance and its snapshot.

## 📌 What is S3 Express One Zone?

It’s a **high-performance, single-AZ storage class** built for applications that need **consistent single-digit millisecond access times**. Think of it as the speedster of S3 storage classes—up to **10x faster** than S3 Standard for certain workloads.

### 🧠 Why it’s special for HPC and EC2

- **Same-AZ placement**: You can co-locate your S3 Express bucket and EC2 HPC instance in the _same Availability Zone_, minimizing network hops and latency.
- **Directory buckets**: Unlike traditional S3 buckets, Express One Zone uses a new bucket type that supports up to **2 million requests per second** and session-based authentication.
- **Lower request costs**: Up to **80% cheaper** on request pricing compared to S3 Standard, which is a big win for high-frequency access patterns.

### 🛠️ Use Cases

Perfect for:

- HPC workloads
- Real-time analytics
- AI/ML training pipelines
- Financial modeling or genomics
---

## Related Notes
- [[aws-exams/aws-soa/1.ex1|Exam 1]] - next lesson
-[[1.1.cfn|AWS CloudFormation]]] - mentions CloudFormation
- [[aws-services/3.network/1.vpc/1.fundmentals/4.1.vpc-peering|VPC Peering]] - mentions VPC Peering
- [[aws-services/4.storage/1.s3/2.5.encryption|Amazon S3 Encryption]] - mentions Encryption
- [[aws-services/5.compute/2.ebs/4.1.snapshot|Amazon EBS Snapshots Efficient Scalable Backup for Your Volumes]] - mentions Snapshot
- [[aws-services/2.security/7.2.resource-access-manager/2.aws-ram|AWS Resource Access Manager RAM]] - mentions AWS Ram
- [[aws-services/2.security/1.1.iam/1.fundmmentals/1.2.iam|AWS Identity and Access Management IAM]] - mentions Iam

---
