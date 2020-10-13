
resource "aws_api_gateway_account" "default" {
  cloudwatch_role_arn = aws_iam_role.apigw.arn
}

resource "aws_api_gateway_rest_api" "this" {
  name = "${var.project}_api"
  tags = var.common_tags
}

resource "aws_api_gateway_resource" "customers" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_rest_api.this.root_resource_id
  path_part   = "customers"
}

resource "aws_api_gateway_method" "customers" {
  rest_api_id      = aws_api_gateway_rest_api.this.id
  resource_id      = aws_api_gateway_resource.customers.id
  http_method      = "ANY"
  authorization    = "NONE"
  api_key_required = true
}

resource "aws_api_gateway_integration" "lambda" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_method.customers.resource_id
  http_method = aws_api_gateway_method.customers.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.this.invoke_arn
}

resource "aws_api_gateway_deployment" "prod" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  stage_name  = "prod"
  depends_on = [
    aws_api_gateway_integration.lambda
  ]
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.this.execution_arn}/*/*"
}

resource "aws_api_gateway_usage_plan" "standard" {
  name = "standard_plan"
  tags = var.common_tags

  api_stages {
    api_id = aws_api_gateway_rest_api.this.id
    stage  = aws_api_gateway_deployment.prod.stage_name
  }
}

resource "aws_api_gateway_api_key" "default" {
  name        = "${var.project}_apikey"
  description = "Give access to customers endpoint"
  tags        = var.common_tags
}

resource "aws_api_gateway_usage_plan_key" "main" {
  key_id        = aws_api_gateway_api_key.default.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.standard.id
}

resource "aws_api_gateway_method_settings" "default" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  stage_name  = aws_api_gateway_deployment.prod.stage_name
  method_path = "*/*"
  settings {
    metrics_enabled    = true
    logging_level      = "INFO"
    data_trace_enabled = true
  }
}