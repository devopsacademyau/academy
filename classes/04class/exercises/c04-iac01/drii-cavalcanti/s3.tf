resource "aws_s3_bucket" "b" {
  bucket = "devopsacademy-bucket"
  acl    = "private"

  tags = {
    Name = "devopsacademy-bucket"
  }
}
