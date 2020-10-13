resource "aws_s3_bucket" "da_photo" {
  bucket        = "raghunadhpokkalath-da-photo"
  acl           = "private"
  force_destroy = true
}

resource "aws_s3_bucket_notification" "s3_lamda_notifcation" {
  bucket = aws_s3_bucket.da_photo.id
  lambda_function {
    lambda_function_arn = aws_lambda_function.da_upload_photo.arn
    events              = ["s3:ObjectCreated:*"]
  }
}