resource "aws_s3_bucket" "bucket-01" {
  bucket = "terraform-test-20200409"
  acl    = "private"
  region = "ap-southeast-2"
}