# VARS

locals {
  app_name       = "c06-serverless01"
  table_name     = "DA_Serverless"
  lambda_payload = "lambda.zip"
  lambda_runtime = "python3.8"
  lambda_handler = "lambda_handler.lambda_handler"
}

# KMS

resource "aws_kms_key" "db" {
  description             = local.app_name
  deletion_window_in_days = 7
}

resource "aws_kms_grant" "lambda" {
  name              = "grant-${local.app_name}"
  key_id            = aws_kms_key.db.key_id
  grantee_principal = aws_iam_role.lambda.arn
  operations        = ["Decrypt"]
}

# SSM

resource "aws_ssm_parameter" "api_key" {
  name  = "API_KEY"
  type  = "SecureString"
  value = aws_api_gateway_api_key.key.value

  lifecycle {
    ignore_changes = [value]
  }
}

data "aws_ssm_parameter" "db_host" {
  name = "DB_NAME"
}

# DYNAMODB

resource "aws_dynamodb_table" "da_serverless" {
  name         = local.table_name

  billing_mode = "PAY_PER_REQUEST"

  server_side_encryption {
    enabled = true
    kms_key_arn = aws_kms_key.db.arn
  }

  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

# API GATEWAY

resource "aws_api_gateway_rest_api" "api" {
  name        = local.app_name
  description = "API for ${local.app_name}"
  binary_media_types = [
    "*/*"
  ]
}

resource "aws_api_gateway_resource" "customers" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "customers"
}

resource "aws_api_gateway_method" "customers" {
  rest_api_id      = aws_api_gateway_rest_api.api.id
  resource_id      = aws_api_gateway_resource.customers.id
  http_method      = "POST"
  authorization    = "NONE"
  api_key_required = true
}

resource "aws_api_gateway_integration" "lambda" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_method.customers.resource_id
  http_method             = aws_api_gateway_method.customers.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  content_handling        = "CONVERT_TO_TEXT"
  uri                     = aws_lambda_function.api.invoke_arn
}

resource "aws_api_gateway_api_key" "key" {
  name = local.app_name
}

resource "aws_api_gateway_deployment" "v1" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = "v1"

  triggers = {
    redeployment = sha1(join(",", list(
      jsonencode(aws_api_gateway_integration.lambda),
    )))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_usage_plan" "v1" {
  name         = local.app_name
  description  = "usage plan for v1"

  api_stages {
    api_id = aws_api_gateway_rest_api.api.id
    stage  = aws_api_gateway_deployment.v1.stage_name
  }
}

resource "aws_api_gateway_usage_plan_key" "v1" {
  key_id        = aws_api_gateway_api_key.key.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.v1.id
}

# LAMBDA

resource "aws_iam_role" "lambda" {
  name = "lambda-${local.app_name}"

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

resource "aws_iam_role_policy" "lambda" {
  name = "lambda-dynamodb-${local.app_name}"
  role = aws_iam_role.lambda.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "dynamodb:PutItem"
      ],
      "Resource": "${aws_dynamodb_table.da_serverless.arn}"
    }
  ]
}
EOF
}

resource "aws_lambda_function" "api" {
  filename         = local.lambda_payload
  source_code_hash = filebase64sha256(local.lambda_payload)
  function_name    = local.app_name
  role             = aws_iam_role.lambda.arn

  runtime          = local.lambda_runtime
  handler          = local.lambda_handler

  environment {
    variables = {
      DB_NAME = data.aws_ssm_parameter.db_host.value
    }
  }
}

resource "aws_lambda_permission" "api" {
  statement_id  = "AllowApiInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.api.execution_arn}/*/*/*"
}


