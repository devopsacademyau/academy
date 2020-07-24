resource "aws_iam_role" "class04-iam-role" {
  name = "class04-iam-role"
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

  tags = {
    tag-key = "class04-s3-readonly-role"
  }
}

resource "aws_iam_policy" "class04-iam-policy" {
  name        = "class04-iam-policy"
  path        = "/"
  description = "Class04 IAM policy"

  policy = <<EOF
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

resource "aws_iam_policy_attachment" "class04-iam-policy-attach" {
  name = "class04-iam-policy-attach"
  roles      = [aws_iam_role.class04-iam-role.name]
  policy_arn = aws_iam_policy.class04-iam-policy.arn
}

resource "aws_iam_role_policy_attachment" "class04-iam-role-policy-attach" {
  role      = aws_iam_role.class04-iam-role.name
  policy_arn = aws_iam_policy.class04-iam-policy.arn
}

resource "aws_iam_instance_profile" "class04-iam-instance-profile" {
  name = "class04-iam-instance-profile"
  role = aws_iam_role.class04-iam-role.name
}
