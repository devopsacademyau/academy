resource "aws_s3_bucket" "devops-s3-terra" {
  bucket = "devops-s3-terra"
  acl    = "private"

  tags = {
    Name = "devops-s3-terra"
  }
}

