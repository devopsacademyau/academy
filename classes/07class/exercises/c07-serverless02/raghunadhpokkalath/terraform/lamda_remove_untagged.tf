resource "aws_lambda_function" "remove_untagged_instance" {
  filename         = var.remove_untagged_instance
  function_name    = "remove_untagged_instance"
  handler          = "remove_untagged_instance.lambda_handler"
  runtime          = var.lamda_runtime
  role             = aws_iam_role.iam_for_lambda.arn
  source_code_hash = filebase64sha256(var.remove_untagged_instance)

  tags = {
    Name = "${var.project_name}-remove_untagged_instance-lamda"
  }

  environment {
    variables = {
      SNS_TOPIC = aws_sns_topic.this.arn
    }
  }

}

resource "aws_cloudwatch_log_group" "remove_untagged_instance" {
  name              = "/aws/lambda/${aws_lambda_function.remove_untagged_instance.function_name}"
  retention_in_days = 1
}



resource "aws_lambda_permission" "cloudwatchevent" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.remove_untagged_instance.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.this.arn
}