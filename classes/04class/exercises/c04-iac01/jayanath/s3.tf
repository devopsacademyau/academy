resource "aws_s3_bucket" "doa_bucket" {
  bucket = var.bucket_name
  acl    = "private"
  region = "ap-southeast-2"
}

# Making the bucket private
resource "aws_s3_bucket_public_access_block" "doa_bucket" {
  bucket                  = aws_s3_bucket.doa_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}