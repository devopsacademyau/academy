resource "aws_s3_bucket" "ec2-starter-bucket" {
  bucket = "jaysues-terraform-test"
  acl    = "private"
}