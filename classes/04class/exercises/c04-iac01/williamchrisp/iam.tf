# EC2 Role for S3 access
resource "aws_iam_role" "ec2s3role" {
  name = "williamec2s3accessrole"

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

  tags = {
    Name = "williamDArole"
  }
}

# IAM Policy for ec2s3access
resource "aws_iam_policy" "ec2s3policy" {
  name        = "williamec2s3policy"
  description = "A ec2 to s3 access policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.bucket.arn}/*",
        "${aws_s3_bucket.bucket.arn}"
        ]
    }
  ]
}
EOF
}

# Attaching policy to role
resource "aws_iam_role_policy_attachment" "ec2s3policyattach" {
  role       = aws_iam_role.ec2s3role.name
  policy_arn = aws_iam_policy.ec2s3policy.arn
}