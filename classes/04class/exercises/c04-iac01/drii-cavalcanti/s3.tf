resource "aws_s3_bucket" "b" {
  bucket = "bucket-devopsacademy"
  acl    = "private"

  tags = {
    Name = "bucket-devopsacademy"
  }
}
