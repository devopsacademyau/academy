data "archive_file" "lambda" {
  type        = "zip"
  output_path = "${path.module}/files/lambda.zip"

  source {
    content  = file("../src/main.py")
    filename = "main.py"
  }
}

data "aws_ssm_parameter" "db_name" {
  name = "/${var.project}/DB_NAME"
}

resource "aws_ssm_parameter" "api_key" {
  name  = "/${var.project}/API_KEY"
  type  = "SecureString"
  value = aws_api_gateway_api_key.default.value
  tags  = var.common_tags

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}

resource "aws_kms_key" "this" {
  description             = "${var.project} - DB Encrypt Key"
  deletion_window_in_days = 7
  tags                    = var.common_tags
}

resource "aws_dynamodb_table" "this" {
  name           = data.aws_ssm_parameter.db_name.value
  billing_mode   = "PROVISIONED"
  write_capacity = 5
  read_capacity  = 5
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_key.this.arn
  }

  tags = var.common_tags
}

resource "aws_lambda_function" "this" {
  filename         = data.archive_file.lambda.output_path
  function_name    = "func_customers"
  role             = aws_iam_role.lambda.arn
  handler          = "main.lambda_handler"
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime          = "python3.8"
  tags             = var.common_tags
  kms_key_arn      = aws_kms_key.this.arn
  environment {
    variables = {
      DB_NAME = data.aws_ssm_parameter.db_name.value
    }
  }
  depends_on = [
    aws_iam_role_policy_attachment.lambda,
    aws_iam_role_policy_attachment.apigw
  ]
}

resource "aws_cloudwatch_log_group" "lambda" {
  name              = "/aws/lambda/${aws_lambda_function.this.function_name}"
  retention_in_days = 14
}