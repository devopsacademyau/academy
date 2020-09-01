output "lambda_invoke_arn" {
  value = aws_lambda_function.this.invoke_arn
}

output "api_url" {
  value = aws_api_gateway_deployment.prod.invoke_url
}

output "api_key" {
  value = aws_api_gateway_api_key.default.value
}