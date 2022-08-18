resource "aws_s3_bucket" "mayu-terrafrom-dojo" {
  bucket = "mayu-terrafrom-dojo"

  tags = {
    Name = "mayu-terrafrom-dojo"
  }
}