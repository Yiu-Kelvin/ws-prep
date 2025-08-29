resource "aws_codeconnections_connection" "github_connection" {
  name          = "github_connection"
  provider_type = "GitHub"
}

resource "aws_codebuild_project" "codebuild_proj" {
  name          = var.proj_name
  build_timeout = 5
  service_role  = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  cache {
    type     = "S3"
    location = var.codepipeline_bucket
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "log-group"
      stream_name = "log-stream"
    }

    s3_logs {
      status   = "ENABLED"
      location = "${var.codepipeline_bucket}/build-log"
    }
  }

  source {
    type            = "GITHUB"
    location        = var.github_repo
    git_clone_depth = 1
    buildspec       = var.buildspec_path

    git_submodules_config {
      fetch_submodules = true
    }
  }

  source_version = "master"
}

