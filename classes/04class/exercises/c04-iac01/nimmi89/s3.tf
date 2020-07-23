resource "aws_s3_bucket" "terrform-da-bucket" {
  bucket = "da-july-bucket"
  acl    = "private"
  tags = {
    Name = "DA bucket"
  }

}  