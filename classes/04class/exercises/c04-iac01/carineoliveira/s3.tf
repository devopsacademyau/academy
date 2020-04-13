resource "aws_s3_bucket" "my_bucket" {
  bucket = "carineoliveirabucket"
  acl    = "private"

  tags = {
    Name   = "c04-iac01"
  }
}