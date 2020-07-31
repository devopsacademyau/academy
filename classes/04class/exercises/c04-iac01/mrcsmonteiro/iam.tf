resource "aws_iam_role" "ec2_s3_role" {
  name               = "ec2_s3_role"
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
      "Sid": "EC2Role"
    }
  ]
}
EOF

  tags = {
    Name = "ec2_s3_role"
  }
}

resource "aws_iam_instance_profile" "ec2_profile_s3" {
  name = "ec2_profile_s3"
  role = aws_iam_role.ec2_s3_role.name
}

resource "aws_iam_role_policy" "s3_policy" {
  name   = "s3_policy"
  role   = aws_iam_role.ec2_s3_role.name
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
        "Resource": [
          "arn:aws:s3:::*"
        ]
      }
    ]
  }
  EOF
}