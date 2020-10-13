data "archive_file" "customers_lambda" {
  type        = "zip"
  output_path = "${path.module}/files/customers_lambda.zip"

  source {
    content  = file("../src/common.py")
    filename = "common.py"
  }

  source {
    content  = file("../src/main.py")
    filename = "main.py"
  }
}

resource "aws_ssm_parameter" "db_name" {
  name  = "/${var.project}/DB_NAME"
  type  = "String"
  value = var.db_name
  tags  = var.common_tags
}

resource "aws_ssm_parameter" "api_key" {
  name  = "/${var.project}/API_KEY"
  type  = "SecureString"
  value = aws_api_gateway_api_key.default.value
  tags  = var.common_tags
}

resource "aws_kms_key" "this" {
  description             = "${var.project} - DB Encrypt Key"
  deletion_window_in_days = 7
  tags                    = var.common_tags
}

# data "aws_kms_key" "this" {
#   key_id = "0353c4e7-5cb9-473f-a3ae-f01795dab9a5"
# }

resource "aws_dynamodb_table" "this" {
  name             = var.db_name
  billing_mode     = "PROVISIONED"
  write_capacity   = 5
  read_capacity    = 5
  hash_key         = "id"
  stream_enabled   = true
  stream_view_type = "KEYS_ONLY"

  attribute {
    name = "id"
    type = "S"
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_key.this.arn
    # kms_key_arn = data.aws_kms_key.this.arn
  }

  tags = var.common_tags
}

resource "aws_lambda_function" "this" {
  filename         = data.archive_file.customers_lambda.output_path
  source_code_hash = data.archive_file.customers_lambda.output_base64sha256
  function_name    = "func_customers"
  role             = aws_iam_role.lambda.arn
  handler          = "main.lambda_handler"
  runtime          = "python3.8"
  tags             = var.common_tags
  kms_key_arn = aws_kms_key.this.arn
  # kms_key_arn      = data.aws_kms_key.this.arn
  environment {
    variables = {
      DB_NAME = aws_ssm_parameter.db_name.name
    }
  }
  depends_on = [
    aws_iam_role_policy_attachment.lambda
  ]
}