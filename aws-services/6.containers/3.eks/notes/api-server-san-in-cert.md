---
tags:
  - aws
  - aws/service
  - aws/domain/containers
  - aws/topic/eks
aliases:
  - "API Server SANs in Cert"
  - "Api Server San In Cert"
---

# 🌞 **API Server SANs in Cert**

**In Amazon EKS, the API server is managed by AWS and scaled dynamically across multiple control plane nodes. AWS handles TLS certificates internally, including SANs, without exposing or requiring manual configuration.**

---

## 🔍 How EKS Handles API Server TLS and SANs

### ✅ 1. **Managed Control Plane**

- EKS runs the Kubernetes control plane (including the API server) in a **fully managed, isolated environment**.
- You don’t have access to the API server’s host IPs or TLS certs directly.
- AWS ensures that:

  - TLS certs are valid and rotated
  - SANs include the necessary DNS names (e.g., `kubernetes.default.svc.cluster.local`)
  - The API server is reachable via a **stable endpoint** like:

    ```ini
    https://<cluster-name>.<region>.eks.amazonaws.com
    ```

### ✅ 2. **Dynamic Scaling**

- EKS can scale the control plane horizontally (multiple API server instances) for availability and performance.
- These instances are **behind a load balancer**, so the IPs can change.
- The TLS certs are issued for the **FQDN**, not individual IPs.

> 🔐 This means the SANs in the API server certs include **DNS names**, not IPs — ensuring flexibility and dynamic scaling.

---

## 🧠 Why You Don’t See or Manage These Certs

| Reason                    | Impact                                      |
| ------------------------- | ------------------------------------------- |
| AWS manages TLS certs     | You don’t need to generate or rotate them   |
| API server behind LB      | IPs are abstracted; certs use DNS SANs      |
| Stable FQDN endpoint      | Clients connect via DNS, not IP             |
| Certs include proper SANs | Ensures compatibility with kubectl, kubelet |

---

## 🧪 If You’re Building Your Own Cluster (e.g., kubeadm, Kind)

You **must manually include**:

- All relevant DNS names (`kubernetes.default.svc.cluster.local`)
- Any **static IPs** used by the API server
- Load balancer IPs (if applicable)
- External access IPs (if exposed via NodePort or Ingress)

This is why your `openssl.cnf` includes multiple `IP.X` and `DNS.X` entries — to ensure the cert is valid across all access paths.

```ini
# openssl.cnf

[req]
req_extensions = v3_req
distinguished_name = req_distinguished_name

[v3_req]
basicConstraints = CA:FALSE
keyUsage = nonRepudiation
subjectAltName = @alt_names

[alt_names]
# DNS names that the certificate is valid for (more dynamic than IP addresses)
DNS.1 = kubernetes
DNS.2 = kubernetes.default
DNS.3 = kubernetes.default.svc
DNS.4 = kubernetes.default.svc.cluster.local
DNS.5 = apiserver.hadywafa.com
# The IP address of the API Server service for multi-master clusters
IP.1 = 127.0.0.1
IP.2 = 38.0.101.76
IP.3 = 237.84.2.178
IP.4 = 38.0.101.76
```
---

## Related Notes
- [[aws-services/6.containers/3.eks/1.1.eks|Amazon EKS Simplifying Kubernetes on AWS]] - mentions Eks

---
