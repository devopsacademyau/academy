output "api_endpoint" {
  value = aws_api_gateway_deployment.customer.invoke_url
}

output "api_key" {
  value = aws_api_gateway_api_key.this.value
}