# 🚦 **AWS Limits (Quotas)**

## 🧭 **1. API Rate Limits (Per-Second Quotas)**

> AWS services limit the number of **API calls per second** to protect infrastructure.

### 🛑 Common Limits

| API                       | Limit                        |
| ------------------------- | ---------------------------- |
| `DescribeInstances` (EC2) | 100 calls per second         |
| `GetObject` (S3)          | 5500 GETs/sec **per prefix** |

### 📌 What If You Hit the Limit?

- 🔁 **Intermittent errors?** → Use **Exponential Backoff**
- 🔒 **Consistent throttling?** → Request a **limit increase**

---

## 🏛️ **2. AWS Service Quotas (aka Service Limits)**

> AWS limits the **resources you can create** (e.g., vCPUs, buckets, IPs).

### 🧱 Examples

| Resource                           | Default Quota   |
| ---------------------------------- | --------------- |
| On-Demand EC2 Instances (Standard) | 1152 vCPUs      |
| S3 Buckets                         | 100 per account |

### 📥 How to Increase

- ✅ Go to **Service Quotas Console**
- ✅ Or use the **Service Quotas API**
- ✅ Or open a **support ticket**

---

## 🔁 **3. Exponential Backoff (Retry Logic)**

> A strategy to retry failed API requests by **waiting longer between attempts**.

### 🧠 Use it when

- You get **`ThrottlingException`**
- You get **5xx Server Errors**

### 🚫 Don’t retry on

- ❌ 4xx client errors (like `AccessDenied`, `ValidationError`)

### 🛠️ Good to Know

- AWS SDKs **already implement it** by default
- Only add it manually if using **raw HTTP requests** or custom retry logic

### 🧪 Example: Python Exponential Backoff with EC2 `DescribeInstances`

```python
import boto3
import time
import botocore.exceptions

ec2 = boto3.client("ec2")

MAX_RETRIES = 5

for attempt in range(1, MAX_RETRIES + 1):
    try:
        response = ec2.describe_instances()
        print("Success:", response)
        break  # Exit if successful
    except botocore.exceptions.ClientError as e:
        error_code = e.response["Error"]["Code"]

        # Retry only on throttling or 5xx
        if error_code == "ThrottlingException" or error_code.startswith("5"):
            wait_time = 2 ** attempt  # exponential: 2, 4, 8, 16...
            print(f"Retrying in {wait_time} seconds...")
            time.sleep(wait_time)
        else:
            raise  # Don't retry on 4xx errors
```

---

## ✅ Summary Table

| Topic            | Key Point                                                    |
| ---------------- | ------------------------------------------------------------ |
| API Rate Limit   | `DescribeInstances` = 100/sec; S3 = 5500 GETs/sec per prefix |
| Throttling Error | Use **Exponential Backoff**                                  |
| Service Quotas   | EC2 vCPUs = 1152 by default                                  |
| Increase Quotas  | Use **Service Quotas Console or API**                        |
| Retry only on    | `5xx` errors and `ThrottlingException`                       |
