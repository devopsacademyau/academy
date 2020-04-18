resource aws_iam_role "S3-ReadOnly" {
  name = "S3-ReadOnly"
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

resource aws_iam_instance_profile "devops-s3-terra" {
  name = "S3-ReadOnly"
  role = aws_iam_role.S3-ReadOnly.name
}

resource aws_iam_role_policy "S3-ReadOnlyPolicy" {
  name = "S3-ReadOnlyPolicy"
  role = aws_iam_role.S3-ReadOnly.id
  policy = <<-EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
