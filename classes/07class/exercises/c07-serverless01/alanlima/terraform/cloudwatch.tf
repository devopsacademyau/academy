resource "aws_cloudwatch_log_group" "func_customers" {
  name              = "/aws/lambda/${aws_lambda_function.this.function_name}"
  retention_in_days = 14
}

resource "aws_cloudwatch_log_group" "func_photos_handler" {
  name              = "/aws/lambda/${aws_lambda_function.photos_handler.function_name}"
  retention_in_days = 14
}

resource "aws_cloudwatch_log_group" "func_report_count" {
  name              = "/aws/lambda/${aws_lambda_function.report_count.function_name}"
  retention_in_days = 14
}
