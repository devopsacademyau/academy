# Create S3 bucket named mayu-terrafrom-dojo
resource "aws_s3_bucket" "mayu-terrafrom-dojo" {
  bucket = "mayu-terrafrom-dojo"                            # Specify bucket name

  tags = {
    Name = "mayu-dojo"                                      # Tag for resource gruping 
  }
} 