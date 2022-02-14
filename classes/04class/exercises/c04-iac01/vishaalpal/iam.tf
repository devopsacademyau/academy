# Create IAM policy
resource "aws_iam_policy" "iam_policy" {
  name        = "s3-bucket-policy"
  description = "This policy allows read/write access to the S3 bucket in c04-iac01."

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "ListBuckets",
        "Effect" : "Allow",
        "Action" : ["s3:ListBucket"],
        "Resource" : ["${aws_s3_bucket.s3_bucket.arn}"]
      },
      {
        "Sid" : "AllObjectActions",
        "Effect" : "Allow",
        "Action" : "s3:*Object",
        "Resource" : ["${aws_s3_bucket.s3_bucket.arn}/*"]
      }
    ]
  })
  # Apply tags to resource
  tags = {
    Name     = "s3-bucket-policy"
    Student  = "Vishaal Pal"
    Exercise = "c04-iac01"
  }
}

# Create IAM role
resource "aws_iam_role" "iam_role" {
  name                = "s3-bucket-role"
  description         = "This IAM role allows S3 API requests from the EC2 service."
  managed_policy_arns = [aws_iam_policy.iam_policy.arn]

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  # Apply tags to resource 
  tags = {
    Name     = "s3-bucket-role"
    Student  = "Vishaal Pal"
    Exercise = "c04-iac01"
  }
}

# Create IAM instance profile role
resource "aws_iam_instance_profile" "iam_instance_profile" {
  name = "s3-bucket-instance-profile"
  role = aws_iam_role.iam_role.name

  # Apply tags to resource 
  tags = {
    Name     = "s3-bucket-instance-profile"
    Student  = "Vishaal Pal"
    Exercise = "c04-iac01"
  }
}


