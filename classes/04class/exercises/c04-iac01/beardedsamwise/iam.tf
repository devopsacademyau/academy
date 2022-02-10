# Create IAM role
resource "aws_iam_role" "iam_role" {
  name = "c04-iam01-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    tag-key = "c04-iam01"
  }
}

# Create IAM policy 
resource "aws_iam_instance_profile" "iam_profile" {
  name = "c04-iam-profile"
  role = aws_iam_role.iam_role.name
}

# Create IAM policy allowing the EC2 access to created S3 bucket
resource "aws_iam_role_policy" "iam_policy" {
  name = "c04-iam-policy"
  role = aws_iam_role.iam_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": ["${aws_s3_bucket.bucket.arn}"]
    }
  ]
}
EOF
}