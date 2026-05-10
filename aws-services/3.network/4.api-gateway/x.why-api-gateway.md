---
tags:
  - aws
  - aws/service
  - aws/domain/networking
  - aws/topic/api-gateway
aliases:
  - "HW Questions"
  - "Why API Gateway"
---

# HW Questions

## Why AWS API Gateway so Important

API Gateway can indeed serve as a central hub that manages and routes requests to different APIs, regardless of whether they are hosted on EC2 instances, ECS, EKS, or even AWS Lambda. Here’s a quick summary:

### Use of API Gateway

- **Centralized Routing**: Acts as a single entry point to route API requests to various backend services.
- **Inter-Service Communication**: Can be used to allow APIs to call other APIs, regardless of their underlying infrastructure.
- **Unified Management**: Provides a consistent interface and set of features (security, throttling, monitoring) for all your APIs.

### Scenario

- **Microservices Architecture**: Imagine you have multiple microservices deployed on EC2, ECS, and EKS. Each microservice exposes its own API.
- **API Gateway**: You use API Gateway as the front door to manage these APIs. It handles incoming requests, routes them to the appropriate microservice, and manages security and monitoring.

### Benefits

- **Consistency**: Ensures a consistent way of accessing and managing APIs.
- **Security**: Enhances security by centralizing authentication and authorization.
- **Scalability**: Easily scales with your application's needs, handling millions of requests per second.
- **Monitoring and Analytics**: Provides detailed insights into API usage and performance.
---

## Related Notes
- [[aws-services/3.network/4.api-gateway/x.api-monitoring|API Gateway Monitoring Ensuring Optimal Performance and Security]] - previous lesson
- [[aws-daily/aws-architectures/1.1.microservices-architecture|The Ultimate Guide to Microservices Architecture]] - mentions Microservices Architecture
- [[ا-delete-me/aws-api-getway|AWS API Gateway]] - mentions AWS API Gateway
- [[aws-services/3.network/4.api-gateway/2.1.agw-rest-api|AWS API Gateway]] - mentions AWS API Gateway
- [[aws-services/3.network/4.api-gateway/x.api-gateway|Amazon API Gateway Streamlining API Management]] - mentions API Gateway
- [[aws-services/3.network/4.api-gateway/1.1.api-gateway|AWS API Gateway The Front Door for Your APIs]] - mentions API Gateway
- [[aws-services/6.containers/3.eks/1.1.eks|Amazon EKS Simplifying Kubernetes on AWS]] - mentions EKS
- [[aws-services/6.containers/2.ecs/1.1.ecs|Amazon ECS Elastic Container Service]] - mentions ECS

---
