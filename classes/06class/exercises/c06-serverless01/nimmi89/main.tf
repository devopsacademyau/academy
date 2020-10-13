# S3 [Store lambda source code artifact] 
resource "aws_s3_bucket" "tf-s3-bucket" {
  bucket = "${var.project-name}-s3-bucket"
  acl    = "private"
  tags = {
    Name = "${var.project-name}-s3-bucket"
  }
}

resource "aws_s3_bucket_object" "tf-bucket_object" {
  key                    = "v${var.app-version}/lambda.zip"
  bucket                 = aws_s3_bucket.tf-s3-bucket.id
  source                 = "~/DA_class6/academy/classes/06class/exercises/c06-serverless01/src/lambda.zip"
  server_side_encryption = "AES256"
}




# KMS
resource "aws_kms_key" "tf-kms-key" {
  description         = "KMS Keys for Serverless exercise"
  enable_key_rotation = true
  tags = {
    Name = "${var.project-name}-kms-key"
  }

}

resource "aws_kms_grant" "tf-kms-grant" {
  name              = "${var.project-name}-grant"
  key_id            = aws_kms_key.tf-kms-key.key_id
  grantee_principal = aws_iam_role.tf_lambda_role.arn
  operations        = ["Decrypt"]
}

# IAM role to give Lambda function access to DynamoDB.

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
    Name = "${var.project-name}_lambda_role"
  }
}

resource "aws_iam_role_policy" "tf_lambda_policy" {
  name = "${var.project-name}-lambda-policy"
  role = aws_iam_role.tf_lambda_role.id

  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [{
			"Effect": "Allow",
			"Action": [
				"dynamodb:BatchWriteItem",
				"dynamodb:PutItem",
				"dynamodb:UpdateItem"
			],
			"Resource": "${aws_dynamodb_table.tf-dynamodb-table.arn}"
		}
	]
}
EOF
}


# LAMBDA 
resource "aws_lambda_function" "tf_lambda_fn" {
  function_name = "${var.project-name}-lambda"
  # The bucket storing the source code artifact"
  s3_bucket        = "${var.project-name}-s3-bucket"
  s3_key           = "v${var.app-version}/lambda.zip"
  handler          = "lambda_handler.lambda_handler"
  runtime          = "python3.8"
  role             = aws_iam_role.tf_lambda_role.arn
  environment {
    variables = {
      DB_NAME = data.aws_ssm_parameter.tf_db_name.value
    }
  }
  tags = {
    Name = "${var.project-name}-lambda"
  }
  depends_on = [
    data.aws_ssm_parameter.tf_db_name, 
    aws_s3_bucket.tf-s3-bucket ,
    aws_iam_role_policy_attachment.lambda_logs,
    ]
  
}


resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"

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
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
} 

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.tf_lambda_role.id
  policy_arn = aws_iam_policy.lambda_logging.arn
}



# SSM 
resource "aws_ssm_parameter" "api_key" {
  name  = "API_KEY"
  type  = "SecureString"
  value = aws_api_gateway_api_key.tf-api-key.value

  lifecycle {
    ignore_changes = [value]
  }
}

data "aws_ssm_parameter" "tf_db_name" {
  name = "DB_NAME"
}



# DYNAMODB
resource "aws_dynamodb_table" "tf-dynamodb-table" {
  name         = var.db-name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  attribute {
    name = "id"
    type = "S"
  }
  tags = {
    Name = var.db-name
  }
  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_key.tf-kms-key.arn
  }
}

# API GATEWAY
resource "aws_api_gateway_rest_api" "tf-api-gw" {
  name        = "${var.project-name}-api-gw"
  description = "Terraform Serverless Application with DA"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
  binary_media_types = [
    "*/*"
  ]
  tags = {
    Name = "${var.project-name}-api-gw"
  }

}

resource "aws_api_gateway_resource" "users" {
  rest_api_id = aws_api_gateway_rest_api.tf-api-gw.id
  parent_id   = aws_api_gateway_rest_api.tf-api-gw.root_resource_id
  path_part   = "users"
}

resource "aws_api_gateway_method" "users" {
  rest_api_id   = aws_api_gateway_rest_api.tf-api-gw.id
  resource_id   = aws_api_gateway_resource.users.id
  http_method   = "POST"
  authorization = "NONE"
  api_key_required = true
}

resource "aws_api_gateway_integration" "lambda" {
  rest_api_id = aws_api_gateway_rest_api.tf-api-gw.id
  resource_id = aws_api_gateway_method.users.resource_id
  http_method = aws_api_gateway_method.users.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  content_handling        = "CONVERT_TO_TEXT"
  uri                     = aws_lambda_function.tf_lambda_fn.invoke_arn
}


resource "aws_api_gateway_deployment" "tf-gw-deployment" {
  depends_on = [
    aws_api_gateway_integration.lambda,
  ]

  rest_api_id = aws_api_gateway_rest_api.tf-api-gw.id
  stage_name  = "v1Serverless"
}

resource "aws_api_gateway_api_key" "tf-api-key" {
  name = "${var.project-name}-api-key"
}


resource "aws_api_gateway_usage_plan" "tf-gw-usage-plan" {
  name        = "${var.project-name}-gw-usage-plan"
  description = "usage plan for version ${var.app-version}"

  api_stages {
    api_id = aws_api_gateway_rest_api.tf-api-gw.id
    stage  = aws_api_gateway_deployment.tf-gw-deployment.stage_name
  }
}

resource "aws_api_gateway_usage_plan_key" "v1" {
  key_id        = aws_api_gateway_api_key.tf-api-key.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.tf-gw-usage-plan.id
}


resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.tf_lambda_fn.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.tf-api-gw.execution_arn}/*/*"
}


