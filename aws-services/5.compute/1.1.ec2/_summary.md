---
tags:
  - aws
  - aws/service
  - aws/domain/compute
  - aws/topic/ec2
aliases:
  - "Amazon EC2 Elastic Compute Cloud"
---

# 💻 **Amazon EC2 (Elastic Compute Cloud)**

## 📝 **1. Overview**

- **Resizable Compute Capacity:** EC2 provides scalable virtual servers in the AWS cloud, allowing users to adjust resources based on demand.
- **Use Cases:** Ideal for web hosting, application servers, data processing, and more.

## 👜 **2. Compute Capacity**

- **EC2 Instance Types:** A variety of instance types optimized for different use cases:
  - **General Purpose (e.g., t3, m5):** Balanced compute, memory, and networking resources.
  - **Compute Optimized (e.g., c5):** High-performance processors for compute-intensive tasks.
  - **Memory Optimized (e.g., r5):** Enhanced memory for large datasets and in-memory applications.
  - **Storage Optimized (e.g., i3):** High I/O performance for storage-heavy applications.
  - **Accelerated Computing (e.g., p3, g4):** GPU-powered instances for graphics and machine learning workloads.

## 🔐 **3. Access and Control**

- **Root Access:** AWS customers have full administrative (root) access to each EC2 instance they create.
- **Instance Lifecycle Management:**
  - **Actions:** Instances can be stopped, restarted, rebooted, or terminated as needed.
  - **Instance Limits:** Default soft limit of 20 EC2 instances per account (can be increased upon request).

## 🌐 **4. Networking**

- **Elastic Network Interface (ENI):** Each EC2 instance is launched with at least one ENI, serving as a virtual network interface.
- **IP Addressing:**
  - **Private IPv4:** Each instance requires at least one private IP within a subnet in an Availability Zone.
  - **Public IP:** Optional, needed for internet access.
- **Virtual Private Cloud (VPC):** EC2 instances reside within a VPC, allowing for network configuration and isolation.

## 🏠 **5. Hosting Options**

- **Shared Hosts:**
  - **Multi-Tenancy:** Instances run on shared physical servers with other AWS customers.
- **Dedicated Hosts:**
  - **Single Tenant:** Physical servers dedicated to a single customer, useful for compliance and licensing requirements.

## 💾 **6. Storage Options**

- **Elastic Block Store (EBS):**
  - **Persistent Storage:** Data remains intact even if the instance is stopped or terminated.
  - **EBS-Backed Instances:** Instances boot from EBS volumes.
  - **Features:** Snapshots, encryption, various volume types (e.g., General Purpose SSD, Provisioned IOPS SSD).
- **Instance Store:**
  - **Ephemeral Storage:** Temporary storage tied to the lifecycle of the instance; data is lost if the instance is stopped or terminated.
  - **Instance Store-Backed Instances:** Instances boot from instance store volumes.
  - **Performance:** Typically faster access compared to EBS.
  - **Use Cases:** Temporary data, caches, buffers, or as root volumes in distributed architectures.

## 🔒 **7. Security and Access**

- **SSH Access (Linux Instances):**
  - **Encrypted Connections:** SSH encrypts all data transmitted between the client and server.
  - **Authentication:** Managed through Key Pairs (public/private keys), eliminating the need for passwords.
- **EC2 Instance Connect:**
  - **Access Method:** Connect via the AWS Management Console without needing SSH keys.
  - **Requirements:**
    - Instance must have a public IP address.
    - Use Linux 2 AMI version 2.0.20190618 or later, or install the EC2 Connect package for earlier versions.
    - Proper IAM permissions.
    - Security group must allow SSH inbound traffic from AWS IP ranges.

## 🗝️ **8. Key Pair Management**

- **Creation and Usage:**
  - **During Launch:** Users must create or select a Key Pair to enable SSH access.
  - **Private Key:** Downloadable only once at creation; essential for SSH access.
  - **Public Key:** Automatically stored on the instance in the `.ssh/authorized_keys` file.
- **Managing Keys:**
  - **Adding Keys:** Connect to your instance and add new public keys by updating the `authorized_keys` file.
  - **Lost Private Key:** If lost, accessing your instance is restricted. Workarounds include creating an AMI from the instance and launching a new instance with a new key pair.

## 🖥️ **9. Instance Types and Families**

- **General Purpose:** Balanced like a gymnast—versatile and reliable (e.g., t3, m5).
- **Compute Optimized:** Powerhouses for CPU-heavy tasks (e.g., c5).
- **Memory Optimized:** Perfect for memory-hungry applications (e.g., r5).
- **Storage Optimized:** Designed for high I/O performance (e.g., i3).
- **Accelerated Computing:** GPU-powered instances for graphics and machine learning workloads (e.g., p3, g4).

