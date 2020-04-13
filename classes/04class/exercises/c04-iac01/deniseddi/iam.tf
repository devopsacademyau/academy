
# IAM Instance Profile with proper permissions to the bucket.
resource "aws_iam_instance_profile" "test-profile" {
  name = "ec2-role"
  role = aws_iam_role.ec2-role.name
}

resource "aws_iam_role" "ec2-role" {
  name = "ec2-role"
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

resource aws_iam_role_policy "ec2-role-policy" {
  name   = "ec2-role-policy"
  role   = aws_iam_role.ec2-role.id
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
            "Resource": "arn:aws:s3:::*"
        }
    ]
}
EOF
}
