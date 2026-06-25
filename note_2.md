ALB 
CodeDeploy 
CodePipeline 
Codebuild 
DynamoDB 
ECR 
ECS 
GuardDuty 
Lambda 
RDS 
S3 
Security_Groups 
VPC 
cloudfront 
cloudwatch
kinsis 


## ECS
- Enable ECS AutoScaling Policy (Tasks >= 2)
- Enable ECS Container Insight
- Enable ECS Task Definition logging
- Use ECS Service
- Use Fargate for running containers
- Verify application running on ECS

## Lambda
- Add tags to Lambda function

## ECR
- Configure ECR endpoint
- Set ECR image Tag as immutable
- Set Lifecycle Configuration for ECR repository
- Use ECR Resource Policies

## Cost
- Calculate Cost Ratio rate of the solution

## S3
- Enable S3 Encryption
- Enable S3 lifecycle
- Enable S3 versioning

## VPC
- Add tags to VPC
- Configure VPC endpoint for DynamoDB
- Configure VPC endpoint for S3
- Enable VPC FlowLog

## Security Groups
- No inbound rule allow traffic from 0.0.0.0/0
- No inbound rule allow traffic from SSH port

## GuardDuty
- Add tags to GuardDuty
- Enable GuardDuty
- Enable GuardDutyFindingExport

## DynamoDB
- Enable DynamoDB TTL
- Enable DynamoDB deletion protection
- Verify DynamoDB is used

## CodePipeline
- Add Codepipeline approval stage
- Create and use CodePipeline successfully

## CodeBuild
- Create and use CodeBuild successfully

## CodeDeploy
- Create and use CodeDeploy successfully

## ALB
- Enable ALB log
- Verify ALB in use

## Kinesis
- Add tags to Kinesis Analysis
- Enable Kinesis Data Streams encryption
- Verify Kinesis Analysis in use
- Verify Kinesis Data Stream in use
- Verify Kinesis Data Stream provisioned shard = 1

## RDS
- Enable RDS Deletion Protection
- Set RDS backup retention period to more than 7 days

## CloudFront
- Verify CloudFront in use

## CloudWatch
- Enable CloudWatch Alarm
