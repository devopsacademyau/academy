resource "aws_lambda_function" "da_upload_photo" {
  filename         = var.photo_lamda
  function_name    = "da_photo_handler"
  handler          = "photo_handler.photo_handler"
  runtime          = var.lamda_runtime
  role             = aws_iam_role.iam_for_lambda.arn
  source_code_hash = filebase64sha256(var.photo_lamda)

  tags = {
    Name = "${var.project_name}-photo-handler-lamda"
  }

  environment {
    variables = {
      DB_NAME = data.aws_ssm_parameter.db_name.value
    }
  }

}

resource "aws_cloudwatch_log_group" "photo" {
  name              = "/aws/lambda/${aws_lambda_function.da_upload_photo.function_name}"
  retention_in_days = 1
}


resource "aws_lambda_permission" "allow_s3_bucket" {

  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.da_upload_photo.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.da_photo.arn
}
