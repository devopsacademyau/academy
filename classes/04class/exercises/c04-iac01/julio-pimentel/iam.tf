resource "aws_iam_role" "ec2_trust_role_1" {
  name = "ec2_trust_role_1"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  tags = {
    tag-key = "c04-iac01"
  }
}


resource "aws_iam_policy" "s3_read_policy_1" {
  name        = "s3_read_policy_1"
  description = "S3 read only policy"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetBucketLocation",
                "s3:ListAllMyBuckets"
            ],
            "Resource": "arn:aws:s3:::*"
        },
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::${aws_s3_bucket.bucket_c04_iac01_1.bucket}",
                "arn:aws:s3:::${aws_s3_bucket.bucket_c04_iac01_1.bucket}/*"
            ]
        }
    ]
}

  EOF
}

resource "aws_iam_role_policy_attachment" "attach_s3_read_policy_1" {
  role       = aws_iam_role.ec2_trust_role_1.name
  policy_arn = aws_iam_policy.s3_read_policy_1.arn
}