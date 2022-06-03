# https://registry.terraform.io/providers/hashicorp/aws/4.16.0/docs/resources/s3_bucket
resource "aws_s3_bucket" "bcurrey_iac_1_s3" {
    bucket = "bcurrey-iac-1-s3"
}
# https://registry.terraform.io/providers/hashicorp/aws/4.16.0/docs/resources/s3_bucket_acl
resource "aws_s3_bucket_acl" "bcurrey_iac_1_s3_acl" {
  bucket = aws_s3_bucket.bcurrey_iac_1_s3.id
  acl    = "private"
}