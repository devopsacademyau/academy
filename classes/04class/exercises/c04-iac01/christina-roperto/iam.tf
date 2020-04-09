resource "aws_iam_role" "s3_read_only" {
  name = "s3_read_only"

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
    tag-key = "s3_read_only_role"
  }
}


resource "aws_iam_policy" "policy" {
  name        = "s3-read-only-policy"
  description = "s3 read only policy"

#   policy = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Action": [
#                 "s3:GetObject",
#                 "s3:List*"
#             ],
#             "Resource": "*"         
#         }
#     ]
# }
# EOF
# }

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": ["arn:aws:s3:::${aws_s3_bucket.Devops_iac01.bucket}/*"]         
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": ["arn:aws:s3:::${aws_s3_bucket.Devops_iac01.bucket}"]         
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach_to_s3_read_only" {
  role       = aws_iam_role.s3_read_only.name
  policy_arn = aws_iam_policy.policy.arn
}