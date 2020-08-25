resource "aws_kms_key" "encryption" {
}

resource "aws_lambda_function" "da_create_customer" {
  filename         = var.lamda_filename
  function_name    = "da_create_customer_function"
  handler          = "lambda_handler.lambda_handler"
  runtime          = var.lamda_runtime
  role             = aws_iam_role.iam_for_lambda.arn
  source_code_hash = filebase64sha256("lambda_da.zip")
  
  tags =  {
      Name = "${var.project_name}-lamda"
  }

environment {
    variables = {
      DB_NAME = data.aws_ssm_parameter.db_name.value
    }
  }

}

resource "aws_kms_grant" "this" {
  name              = "lamda-grant"
  key_id            = aws_kms_key.encryption.id
  grantee_principal = aws_iam_role.iam_for_lambda.arn
  operations        = ["Decrypt"]
}

resource "aws_cloudwatch_log_group" "customer" {
  name              = "/aws/lambda/${aws_lambda_function.da_create_customer.function_name}"
  retention_in_days = 1
}


resource "aws_lambda_permission" "customerapigw" {

  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.da_create_customer.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.customer.execution_arn}/*/*"
}

resource "aws_dynamodb_table" "da_serverless" {
  name         = var.db_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_key.encryption.arn
  }

    tags =  {
      Name = "${var.project_name}-dynamodb"
  }
}

data "aws_ssm_parameter" "db_name" {
 name  = "DB_NAME"
}
resource "aws_ssm_parameter" "db_name" {
  name  = "dbname"
  type  = "String"
  value = "DA_Serverless"

    tags =  {
      Name = "${var.project_name}-ssm"
  }
}

resource "aws_ssm_parameter" "api_key" {
  name  = "apikey"
  type  = "String"
  value = aws_api_gateway_api_key.this.value

   tags =  {
      Name = "${var.project_name}-ssm"
  }
}