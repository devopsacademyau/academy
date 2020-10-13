## Lambda function

data "archive_file" "zip" {
  type        = "zip"
  source_file = "remove_untagged_instances.py"
  output_path = "remove_untagged_instances.zip"
}

data "aws_iam_policy_document" "policy" {
  statement {
    sid    = ""
    effect = "Allow"

    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.policy.json
}

data "aws_iam_policy_document" "ec2_lambda_policy" {
    statement {
        actions = [
            "ec2:Describe*",
            "ec2:Terminate*",
            "ec2:CreateTags"
        ]
        resources = [
            "*",
        ]
    }
}

resource "aws_iam_policy" "ec2_lambda_scheduler" {
  name = "ec2_access_scheduler"
  path = "/"
  policy = data.aws_iam_policy_document.ec2_lambda_policy.json
}

resource "aws_iam_role_policy_attachment" "ec2_access_scheduler" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.ec2_lambda_scheduler.arn
}

resource "aws_lambda_function" "lambda" {
  function_name = "remove_untagged_instances"

  filename         = data.archive_file.zip.output_path
  source_code_hash = data.archive_file.zip.output_base64sha256

  role    = aws_iam_role.iam_for_lambda.arn
  handler = "remove_untagged_instances.lambda_handler"
  runtime = "python3.6"

  environment {
    variables = {
      greeting = "Hello"
    }
  }
}

## Cloudwatch event

resource "aws_cloudwatch_event_rule" "ec2_running" {
    name        = "ec2_running"
    description = "Capture each EC2 running"

    event_pattern = <<EOF
    {
    "source": [
        "aws.ec2"
    ],
    "detail-type": [
        "EC2 Instance State-change Notification"
    ],
    "detail": {
        "state": [
        "running"
        ]
    }
    }
    EOF
}

resource "aws_cloudwatch_event_target" "check_ec2_running" {
  rule      = aws_cloudwatch_event_rule.ec2_running.name
  target_id = "lambda"
  arn       = aws_lambda_function.lambda.arn
}


resource "aws_lambda_permission" "allow_cloudwatch_to_call_check_ec2_running" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.ec2_running.arn
}

resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.ec2_running.name
  target_id = "SendToSNS"
  arn       = aws_sns_topic.aws_ec2.arn
}

## SNS topic

resource "aws_sns_topic" "aws_ec2" {
  name = "aws-ec2"
}

resource "aws_sns_topic_policy" "default" {
  arn    = aws_sns_topic.aws_ec2.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}

data "aws_iam_policy_document" "sns_topic_policy" {
  statement {
    effect  = "Allow"
    actions = ["SNS:Publish"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    resources = [aws_sns_topic.aws_ec2.arn]
  }
}

