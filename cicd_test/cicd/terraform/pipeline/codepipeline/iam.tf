data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_policy" "codepipeline_policy" {
  name        = "codepipeline_policy"
  description = "policy for CodePipeline service role"

  policy = templatefile("${path.module}/template/codepipeline_policy.json", {
    account_id          = var.account_id
    region              = var.region
    proj_name           = var.proj_name
    codepipeline_bucket = var.codepipeline_bucket
  })
}


resource "aws_iam_role" "codepipeline_role" {
  name               = "codepipeline_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "attach_codebuild_policy" {
  role       = aws_iam_role.codepipeline_role.name
  policy_arn = aws_iam_policy.codebuild_policy.arn
}

resource "aws_iam_policy" "codeconnection_policy" {
  name        = "codeconnection_policy"
  description = "allow access to code connection"

  policy = templatefile("${path.module}/template/codeconnection_policy.json", {
    account_id    = var.account_id
    region        = var.region
    connection_id = aws_codeconnections_connection.github_connection.id
  })
}
