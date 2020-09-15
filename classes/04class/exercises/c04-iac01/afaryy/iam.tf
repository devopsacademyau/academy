resource "aws_iam_role" "ec2-s3-role" {
  name               = "${var.project_name}-ec2-s3-role"
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
      "Sid": "InstanceS3Role"
    }
  ]
}
EOF

  tags = {
    Name = "${var.project_name}-ec2-s3-role"
  }
}

resource "aws_iam_instance_profile" "s3-role-instanceprofile" {
  name = "${var.project_name}-s3-role-instanceprofile"
  role = aws_iam_role.ec2-s3-role.name
}

resource "aws_iam_role_policy" "s3-role-policy" {
  name = "${var.project_name}-s3-role-policy"
  role = aws_iam_role.ec2-s3-role.id
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
              "${aws_s3_bucket.bucket.arn}",
              "${aws_s3_bucket.bucket.arn}/*"
            ]
        }
    ]
}
EOF
}
