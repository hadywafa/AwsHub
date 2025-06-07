# 📖 AWS Lambda Notes

## 📌 Notes Related To Lambda Containers

> ✍️ To deploy a container image to Lambda, the container image must implement the Lambda Runtime API.  
> ✍️ You can deploy Lambda function as container image with the maximum size of 10GB.
> ❌ AWS Lambda service does not support Lambda functions that use multi-architecture container images (e.g., `amd64` and `arm64`).

Here’s your enhanced, cleanly formatted, and visually structured version of the **"AWS Lambda Limits to Know"** section — styled for clarity, readability, and consistency with your preferred tone:

---

## 🚦 **AWS Lambda Limits to Know (Per Region)**

Understanding these limits is essential for designing **efficient, scalable, and error-free** Lambda applications.

---

### ⚙️ **Execution Limits**

| 🧱 **Limit**                 | 📌 **Details**                                                              |
| ---------------------------- | --------------------------------------------------------------------------- |
| **Memory Allocation**        | 128 MB to **10 GB** in 1 MB increments                                      |
| **Max Execution Time**       | Up to **900 seconds (15 minutes)**                                          |
| **Environment Variables**    | Max size: **4 KB (combined key/values)**                                    |
| **/tmp Storage (Ephemeral)** | From **512 MB up to 10 GB** (adjustable)                                    |
| **Concurrency (per region)** | Default: **1,000 concurrent executions** (request limit increase if needed) |

---

### 📦 **Deployment Limits**

| 📁 **Limit**                                | 📌 **Details**                                 |
| ------------------------------------------- | ---------------------------------------------- |
| **Deployment Package Size (.zip)**          | Max: **50 MB (compressed)** via direct upload  |
| **Uncompressed Size (code + dependencies)** | Max: **250 MB** total                          |
| **/tmp Directory Use**                      | Can load & extract additional files at startup |
| **Environment Variables Storage**           | Max: **4 KB** total (key + value)              |

---

### 💡 **Tips**

- Use **Amazon S3** to deploy larger packages.
- Store large secrets/configs in **Secrets Manager** or **SSM Parameter Store** instead of env vars.
- Use **EFS** or **S3** for large file operations instead of overloading `/tmp`.
- For **high concurrency**, request a **service quota increase** via the AWS Console.

---

## ✅ **AWS Lambda Best Practices**

### ⚙️ Perform heavy-duty work **outside** of your function handler

- Connect to databases outside your function handler
- Initialize the AWS SDK outside your function handler
- Pull in dependencies or datasets outside your function handler

### 🔐 Use environment variables for

- Database connection strings, S3 bucket names, API keys, etc. (❌ Don’t hardcode!)
- Passwords or sensitive values (✅ Encrypt them using **AWS KMS**)

### 📦 Minimize your deployment package size

- Break down large functions into smaller logical units
- Keep AWS Lambda [limits](https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-limits.html) in mind
- Use **Lambda Layers** to share dependencies across functions

### 🚫 Avoid recursion

- Never allow a Lambda function to **invoke itself** recursively—it can lead to runaway costs and infinite loops
