resource "aws_lambda_function" "report_count_lamda" {
  filename         = var.report_lamda
  function_name    = "report_photos_count"
  handler          = "report_photos_count.report_photos_count"
  runtime          = var.lamda_runtime
  role             = aws_iam_role.iam_for_lambda.arn
  source_code_hash = filebase64sha256(var.report_lamda)

  tags = {
    Name = "${var.project_name}-report-count-handler-lamda"
  }

  environment {
    variables = {
      SNS_ARN = aws_sns_topic.this.arn
    }
  }

}

resource "aws_cloudwatch_log_group" "report_count" {
  name              = "/aws/lambda/${aws_lambda_function.report_count_lamda.function_name}"
  retention_in_days = 1
}

resource "aws_lambda_event_source_mapping" "this" {
  event_source_arn  = aws_dynamodb_table.da_serverless.stream_arn
  enabled           = true
  function_name     = aws_lambda_function.report_count_lamda.arn
  starting_position = "LATEST"
}