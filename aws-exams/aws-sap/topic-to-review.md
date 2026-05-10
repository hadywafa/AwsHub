---
tags:
  - aws
  - aws/exam
  - aws/cert/aws-sap
aliases:
  - "AWS SAP Topics to Review"
  - "Topic To Review"
---

# AWS SAP Topics to Review

## **Advanced Policy Syntax** 👮

**References:**

[policies variables](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_variables.html)

## **AZ Name vs AZ ID** 🆔

An **Availability Zone ID** is a **unique, immutable identifier** for an AWS **Availability Zone (AZ)** within a region. Each AZ ID is consistent across accounts, ensuring that you can refer to the same physical infrastructure irrespective of account or region mapping differences.

For example:

- **Region**: `us-east-1`
- **Availability Zone Names**: `us-east-1a`, `us-east-1b`
- **Availability Zone IDs**: `use1-az1`, `use1-az2`

## **Revoking Temporary Credentials in AWS IAM** ⛔

Temporary credentials in AWS IAM provide short-term, limited access to AWS resources for users, roles, or services. These credentials are typically used when assuming a role or using AWS Security Token Service (STS). While they automatically expire after a set duration, you can mitigate their impact or restrict their use by implementing certain techniques.
---

## Related Notes
- [[aws-services/2.security/1.1.iam/2.2.role-based-policy/4.revoke-temporary-credential|Revoking Temporary Credentials in AWS IAM]] - mentions Revoking Temporary Credentials in AWS IAM
- [[aws-services/2.security/7.2.resource-access-manager/1.availability-zone-id|Availability Zone ID Ensuring Consistent Cloud Deployments]] - mentions Availability Zone Id
- [[aws-services/1.management-governance/1.cloudformation/.docs|CND Useful References]] - mentions Docs
- [[aws-services/2.security/1.1.iam/1.fundmmentals/1.2.iam|AWS Identity and Access Management IAM]] - mentions Iam

---
