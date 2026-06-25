
## Amazon S3
- [ ] Enable S3 Bucket Versioning
- [ ] Enable S3 Bucket Encryption
- [ ] Complete the S3 Access Module

## Amazon VPC & Networking
- [ ] Enable VPC Flow Logs
- [ ] Deploy application components across multiple subnets and Availability Zones (AZs)
- [ ] Move application instances into private subnets
- [ ] Ensure internal-only services are not available externally
- [ ] Test subnet failure scenarios to ensure traffic continues to route cleanly
- [ ] Route web traffic from documented URLs to multiple distinct endpoints
- [ ] Block unrestricted network access to the production database and cache database
- [ ] Check Security Groups: Ensure fewer than 2 security groups have ingress rules allowing `0.0.0.0/0`
- [ ] Check Security Groups: Ensure port 22 (SSH) is NOT open to the internet
- [ ] Implement IP blocking to drop packets from malicious IPs/subnets

## Amazon EC2 & AMI
- [ ] Ensure all EC2 instances are properly tagged
- [ ] Ensure all EC2 instances (except the bastion host) sit strictly in private subnets
- [ ] Review and identify any self-baked AMIs in use

## AWS Auto Scaling Group (ASG)
- [ ] Ensure an ASG is actively deployed for your infrastructure
- [ ] Verify that the MaxSize of the ASG is less than 50
- [ ] Configure a target tracing scaling policy that scales based on ALB request counts

## Elastic Load Balancing (ALB)
- [ ] Deploy an ALB to handle and route incoming application traffic
- [ ] Enable ALB Access Logs

## CloudFront & Caching
- [ ] Configure an Amazon CloudFront distribution
- [ ] Configure an application HTTP caching or Memcached solution

## Databases (DynamoDB & RDS)
- [ ] Enable DynamoDB Encryption
- [ ] Configure DynamoDB backups
- [ ] Configure RDS backups

## EKS & ECR (Containers)
- [ ] Enable at least one EKS logging type
- [ ] Configure EKS API server endpoint access (both public & private)
- [ ] Set ECR images to tag immutable
- [ ] Enable ECR image scanning
- [ ] Enable ECR encryption

## Shared Storage & Secrets
- [ ] Ensure a shared file storage solution (like Amazon EFS) is configured and working
- [ ] Enable automatic secret rotation for all secrets in AWS Secrets Manager

## Monitoring & Edge Security
- [ ] Ensure CloudWatch Alarms are defined for your infrastructure metrics
- [ ] Set up edge security (WAF) to block greater than 50% of web attacks

## General Application Mechanics & Benchmarks
- [ ] Ensure HTTPS URLs are submitted everywhere (avoid raw HTTP URLs)
- [ ] Optimize your deployment size to match the target budget/recommendation profile (CostRatio)
- [ ] Verify that the Primary, Stub, Root, and Lookup applications are actively serving valid results
- [ ] Confirm that a single refund can be processed successfully once architectures are locked
- [ ] Run a load test: Ensure the application serves requests reliably after being hit with a load of 200 for 10 minutes
- [ ] Monitor and maintain infrastructure availability above 90%
- [ ] Optimize application performance to hit a target latency of under 100ms or 500ms (keep total spikes under 2 seconds)
- [ ] Keep network request timeouts under 10%
- [ ] Track daily message processing success rates (target greater than 80% message acceptance)

## GameDay Interactive Challenge Modules
- [ ] Complete Automated Incident Response Challenge (Minimize clues used)
- [ ] Complete Identify and Mitigate Configuration Drift Challenge (Minimize clues used)
- [ ] Complete Perfect World Module (Minimize clues used)
- [ ] Complete Too Many Secrets Module (Minimize clues used)
- [ ] Complete Find the Rogue Script Module (Minimize clues used)
- [ ] Complete Strengthen API Defense Module (Minimize clues used)
- [ ] Complete High Availability Module (Minimize clues used)
- [ ] Complete Monoliths to Containers Migration Module (Minimize clues used)
