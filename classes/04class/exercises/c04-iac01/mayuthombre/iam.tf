# Create new IAM role
resource "aws_iam_role" "EC2S3AccessRole" {
  name = "EC2S3AccessRole"                            # Specify IAM role name
  tags = {
    name = "mayu-dojo"                                # Tag for resource gruping 
  }

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

# Create IAM role policy 
resource "aws_iam_role_policy" "S3Access_policy" {
  name = "S3Access_policy"                                            # Specify policy name
  role = aws_iam_role.EC2S3AccessRole.id                              # Instruction to attach the policy to the above created IAM role
  

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

# Create IAM instance profile that will be attached to the EC2 instance
resource "aws_iam_instance_profile" "S3Access_policy" {
  name = "S3Access_policy"                                            # Give IAM instance profile a name
  role = aws_iam_role.EC2S3AccessRole.name                            # Attach the above created IAM role to the IAM instance profile. 
  tags = {
    name = "mayu-dojo"                                                # Tag for resource gruping 
  }
}

