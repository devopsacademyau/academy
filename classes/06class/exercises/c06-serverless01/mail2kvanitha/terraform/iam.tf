# AWS LAMBDA IAM ROLE
resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

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

# AWS DYNAMODB IAM POLICY
resource "aws_iam_role_policy" "dynamodb" {
  name   = "dynamo_db_iam"
  role   = aws_iam_role.iam_for_lambda.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "dynamodb:PutItem"
            ],
      "Resource": "${aws_dynamodb_table.da_serverless.arn}",
      "Effect": "Allow"

    }
  ]
}
EOF
}

# AWS CLOUDWATCH LOGS IAM POLICY
resource "aws_iam_role_policy" "cloudwatch" {
  name   = "lambda_cloudwatch_iam"
  role   = aws_iam_role.iam_for_lambda.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}
