output "api_endpoint" {
  value = replace(aws_apigatewayv2_stage.main.invoke_url, "wss://", "https://")
}