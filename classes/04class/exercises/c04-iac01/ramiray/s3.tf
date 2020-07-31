resource aws_s3_bucket "myexercisebucket" {
  bucket = "damyexercisebucket"
  acl    = "private"

  tags = {
    Name = "damyexercisebucket"
  }
}