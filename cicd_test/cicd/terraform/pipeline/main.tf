terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "tf-state-9254283118"
    key    = "codepipeline/go_http.tfstate"
    region = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "random_string" "bucket_suffix" {
  length  = 9
  upper   = false
  numeric = true
  special = false
}

resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = "codepipeline-${random_string.bucket_suffix.result}"
}

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

# module "codebuild" {
#   source = "./codebuild"
#
#   github_repo               = var.github_repo
#   account_id                = data.aws_caller_identity.current.account_id
#   buildspec_path            = var.buildspec_path
#   codepipeline_bucket       = aws_s3_bucket.codepipeline_bucket.bucket
#   codeconnection_policy_arn = aw
#
# }

module "codepipeline" {
  source = "./codepipeline"

  github_repo         = var.github_repo
  account_id          = data.aws_caller_identity.current.account_id
  buildspec_path      = var.buildspec_path
  codepipeline_bucket = aws_s3_bucket.codepipeline_bucket.bucket
}
