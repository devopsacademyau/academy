resource "random_string" "random" {
  length  = 8
  upper   = false
  special = false
}

resource "aws_s3_bucket" "marshalldaniel-s3-iac01" {
  bucket = "marshalldaniel-s3-iac01-${random_string.random.result}"

  tags = {
    Name = "marshalldaniel-s3-iac01"
  }
}

resource "aws_s3_bucket_acl" "marshalldaniel-s3-iac01-acl" {
  bucket = aws_s3_bucket.marshalldaniel-s3-iac01.id
  acl    = "private"
}
