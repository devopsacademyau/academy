resource "aws_iam_instance_profile" "marshalldaniel-profile" {
  name = "marshalldaniel-profile"
  role = aws_iam_role.marshalldaniel-role.name
}

resource "aws_iam_role" "marshalldaniel-role" {
  name = "marshalldaniel-role"
  path = "/"

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

resource "aws_iam_policy" "marshalldaniel-instance-role-s3" {
  name        = "marshalldaniel-instance-role-s3"
  description = "Allows access to S3 bucket ${aws_s3_bucket.marshalldaniel-s3-iac01.arn}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket"],
      "Resource": ["${aws_s3_bucket.marshalldaniel-s3-iac01.arn}"]
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject"
      ],
      "Resource": ["${aws_s3_bucket.marshalldaniel-s3-iac01.arn}/*"]
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "policy-attach" {
  name       = "policy-attach"
  roles      = [aws_iam_role.marshalldaniel-role.name]
  policy_arn = aws_iam_policy.marshalldaniel-instance-role-s3.arn
}
