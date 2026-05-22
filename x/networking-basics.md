---
tags:
  - aws
aliases:
  - "Virtual Private Cloud"
  - "Networking Basics"
---

# Virtual Private Cloud

## Components
![alt text](vpc-classification.png))

- Each vpc must be in one region.
- Each vpc have multi nested subnets.
- Each subnet must be in one AZ.
- Private subnet has not public ips.
- Each subnet has range of ips.
- There is default created vpc per aws account

## Understanding IP in AWS
![alt text](understanding-ip-in-aws.png))

### each byte can contain 255 possible numbers
![alt text](each-byte-can-contain-255-possible-numbers.png))

### network devices working with binary data
![alt text](network-devices-working-with-binary-data.png))

### IP = Network Number + Host Number
![alt text](ip-form.png))

### Class full addressing (old)
![alt text](classfull-addressing-1.png))![alt text](classfull-addressing-2.png))

### CIDR Classless Inter-Domain Routing (new)
![alt text](cidr-1.png))![alt text](cidr-2.png))![alt text](cidr-3.png))![alt text](cidr-4.png))![alt text](cidr-5.png))![alt text](cidr-6.png))![alt text](cidr-7.png))

## Design VPC subnets in AWS
![alt text](private-ips-from-iana.png))
![alt text](private-ips-considrations.png))

### We create subnets from host id not from network id
![alt text](subnets-from-host-id-1.png))
![alt text](subnets-from-host-id-2.png))

### Calculation of Subnets
![alt text](network-to-create-subnets-from-it.png))

- To identical subnets of **/17**![alt text](calc-subnets-ex1-1.png))![alt text](calc-subnets-ex1-2.png))

- To identical subnets of **/18**![alt text](calc-subnets-ex2-1.png))![alt text](calc-subnets-ex2-2.png))

- To mixed size subnets
![alt text](calc-subnets-ex3.png))

- CIDR address should not overlaps with existing subnet CIDR with![alt text](calc-subnets-note.png))

### Reserved IPs for any subnets
![alt text](reserved-ips-for-any-subnets.png))

## Example Design VPC subnets in AWS
![alt text](example-design-vpc-subnets-in-aws.png))

## Network Connections
![alt text](network-connection-getway.png))

### 1. Peering

- **Purpose**: Connects two VPCs privately.
- **Use Case**: Allows resources in different VPCs to communicate as if they were within the same network.
- **Benefits**: Low latency, no bandwidth bottleneck, and cost-effective for inter-VPC traffic.

### 2. Transit Gateway

- **Purpose**: Acts as a central hub to connect multiple VPCs, on-premises networks, and remote networks.
- **Use Case**: Simplifies complex network architectures by centralizing connections.
- **Benefits**: Scalable, simplifies routing, reduces peering connections, and improves management.

### 3. AWS Direct Connect

- **Purpose**: Provides a dedicated network connection from on-premises data centers to AWS.
- **Use Case**: High-throughput, low-latency access to AWS services.
- **Benefits**: Consistent network performance, increased bandwidth, and reduced data transfer costs.

### 4. AWS Site-to-Site VPN

- **Purpose**: Establishes a secure and encrypted connection between on-premises networks and AWS.
- **Use Case**: Extends your on-premises network to AWS securely over the internet.
- **Benefits**: Cost-effective, quick setup, secure communication, and redundancy.

### 5. Internet Gateway

- **Purpose**: Enables communication between instances in a VPC and the internet.
- **Use Case**: Allows instances to receive incoming traffic from the internet and send outbound traffic to the internet.
- **Benefits**: Scalability, high availability, and seamless internet access for VPC resources.

### 6. NAT Gateway

- **Purpose**: Allows instances in a private subnet to access the internet while preventing inbound traffic from the internet.
- **Use Case**: Secure outbound internet access for instances in private subnets.
- **Benefits**: Managed service, high availability, and scalability without managing NAT instances.

### Summary

- **Peering**: Direct VPC-to-VPC connection.
- **Transit Gateway**: Central hub for connecting multiple networks.
- **AWS Direct Connect**: Dedicated physical connection to AWS.
- **AWS Site-to-Site VPN**: Secure connection over the internet to AWS.
- **Internet Gateway**: Internet access for VPC resources.
- **NAT Gateway**: Outbound internet access for private subnet instances.

These gateways and connections help create a robust, scalable, and secure network infrastructure within AWS, catering to different connectivity needs.
---

## Related Notes
-[[aws-route53|AWS Route53]]] - previous lesson
- [[aws-services/3.network/1.vpc/5.1.vpn/3.aws-direct-connect|AWS Direct Connect]] - mentions AWS Direct Connect
- [[aws-services/2.security/1.1.iam/1.fundmmentals/1.1.aws-account|AWS Account Your Gateway to the AWS Cloud]] - mentions Aws Account
- [[aws-services/3.network/1.vpc/1.fundmentals/2.1.nat-gateway|NAT Gateway]] - mentions Nat Gateway

---
