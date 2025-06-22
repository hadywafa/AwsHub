# Hady Wafa Notes

1. AWS RAM is used to **share resources** (e.g., VPCs, subnets, Transit Gateways), **not for deploying IAM roles** or managing permissions.

2. If there is at least one healthy target in a target group, the load balancer routes requests only to the healthy targets. If a target group contains only unhealthy targets, the load balancer routes requests to the unhealthy targets.

   - Hence, it is advised to configure an Auto Scaling Group, if the instances are hosting a business-critical application.

3. change sets being deleted by CloudFormation after it successfully executes

4. Traffic between two EC2 instances in the same AWS Region stays within the AWS network, even when it goes over public IP addresses

5. Traffic between EC2 instances in different AWS Regions stays within the AWS network, if there is an Inter-Region VPC Peering connection (using transit gateways) between the VPCs where the two instances reside
