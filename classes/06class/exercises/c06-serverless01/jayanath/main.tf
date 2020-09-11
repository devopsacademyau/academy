data "aws_ssm_parameter" "db_name_param" {
  name      = "DB_NAME"
}

resource "aws_kms_key" "doa_kms_key" {
  description             = "Main KMS key"
  deletion_window_in_days = 7
}

resource "aws_dynamodb_table" "doa_dynamodb_table" {
  name         = data.aws_ssm_parameter.db_name_param.value
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_key.doa_kms_key.arn
  }
}

# S3 bucket to host lambda code
resource "aws_s3_bucket" "doa_lambda_bucket" {
  bucket = "doa.jay.c06.lambda.host.com"
  acl    = "private"
}

# Upload lambda code to the bucket
resource "aws_s3_bucket_object" "doa_lambda_zip" {
  key                    = "jay/doa_lambda_zip"
  bucket                 = aws_s3_bucket.doa_lambda_bucket.id
  source                 = "src/lambda.zip"
  server_side_encryption = "AES256"
}

resource "aws_lambda_function" "doa_customer_api_lambda" {
  function_name = "doa-lambda"
  s3_bucket     = aws_s3_bucket.doa_lambda_bucket.id
  s3_key        = "jay/doa_lambda_zip"
  handler       = "lambda_handler.lambda_handler"
  runtime       = "python3.8"

  role = aws_iam_role.lambda_exec.arn

  environment {
    variables = {
      DB_NAME = data.aws_ssm_parameter.db_name_param.value
    }
  }
}

resource "aws_iam_role" "lambda_exec" {
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

resource "aws_kms_grant" "kms_access_grant" {
  key_id            = aws_kms_key.doa_kms_key.key_id
  grantee_principal = aws_iam_role.lambda_exec.arn
  operations        = ["Decrypt"]
}

resource "aws_iam_policy" "logging_access_policy" {
  path = "/"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:logs:*:*:*"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "logging-policy-attach" {
  name       = "logging-policy-attachment"
  roles      = [aws_iam_role.lambda_exec.name]
  policy_arn = aws_iam_policy.logging_access_policy.arn
}

resource "aws_iam_policy" "db_access_policy" {
  path = "/"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
				"dynamodb:PutItem",
				"dynamodb:UpdateItem"
      ],
      "Effect": "Allow",
      "Resource": "${aws_dynamodb_table.doa_dynamodb_table.arn}"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "db-access-policy-attach" {
  name       = "db-access-policy-attachment"
  roles      = [aws_iam_role.lambda_exec.name]
  policy_arn = aws_iam_policy.db_access_policy.arn
}

# API Gateway
resource "aws_api_gateway_rest_api" "doa_api" {
  name        = "DOA API GWY"
  description = "DOA REST API"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
  binary_media_types = [
    "*/*"
  ]
}

resource "aws_api_gateway_resource" "customers" {
  rest_api_id = aws_api_gateway_rest_api.doa_api.id
  parent_id   = aws_api_gateway_rest_api.doa_api.root_resource_id
  path_part   = "customers"
}

resource "aws_api_gateway_method" "customers" {
  rest_api_id      = aws_api_gateway_rest_api.doa_api.id
  resource_id      = aws_api_gateway_resource.customers.id
  http_method      = "POST"
  authorization    = "NONE"
  api_key_required = true
}

resource "aws_api_gateway_integration" "lambda" {
  rest_api_id = aws_api_gateway_rest_api.doa_api.id
  resource_id = aws_api_gateway_method.customers.resource_id
  http_method = aws_api_gateway_method.customers.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  content_handling        = "CONVERT_TO_TEXT"
  uri                     = aws_lambda_function.doa_customer_api_lambda.invoke_arn
}

resource "aws_api_gateway_deployment" "doa_api_deployment" {
  depends_on = [
    aws_api_gateway_integration.lambda,
  ]

  rest_api_id = aws_api_gateway_rest_api.doa_api.id
  stage_name  = "v1"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_api_key" "doa_api_key" {
  name = "doa_api_key"
}

resource "aws_ssm_parameter" "doa_api_key" {
  name      = "DOA_API_KEY"
  type      = "SecureString"
  value     = aws_api_gateway_api_key.doa_api_key.value
  overwrite = true
}

resource "aws_api_gateway_usage_plan" "doa_api_usage_plan" {
  name = "doa-usage-plan"
  api_stages {
    api_id = aws_api_gateway_rest_api.doa_api.id
    stage  = aws_api_gateway_deployment.doa_api_deployment.stage_name
  }
}
resource "aws_api_gateway_usage_plan_key" "doa_api_usage_plan_key" {
  key_id        = aws_api_gateway_api_key.doa_api_key.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.doa_api_usage_plan.id
}

resource "aws_lambda_permission" "allow_doa_api_gwy" {
  statement_id  = "AllowExecutionFromApiGwy"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.doa_customer_api_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.doa_api.execution_arn}/*/*"
}

resource "aws_ssm_parameter" "doa_api_url" {
  name      = "DOA_API_URL"
  type      = "String"
  value     = aws_api_gateway_deployment.doa_api_deployment.invoke_url
  overwrite = true
}

