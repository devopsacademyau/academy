resource "aws_s3_bucket" "bucket_c04_iac01_1" {
  bucket = "bucket-c04-iac01-1"
  acl    = "private"

  tags = {
    Name   = "c04-iac01"
  }
}