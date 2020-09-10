data "archive_file" "remove_untagged_lambda" {
  type        = "zip"
  output_path = "${path.module}/files/remove_untagged_lambda.zip"

  source {
    content  = file("../src/remove_untagged_instances.py")
    filename = "main.py"
  }
}

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

resource "aws_iam_policy" "lambda" {
  name        = "${var.project}_lambda_policy"
  path        = "/"
  description = "IAM policy for lambda function"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowCloudWatchLog",
            "Effect": "Allow",
            "Resource": "arn:aws:logs:*:*:*",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ]
        },
        {
            "Sid": "AllowDescribeEC2Instances",
            "Effect": "Allow",
            "Resource": "*",
            "Action": [ "ec2:DescribeInstances" ]
        },
        {
            "Sid": "AllowEC2Management",
            "Effect": "Allow",
            "Resource": "arn:aws:ec2:*:*:instance/*",
            "Action": [
                "ec2:CreateTags",
                "ec2:TerminateInstances"
            ]
        },
        {
            "Sid": "AllowPublishSNSTopic",
            "Effect": "Allow",
            "Resource": "*",
            "Action": [
                "sns:Publish"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda" {
  role       = aws_iam_role.lambda.name
  policy_arn = aws_iam_policy.lambda.arn
}

resource "aws_sns_topic" "untagged_instance_removed" {
  name = "${var.project}-untagged_instance_removed"
}

resource "aws_lambda_function" "remove_untagged" {
  function_name    = "func_remove_untagged_ec2"
  filename         = data.archive_file.remove_untagged_lambda.output_path
  source_code_hash = data.archive_file.remove_untagged_lambda.output_base64sha256
  role             = aws_iam_role.lambda.arn
  handler          = "main.lambda_handler"
  runtime          = "python3.8"
  tags             = var.common_tags
  environment {
    variables = {
      SNS_TOPIC = aws_sns_topic.untagged_instance_removed.arn
    }
  }
}

resource "aws_cloudwatch_log_group" "func_remove_untagged" {
  name              = "/aws/lambda/${aws_lambda_function.remove_untagged.function_name}"
  retention_in_days = 14
}

resource "aws_cloudwatch_event_rule" "untagged_instances" {
  name          = "${var.project}-capture-untagged-instances"
  description   = "Watch for untagged EC2 instances"
  event_pattern = <<EOF
{
    "source": [ "aws.ec2" ],
    "detail-type": [
        "EC2 Instance State-change Notification"
    ],
    "detail": {
        "state": [ "running" ]
    }
}
EOF
}

resource "aws_cloudwatch_event_target" "untagged_instances" {
  rule = aws_cloudwatch_event_rule.untagged_instances.name
  arn  = aws_lambda_function.remove_untagged.arn
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.remove_untagged.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.untagged_instances.arn
}