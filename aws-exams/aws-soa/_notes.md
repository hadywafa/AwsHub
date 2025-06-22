# Hady Wafa Notes

1. AWS RAM is used to **share resources** (e.g., VPCs, subnets, Transit Gateways), **not for deploying IAM roles** or managing permissions.

2. If there is at least one healthy target in a target group, the load balancer routes requests only to the healthy targets. If a target group contains only unhealthy targets, the load balancer routes requests to the unhealthy targets.

   - Hence, it is advised to configure an Auto Scaling Group, if the instances are hosting a business-critical application.

3. change sets being deleted by CloudFormation after it successfully executes
