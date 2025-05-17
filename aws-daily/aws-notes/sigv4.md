# 🔐 **AWS Signature Version 4 (SigV4) – How It Works & Where It’s Used**

> _SigV4 is the standard authentication method used across AWS APIs to verify identity, integrity, and permissions — all through cryptographic signing._

---

<div style="text-align: center;">
    <img src="images/sigv4.png" alt="sigv4" style="border-radius: 10px; width: 60%;">
</div>

---

<div style="text-align: center;">
    <img src="images/sigv4-examples.png" alt="sigv4-examples" style="border-radius: 10px; width: 60%;">
</div>

---

## 🧠 **What Is SigV4?**

**SigV4** is AWS’s **request signing protocol**. It ensures:

- ✅ The request is from a **trusted identity**
- 🔐 It hasn’t been **tampered** in transit
- ✅ The requester has the **correct IAM permissions**

It works by adding a **cryptographic signature** (based on your secret key) to the request — either in the **Authorization header** or as a **presigned URL query string**.

---

## 🛠️ **How SigV4 Works (Step-by-Step)**

<div align="center">

```mermaid
sequenceDiagram
    participant 🧠 as 🧠 Signer (CLI, SDK, app)
    participant 🌩️ as 🌩️ AWS API
    participant 🔐 as 🔐 IAM

    🧠->>🧠: Build Canonical Request (method, URI, headers, payload hash)
    🧠->>🧠: Create String to Sign (includes date, service, region)
    🧠->>🧠: Generate Signing Key (from secret access key 🔑)
    🧠->>🧠: Calculate HMAC-SHA256 Signature
    🧠->>🧠: Add signature to request (Authorization header or query string)
    🧠->>🌩️: Send signed request
    🌩️->>🔐: Validate signature + permissions
    alt Valid
        🌩️-->>🧠: Response ✅
    else Invalid/Expired
        🌩️-->>🧠: 403 Forbidden ❌
    end
```

</div>

---

## 🔍 **What Gets Signed?**

The signature covers:

- HTTP method (`GET`, `POST`, etc.)
- Canonical URI and query string
- Important headers (`host`, `x-amz-date`, etc.)
- Hashed body payload
- Date, region, service

> 🔐 **It’s tamper-proof** — any changes invalidate the signature.

---

## 📦 **Where SigV4 Is Used Across AWS**

### 🔹 1. 🧑‍💻 **AWS API Calls**

| Scenario                                    | SigV4 Role                                           |
| ------------------------------------------- | ---------------------------------------------------- |
| `aws s3 ls`, `aws ec2 describe-instances`   | CLI auto-signs each HTTP call using your credentials |
| SDK calls (`boto3`, `AWS SDK for JS`, etc.) | Automatically signs via built-in SigV4 signer        |

> ✅ You don’t need to handle signing manually unless you’re calling APIs via `curl` or custom HTTP clients.

---

### 🔹 2. 🗂️ **Amazon S3: Presigned URLs**

> **Presigned URLs** are time-limited, signed S3 links.

| Use Case                | Example                                     |
| ----------------------- | ------------------------------------------- |
| Share private image     | Generate presigned `GET` URL to `/file.jpg` |
| Upload file without IAM | Generate presigned `PUT` URL                |

🔐 These URLs contain:

- Signature
- Expiry timestamp
- Access key ID
- Signed headers

📎 Used in browsers or mobile apps to safely interact with **private S3**.

---

### 🔹 3. 🌍 **CloudFront: Origin Access Control (OAC)**

> CloudFront uses SigV4 to **authenticate itself** when accessing a private S3 origin.

| Behavior                           | SigV4 Role                                                        |
| ---------------------------------- | ----------------------------------------------------------------- |
| CloudFront fetches private S3 file | Signs the request with SigV4 using OAC                            |
| S3 bucket policy                   | Allows only signed requests from specific CloudFront distribution |

📦 The signature is added to the **Authorization header** and validated by S3 before serving the file.

> 🧱 This prevents **direct S3 access** and enforces that only **CloudFront can retrieve** your content.

---

## 📦 Use Case 1: Viewing an S3 Image via Signed URL

### ✅ Scenario

You want to **show a private image** stored in S3 **to the browser**, so you generate a **presigned URL** using SigV4.

---

### 🧭 SigV4 Workflow with S3 Presigned URL

<div align="center">

```mermaid
sequenceDiagram
    participant 👤 as User (Browser)
    participant 🧠 as App Server (Signer)
    participant 🪣 as S3 Bucket (Private)

    👤->>🧠: Request image access
    🧠->>🧠: Generate SigV4 Presigned URL 🔐
    🧠-->>👤: Return presigned URL (with signature + expiry)
    👤->>🪣: Send GET /image.jpg?Signature=... 🔑
    🪣->>🪣: Verify Signature + Expiry
    alt Signature valid
        🪣-->>👤: Serve image ✅
    else Invalid/Expired
        🪣-->>👤: 403 Forbidden ❌
    end
```

</div>

---

### 💡 Key Points

| Component           | Role                                                  |
| ------------------- | ----------------------------------------------------- |
| App Server          | Uses AWS SDK to create **presigned URL** (SigV4)      |
| Browser             | Just uses the URL to fetch the image (no credentials) |
| S3 Bucket (private) | Verifies signature before serving the object          |

---

## 🌍 Use Case 2: CloudFront Fetching from Private S3 via OAC

### ✅ Scenario

You have a **private S3 bucket**, and CloudFront is configured with an **Origin Access Control (OAC)** to fetch content securely using **SigV4**.

---

### 🧭 SigV4 Workflow with CloudFront OAC → S3

<div align="center">

```mermaid
sequenceDiagram
    participant 👤 as User (Browser)
    participant 🌍 as CloudFront (Private Distribution)
    participant 🪣 as S3 Bucket (Private)
    participant 🔐 as OAC (Signing Layer)

    👤->>🌍: Request /logo.png
    🌍->>🔐: Sign request using OAC (SigV4)
    🔐-->>🌍: Add Authorization header with signature
    🌍->>🪣: GET /logo.png with signed headers 🔏
    🪣->>🪣: Verify CloudFront's signature and SourceArn
    alt Signature valid & SourceArn matches
        🪣-->>🌍: Return object ✅
        🌍-->>👤: Serve image
    else Denied
        🪣-->>🌍: 403 Forbidden ❌
        🌍-->>👤: Access Denied
    end
```

</div>

---

### 💡 Key Points

| Component           | Role                                                  |
| ------------------- | ----------------------------------------------------- |
| CloudFront          | Acts on behalf of the user                            |
| OAC                 | Automatically signs origin requests using SigV4       |
| S3 Bucket (private) | Accepts only signed requests from **that CloudFront** |

---

## ✅ TL;DR – SigV4 In a Nutshell

| Feature            | Purpose                                |
| ------------------ | -------------------------------------- |
| SigV4 Algorithm    | HMAC-SHA256-based request signing      |
| Signature Includes | Headers, method, URI, body hash        |
| Who Uses It?       | CLI, SDKs, signed URLs, CloudFront     |
| Manual Use Cases   | Raw HTTP calls or temporary access     |
| Benefits           | Identity verification + data integrity |

---

## 🔒 Summary Table: How AWS Services Use SigV4

| Service        | How SigV4 is Used                                   |
| -------------- | --------------------------------------------------- |
| AWS CLI & SDKs | Automatically sign all API requests                 |
| S3             | Presigned URLs for secure access to private objects |
| CloudFront     | OAC signs origin requests to S3 using SigV4         |
| API Gateway    | Authenticated client requests (IAM-based auth)      |
