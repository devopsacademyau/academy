# CLOUDWATCH

resource "aws_cloudwatch_event_rule" "event" {
  name        = "${var.project-name}-event"
  description = "Terminate tagged instances"

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

resource "aws_cloudwatch_event_target" "event_target" {
    rule = aws_cloudwatch_event_rule.event.name
    target_id = "${var.project-name}-func"
    arn = aws_lambda_function.tf_lambda_fn.arn
}

# LAMBDA
resource "aws_lambda_function" "tf_lambda_fn" {
    filename = "lambda_handler.zip"
    function_name = "${var.project-name}-func"
    handler = "remove_untagged_instances.lambda_handler"
    runtime = "python3.8"
    role    = aws_iam_role.tf_lambda_role.arn
    tags = {
    Name = "${var.project-name}-lambda"
  }
  environment {
    variables = {
      TAG_NAME = "${var.TAG_NAME}"
      SNS_TOPIC = aws_sns_topic.ec2_updates.arn
    }
  }
  
}

resource "aws_lambda_permission" "events_lambda" {
  statement_id  = "AllowExecutionFromCloudWatchEvents"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.tf_lambda_fn.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.event.arn
}


resource "aws_iam_role" "tf_lambda_role" {
  name = "${var.project-name}-lambda-role"

  assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
  tags = {
    Name = "${var.project-name}-lambda-role"
  }
}

resource "aws_iam_role_policy" "tf_lambda_policy" {
  name = "${var.project-name}-lambda-policy"
  role = aws_iam_role.tf_lambda_role.id

  policy = <<EOF
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

# SNS_TOPIC

resource "aws_sns_topic" "ec2_updates" {
  name = "${var.project-name}-update-topic" 
}



