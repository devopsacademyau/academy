# Generate a random uuid string to use as a unique identifier for bucket name
resource "random_uuid" "unique_bucket_uuid" {
}

# Create s3 bucket
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${random_uuid.unique_bucket_uuid.result}-vishaalpal-c04-iac01"

  # Apply tags to resource 
  tags = {
    Name     = "${random_uuid.unique_bucket_uuid.result}-vishaalpal"
    Student  = "Vishaal Pal"
    Exercise = "c01-iac01"
  }
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "private"
}