## 💲 **10. Pricing Models**

- **On-Demand Instances:** Pay for compute capacity by the hour or second without long-term commitments.
- **Reserved Instances:** Commit to a one or three-year term for significant discounts compared to on-demand pricing.
- **Spot Instances:** Bid for unused EC2 capacity at reduced rates, suitable for flexible and fault-tolerant workloads.
- **Savings Plans:** Flexible pricing model offering lower rates in exchange for a commitment to usage over a specified period.

## 📈 **11. High Availability and Scalability**

- **Auto Scaling:**
  - **Automatic Scaling:** Adjusts the number of instances based on demand and predefined policies.
  - **Scaling Policies:** Define actions based on metrics like CPU utilization.
- **Elastic Load Balancing (ELB):**
  - **Distributes Incoming Traffic:** Balances traffic across multiple EC2 instances to ensure fault tolerance and high availability.

## 📊 **12. Monitoring and Management**

- **Amazon CloudWatch:**
  - **Metrics & Alarms:** Monitor performance metrics and set alarms for specific thresholds.
  - **Logs:** Collect and monitor log files from instances.
- **AWS Systems Manager:**
  - **Centralized Management:** Automate operational tasks and manage configurations across multiple instances.

## 🌍 **13. Elastic IP Addresses**

- **Static Public IP:** Elastic IPs are persistent and can be associated with instances as needed.
- **Remapping:** Can be reassigned to different instances, ensuring consistent IP addressing for applications even if instances are replaced.

## 🖥️ **14. Amazon Machine Images (AMIs)**

- **Pre-Configured Templates:** Include the operating system, software, and configurations required to launch EC2 instances.
- **Custom AMIs:** Users can create their own AMIs to standardize deployments across multiple instances, enhancing consistency and efficiency.

## 🛡️ **15. Best Practices**

- **Security:**
  - **Principle of Least Privilege:** Use IAM roles and policies to restrict access.
  - **Regular Updates:** Keep instances updated with the latest security patches to protect against vulnerabilities.
- **Cost Optimization:**
  - **Right-Sizing:** Choose appropriate instance types based on workload requirements to avoid over-provisioning.
  - **Utilize Reserved Instances or Savings Plans:** For predictable, long-term workloads to reduce costs.
- **Backup and Recovery:**
  - **Regular EBS Snapshots:** Back up data to ensure durability and facilitate recovery.
  - **Multi-AZ Deployments:** Deploy instances across multiple Availability Zones to enhance availability and fault tolerance.

---

## 📌 **Final Tips – Mastering EC2**

- **🔧 Hands-On Practice:** Launch, configure, and manage EC2 instances using the AWS Management Console and AWS CLI to gain practical experience.
- **📚 Understand Use Cases:** Be able to determine when to use specific EC2 features based on different architectural scenarios.
- **🆕 Stay Updated:** AWS services evolve continuously. Regularly refer to the [official AWS EC2 documentation](https://docs.aws.amazon.com/ec2/) for the latest information and best practices.
---

## Related Notes
- [[aws-services/5.compute/1.1.ec2/|Index]] - folder map
- [[aws-services/5.compute/1.1.ec2/1.1.hypervisor|Hypervisors in AWS Xen vs Nitro Deep & Clear]] - next lesson
- [[ا-delete-me/networking-basics|Virtual Private Cloud]] - mentions Virtual Private Cloud
- [[aws-services/5.compute/1.1.ec2/8.1.instance-lifecycle|Amazon EC2 Instance Lifecycle Explained Visually & Simply]] - mentions Instance Lifecycle
- [[aws-daily/aws-waf/5.1.cost-optimization|Cost Optimization]] - mentions Cost Optimization
- [[aws-services/5.compute/1.1.ec2/5.4.spot-instances|EC2 Spot Instances Maximum Savings Minimal Waste]] - mentions Spot Instances
- [[aws-services/5.compute/1.1.ec2/2.2.instance-store|Amazon EC2 Instance Store Ephemeral Storage]] - mentions Instance Store
- [[aws-services/5.compute/1.1.ec2/2.3.instance-types|Amazon EC2 Instance Types Explained Clearly]] - mentions Instance Types
- [[aws-services/4.storage/1.s3/2.5.encryption|Amazon S3 Encryption]] - mentions Encryption
- [[aws-services/10.developer/1.1.aws-cli/aws-cli|AWS Cli]] - mentions AWS Cli
- [[aws-services/8.database/dynamodb/1.4.backup|AWS DynamoDB Backup]] - mentions Backup
- [[aws-services/1.management-governance/1.cloudformation/.docs|CND Useful References]] - mentions Docs

---
