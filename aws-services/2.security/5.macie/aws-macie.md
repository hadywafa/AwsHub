---
tags:
  - aws
  - aws/service
  - aws/domain/security
  - aws/topic/macie
aliases:
  - "AWS Macie Data Security and Privacy"
  - "AWS Macie"
---

# 🪣🛡️ AWS Macie: Data Security and Privacy

## ❓ What is AWS Macie?

**Amazon Macie** is a fully managed data security and data privacy service that helps you discover and protect sensitive data stored in AWS. It uses advanced machine learning and pattern matching techniques to identify and secure your data.

---

<div align="center">
  <img src="images/aws-macie-overview.png" alt="AWS Macie" style="border-radius: 20px" />
</div>

---

## 🛠️ Key Features of AWS Macie

- **Data Discovery:** Utilizes machine learning and pattern matching to find and protect sensitive data, such as Personally Identifiable Information (PII).
- **S3 Bucket Inventory:** Automatically provides an inventory of `S3 buckets` that are:
  - **Unencrypted**
  - **Publicly Accessible**
  - **Shared with other AWS accounts outside of your AWS Organizations**

## 🚨 How AWS Macie Works

- **Data Discovery Jobs:** Macie runs data discovery jobs to identify and notify you about sensitive data.
- **Findings and Alerts:** Generates findings which can be sent to Amazon EventBridge or Security Hub.
  - **EventBridge Integration:** Findings sent to EventBridge can trigger step functions to activate remediation actions.
  - **Security Hub Integration:** Findings can also be sent to Security Hub for centralized management.

### 🌟 Benefits of AWS Macie

- **Automated Data Protection:** Automatically scans and protects your data without manual intervention.
- **Multi-Account Support:** Can be used across multiple accounts or an entire AWS organization from a single Macie account.
- **Enhanced Security:** Helps you maintain data security and compliance by identifying risks in your AWS environment.
---

## Related Notes
- [[aws-services/1.management-governance/2.1.organizations/1.aws-organizations|AWS Organizations The Smart Way to Manage Multiple AWS Accounts]] - mentions AWS Organizations
- [[aws-services/7.application-integration/step-functions/1.step-functions|AWS Step Functions Orchestrate Your Serverless Workflows with Ease]] - mentions Step Functions

---
