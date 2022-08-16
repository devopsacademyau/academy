# default s3 bucket
resource "aws_s3_bucket" "s3" {
  bucket = var.s3bucketname

  tags = {
    Name = var.tag
  }
}