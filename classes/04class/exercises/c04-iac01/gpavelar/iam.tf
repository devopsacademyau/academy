# Create Role - According class C01-AWS02
resource "aws_iam_role" "terraform_s3_access_role" {
  name               = "terraform-s3-role"
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
    tag-key = "terraform-s3-access"
  }
}

# Create Policy
resource "aws_iam_policy" "terraform-s3-policy" {
  name        = "test_policy"
  path        = "/"
  description = "My first terraform s3 policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:Get*",
        "s3:List*"
      ],
      "Resource": ["arn:aws:s3:::${aws_s3_bucket.first_terraform_bucket.bucket}", "arn:aws:s3:::${aws_s3_bucket.first_terraform_bucket.bucket}/*"]
    }
  ]
}
EOF

}

# Attach policy
resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  roles      = [aws_iam_role.terraform_s3_access_role.name]
  policy_arn = aws_iam_policy.terraform-s3-policy.arn
}

## Provide instance profile
resource "aws_iam_instance_profile" "terraform_instance_profile" {
  name = "terraform_instance_profile"
  role = aws_iam_role.terraform_s3_access_role.name
}
