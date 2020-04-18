resource "aws_iam_role" "s3_read_only_role" {
  name = "s3_read_only_role"

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

resource "aws_iam_instance_profile" "s3_read_only_profile" {
  name = "s3_read_only_profile"
  role = "${aws_iam_role.s3_read_only_role.name}"
}

resource "aws_iam_role_policy" "s3_read_only_policy" {
  name = "DAC04IaC01_policy"
  role = "${aws_iam_role.s3_read_only_role.id}"

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
      "Resource": "arn:aws:s3:::${aws_s3_bucket.bucket.bucket}/*"
    }
  ]
}
EOF
}