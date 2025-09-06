terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

module "codebuild" {
  source = "./codebuild"

  github_repo               = var.github_repo
  account_id                = data.aws_caller_identity.current.account_id
  buildspec_path            = var.buildspec_path
  codepipeline_bucket       = var.codepipeline_bucket
  codeconnection_policy_arn = aws_iam_policy.codeconnection_policy.arn
}
