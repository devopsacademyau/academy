##################### KMS Key ########################
######################################################
resource "aws_kms_key" "db_key" {
description             = "kms key for c06-serverless01"
  deletion_window_in_days = 14
  tags = {
    Name = "${var.project}_db_key"
  }
}

resource "aws_kms_grant" "lambda" {
  name              = "${var.project}_kms_grant"
  key_id            = aws_kms_key.db_key.key_id
  grantee_principal = aws_iam_role.lambda.arn
  operations        = ["Decrypt"]
}


############### SSM Parameter store ##################
######################################################
resource "aws_ssm_parameter" "api_key" {
  name  = "API_KEY"
  type  = "SecureString"
  value = aws_api_gateway_api_key.key.value

  lifecycle {
    ignore_changes = [value]
  }
}

data "aws_ssm_parameter" "DB_NAME" {
  name = "DB_NAME"
}

################# lambda function ####################
######################################################
resource "aws_iam_role" "lambda" {
  name = "${var.project}_lamda_function"

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
  name = "lambda-dynamodb-${var.project}"
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
      "Resource": "${aws_dynamodb_table.DA_Serverless.arn}"
    }
  ]
}
EOF
}

resource "aws_lambda_function" "lambda_function" {
  filename         = var.lambda
  function_name    = "${var.project}_lambda_function"
  role             = aws_iam_role.lambda.arn
  runtime          = "python3.8"
  handler          = "lambda_handler.lambda_handler"
  depends_on  = [data.aws_ssm_parameter.DB_NAME]
  environment {
    variables = {
      DB_NAME = data.aws_ssm_parameter.DB_NAME.value
    }
  }
}

resource "aws_lambda_permission" "api" {
  statement_id  = "AllowApiInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.api.execution_arn}/*/*/*"
}

################## API Gateway #######################
######################################################
resource "aws_api_gateway_rest_api" "api" {
  name        = "${var.project}_api_gateway"
  description = "Terraform Serverless Application for ${var.project}"
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
  uri                     = aws_lambda_function.lambda_function.invoke_arn
}

resource "aws_api_gateway_api_key" "key" {
  name = "${var.project}_key"
}

resource "aws_api_gateway_deployment" "serverless" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = "serverless"
depends_on  = [aws_api_gateway_integration.lambda]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_usage_plan" "serverless" {
  name         = "${var.project}_usage_plan"

  api_stages {
    api_id = aws_api_gateway_rest_api.api.id
    stage  = aws_api_gateway_deployment.serverless.stage_name
  }
}

resource "aws_api_gateway_usage_plan_key" "serverless" {
  key_id        = aws_api_gateway_api_key.key.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.serverless.id
}


##################### DynamoDB #######################
######################################################
resource "aws_dynamodb_table" "DA_Serverless" {
  name         = "DA_Serverless"
  read_capacity = 5
  write_capacity = 5
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  attribute {
    name = "id"
    type = "S"
  }
  server_side_encryption {
    enabled = true
    kms_key_arn = aws_kms_key.db_key.arn
  }
}

