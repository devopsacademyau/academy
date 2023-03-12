# Random String Data
resource "random_string" "random" {
  length  = 8
  upper   = false
  special = false
}

# S3 Bucket Creation
resource "aws_s3_bucket" "bucket" {
  bucket = "williamda-${random_string.random.result}"

  tags = {
    Name = "williamDAbucket"
  }
}

# S3 Bucket ACL
resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}