variable "proj_name" {
  default = "go-http-server" # Default value
  type    = string
}

variable "codepipeline_bucket" {
  type = string
}

variable "account_id" {
  type = string
}

variable "github_repo" {
  type = string
}

variable "buildspec_path" {
  type = string
}

variable "region" {
  default = "us-east-1"
  type    = string
}

variable "codeconnection_policy_arn" {
  type = string
}

