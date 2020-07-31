resource "aws_iam_role" "devopsc04_role" {
  name = "s3_readonly_role"

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
}

resource "aws_iam_instance_profile" "devopsc04_profile" {
  name = "s3_readonly_profile"
  role = aws_iam_role.devopsc04_role.name
}

resource "aws_iam_role_policy" "devopsc04_policy" {
  name = "s3_readonly_policy"
  role = aws_iam_role.devopsc04_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
            "s3:GetObject",
            "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.devops_c04_s3.bucket}/*"
    }
  ]
}
EOF
}