resource "aws_s3_bucket" "devops_c04_s3" {
  bucket = "devopsc04s3"
  acl    = "private"

  tags = {
    Name = "devopsacademyc04"
  }
}