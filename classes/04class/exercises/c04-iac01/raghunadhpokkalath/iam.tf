resource "aws_iam_role" "ec2_s3" {
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
      "Effect": "Allow"
    }
  ]
}
EOF

  tags = {
    Name = "devops-academy-ec2-s3-role"
  }
}

resource "aws_iam_role_policy" "ec2_s3" {
  name = "ec2_s3"
  role = aws_iam_role.ec2_s3.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource":"${aws_s3_bucket.this.arn}"
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "this" {
  name = "iam_profile"
  role = aws_iam_role.ec2_s3.name
}