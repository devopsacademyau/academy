data "archive_file" "photos_lambda" {
  type        = "zip"
  output_path = "${path.module}/files/photos_lambda.zip"

  source {
    content  = file("../src/photos_lambda.py")
    filename = "photos_lambda.py"
  }

  source {
    content  = file("../src/common.py")
    filename = "common.py"
  }
}

data "archive_file" "report_count_lambda" {
  type        = "zip"
  output_path = "${path.module}/files/report_count_lambda.zip"

  source {
    content  = file("../src/report_count_lambda.py")
    filename = "report_count_lambda.py"
  }

  source {
    content  = file("../src/common.py")
    filename = "common.py"
  }
}

resource "aws_s3_bucket" "photos" {
  bucket = var.photos_bucket
  acl    = "private"
  tags   = var.common_tags
}


resource "aws_lambda_function" "photos_handler" {
  filename         = data.archive_file.photos_lambda.output_path
  function_name    = "func_profile_photos"
  role             = aws_iam_role.lambda.arn
  handler          = "photos_lambda.handler"
  source_code_hash = data.archive_file.photos_lambda.output_base64sha256
  tags             = var.common_tags
  runtime          = "python3.8"
  kms_key_arn = aws_kms_key.this.arn
  # kms_key_arn      = data.aws_kms_key.this.arn
  environment {
    variables = {
      DB_NAME      = aws_ssm_parameter.db_name.name
      SENDER_NAME  = var.mail_sender.name
      SENDER_EMAIL = var.mail_sender.email
    }
  }
  depends_on = [
    aws_iam_role_policy_attachment.lambda
  ]
  lifecycle {
    ignore_changes = [
      environment
    ]
  }
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFormS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.photos_handler.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.photos.arn
}

resource "aws_s3_bucket_notification" "photos" {
  bucket = aws_s3_bucket.photos.id
  lambda_function {
    lambda_function_arn = aws_lambda_function.photos_handler.arn
    events = [
      "s3:ObjectCreated:*"
    ]
  }
  depends_on = [
    aws_lambda_permission.allow_bucket
  ]
}

resource "aws_sns_topic" "report_count" {
  name = "report-customers-count-topic"
}

resource "aws_lambda_function" "report_count" {
  filename         = data.archive_file.report_count_lambda.output_path
  function_name    = "func_report_count"
  role             = aws_iam_role.lambda.arn
  handler          = "report_count_lambda.handler"
  source_code_hash = data.archive_file.report_count_lambda.output_base64sha256
  tags             = var.common_tags
  runtime          = "python3.8"
  kms_key_arn = aws_kms_key.this.arn
  # kms_key_arn      = data.aws_kms_key.this.arn
  environment {
    variables = {
      DB_NAME       = aws_ssm_parameter.db_name.name
      SNS_TOPIC_ARN = aws_sns_topic.report_count.arn
    }
  }
  depends_on = [
    aws_iam_role_policy_attachment.lambda
  ]
}

resource "aws_lambda_event_source_mapping" "report_count" {
  event_source_arn  = aws_dynamodb_table.this.stream_arn
  function_name     = aws_lambda_function.report_count.arn
  starting_position = "LATEST"
}