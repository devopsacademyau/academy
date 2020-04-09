# Create the S3 bucket
resource "aws_s3_bucket" "da_s3_test" {
  bucket = "da-s3-test"
  acl    = "private"

  tags = {
    Name = "da-s3-test"
  }

  versioning {
    enabled = true
  }
}
