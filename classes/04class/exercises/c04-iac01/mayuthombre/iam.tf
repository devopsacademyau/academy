resource "aws_iam_role" "EC2S3AccessRole" {
  name = "EC2S3AccessRole"

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
}


resource "aws_iam_role_policy" "S3Access_policy" {
  name = "S3Access_policy"
  role = aws_iam_role.EC2S3AccessRole.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "S3:GetObjet",
          "S3:PutObject",
          "S3:ListObject"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:s3:::*"
      },
    ]
  })
}

resource "aws_iam_instance_profile" "S3Access_policy" {
  name = "S3Access_policy"
  role = aws_iam_role.EC2S3AccessRole.name
}

