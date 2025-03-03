# Build role
data "aws_iam_policy_document" "metabase_build_assume" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
 
    principals {
      type        = "Service"
      identifiers = ["build.apprunner.amazonaws.com"]
    }
  }
}
 
resource "aws_iam_role" "metabase_build" {
  name               = "metabase-build"
  assume_role_policy = data.aws_iam_policy_document.metabase_build_assume.json
}

data "aws_iam_policy" "apprunner-ecr-service-policy" {
  name = "AWSAppRunnerServicePolicyForECRAccess"
}

resource "aws_iam_role_policy_attachment" "attach-ecr-policy" {
  role       = aws_iam_role.metabase_build.name
  policy_arn = data.aws_iam_policy.apprunner-ecr-service-policy.arn
}