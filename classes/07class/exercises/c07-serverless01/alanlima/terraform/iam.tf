data "aws_caller_identity" "current" {}

resource "aws_iam_role" "lambda" {
  name               = "${var.project}_lambda_role"
  tags               = var.common_tags
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_role" "apigw" {
  name               = "${var.project}_apigw_lambda_role"
  tags               = var.common_tags
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "apigateway.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_policy" "lambda" {
  name        = "${var.project}_lambda_policy"
  path        = "/"
  description = "IAM policy for logging from a lambda function"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "dynamodb:PutItem",
                "dynamodb:Scan",
                "dynamodb:GetItem",
                "dynamodb:UpdateItem"
            ],
            "Resource": "${aws_dynamodb_table.this.arn}",
            "Effect": "Allow"
        },
        {
            "Effect": "Allow",
            "Resource": "${aws_dynamodb_table.this.arn}/stream/*",
            "Action": [
                "dynamodb:DescribeStream",
                "dynamodb:GetRecords",
                "dynamodb:GetShardIterator",
                "dynamodb:ListStreams"
            ]
        },
        {
            "Action": [
                "ssm:GetParameter"
            ],
            "Resource": "arn:aws:ssm:${var.region}:${data.aws_caller_identity.current.account_id}:parameter/${var.project}/*",
            "Effect": "Allow"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ses:SendEmail",
                "ses:SendRawEmail"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "sns:Publish"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_kms_grant" "lambda" {
  name = "${var.project}-lambda-grant"
  #   key_id            = data.aws_kms_key.this.id
  key_id            = aws_kms_key.this.id
  grantee_principal = aws_iam_role.lambda.arn
  operations        = ["Decrypt", "Encrypt"]
}

resource "aws_iam_policy" "apigw" {
  name        = "${var.project}_apigw_lambda_policy"
  path        = "/"
  description = "IAM policy for logging from a lambda function"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:DescribeLogGroups",
                "logs:DescribeLogStreams",
                "logs:PutLogEvents",
                "logs:GetLogEvents",
                "logs:FilterLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*",
            "Effect": "Allow"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda" {
  role       = aws_iam_role.lambda.name
  policy_arn = aws_iam_policy.lambda.arn
}

resource "aws_iam_role_policy_attachment" "apigw" {
  role       = aws_iam_role.apigw.name
  policy_arn = aws_iam_policy.apigw.arn
}