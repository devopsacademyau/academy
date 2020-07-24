resource "aws_s3_bucket" "class04-bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name        = "${var.bucket_name}"
    Environment = "Dev"
  }
}
