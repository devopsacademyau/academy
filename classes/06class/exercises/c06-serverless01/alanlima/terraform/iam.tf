data "aws_iam_policy_document" "lambda_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "apigw_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["apigateway.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "lambda" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = ["arn:aws:logs:*:*:*"]
  }

  statement {
    actions = [
      "dynamodb:PutItem",
      "dynamodb:Scan",
      "dynamodb:GetItem"
    ]
    resources = [aws_dynamodb_table.this.arn]
  }

  statement {
    actions = [
      "kms:Decrypt"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "apigw" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:PutLogEvents",
      "logs:GetLogEvents",
      "logs:FilterLogEvents"
    ]
    resources = ["arn:aws:logs:*:*:*"]
  }
}

resource "aws_iam_role" "lambda" {
  name               = "${var.project}_lambda_role"
  tags               = var.common_tags
  assume_role_policy = data.aws_iam_policy_document.lambda_role.json
}

resource "aws_iam_role" "apigw" {
  name               = "${var.project}_apigw_lambda_role"
  tags               = var.common_tags
  assume_role_policy = data.aws_iam_policy_document.apigw_role.json
}

resource "aws_iam_policy" "lambda" {
  name        = "${var.project}_lambda_policy"
  path        = "/"
  description = "IAM policy for logging from a lambda function"
  policy      = data.aws_iam_policy_document.lambda.json
}

resource "aws_iam_policy" "apigw" {
  name        = "${var.project}_apigw_lambda_policy"
  path        = "/"
  description = "IAM policy for logging from a lambda function"
  policy      = data.aws_iam_policy_document.apigw.json
}

resource "aws_iam_role_policy_attachment" "lambda" {
  role       = aws_iam_role.lambda.name
  policy_arn = aws_iam_policy.lambda.arn
}

resource "aws_iam_role_policy_attachment" "apigw" {
  role       = aws_iam_role.apigw.name
  policy_arn = aws_iam_policy.apigw.arn
}