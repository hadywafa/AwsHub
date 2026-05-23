---
tags:
  - aws
  - aws/daily
  - aws/topic/aws-waf
aliases:
  - "Immutable Infrastructures Architecture"
  - "اا Immutable Infrastructures Architecture"
---

# Immutable Infrastructures Architecture

`Immutable means - not capable of or susceptible to change`

- Immutable infrastructure is a model that mandates that no updates, security patches, or configuration changes happen in-place on production workloads.

- When a change is needed, the architecture is built onto new infrastructure and deployed into production.

- Immutable infrastructures are inherently more consistent, reliable, and predictable, and they simplify many aspects of software development and operations

---

**Immutable Servers:**

When running an application on multiple EC2 Instances, we want to avoid differences between the instances because they can cause unpredictable behavior and make it hard to troubleshoot and solve issues.

- The best way to prevent differences is to replace the instances whenever we want to make a change— or basically use Immutable servers.
- Image builder can be used to create AMI with all the packages required for the application automatically (which can then be used for immutable servers).

---

This concept extends to security, storage, instances, data and other services.

- No update, security patches, or configuration changes happen in production.Absolutely no in-place updates (no SSH 🤗).
- All the needed software is built into the server image (No user data scripts to upload or install packages).
- The configuration is applied at server boot time – that is the way to deploy the same image into multiple environments.
- When a new image version has to be deployed or any change made – a new image is created and deployed. Once it’s verified the old servers can be decommissioned.

> 🔔 Notes:  
> Cloudformation and Elastic Beanstalk can be used to do immutable environment updates where it would replace resources impacted by configuration changes.

---

**Benefits:**

- Reduction in configuration drifts.
- Simplified deployments.
- Reliable atomic deployments.
- Safer deployments with fast rollback and recovery.
- Consistent testing and debugging environments.
- Increased security.
- We can be sure about the state of the deployed system.
---

## Related Notes
- [[aws-daily/aws-waf/ا-best-practices|AWS Best Practices - Architecture For The Cloud]] - previous lesson
-[[1.1.cfn|AWS CloudFormation]]] - mentions CloudFormation

---
