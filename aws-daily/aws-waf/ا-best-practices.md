---
tags:
  - aws
  - aws/daily
  - aws/topic/aws-waf
aliases:
  - "AWS Best Practices - Architecture For The Cloud"
  - "ا Best Practices"
---

# AWS Best Practices - Architecture For The Cloud

## 1.Use Higher Level Managed Resources

- They are designed to be scalable and highly available; therefore, they can reduce
  risk and lower operational complexity and cost.

## 2.Optimize for Cost

- Be mindful of the cost of the architecture on AWS.

## 3.Scalability

## 4.Disposable resources instead of fixed servers (Immutable Infrastructures)

- Improve the the operation of the resources by using Bootstrapping, Golden Image
  to launch new resources instead of patching existing resources.

## 5.Loose coupling

- Reduce dependencies between workload components.

## 6.Services, Not Servers

- Use Managed Services and Serverless when possible.

## 7.Managing Increasing Volumes of Data

- Data Lakes

## 8.Removing Single Points of Failure

- Automate recovery and reduce disruptions.
- High Availability, Health checks, Fault Tolerance, Multi Regions.

## 9.Caching

- To improve application performance

## 10.Security

- VPC security, IAM, WAF, Encryption, Least privilege access, logging and Auditing.
---

## Related Notes
- [[aws-daily/aws-waf/6.1.sustainability|Sustainability]] - previous lesson
- [[aws-daily/aws-waf/اا-immutable-infrastructures-architecture|Immutable Infrastructures Architecture]] - next lesson
- [[aws-services/4.storage/1.s3/2.5.encryption|Amazon S3 Encryption]] - mentions Encryption
- [[aws-daily/aws-architectures/3.1.serverless|Server-Based Architectures vs. Serverless Computing]] - mentions Serverless
- [[aws-services/10.developer/1.4.aws-sam/1.serverless|The Ultimate Guide to Serverless Computing & Tools]] - mentions Serverless
- [[aws-services/2.security/1.1.iam/1.fundmmentals/1.2.iam|AWS Identity and Access Management IAM]] - mentions IAM

---
