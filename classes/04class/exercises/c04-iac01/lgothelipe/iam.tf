resource "aws_iam_role" "s3_read_role" {
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
    tag-key = "s3_read_only"
  }
}


resource "aws_iam_role_policy" "s3_read_policy" {
  name = "s3_read_policy"
  role = aws_iam_role.s3_read_role.id

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "s3:Get*",
          "s3:List*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  }
  EOF
}

resource "aws_iam_instance_profile" "inst_profile" {
  name = "s3_readp_rofile"
  role = aws_iam_role.s3_read_role.name
}