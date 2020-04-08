resource "aws_iam_role" "roles3read" {
    name = "roles3readonly"
    assume_role_policy = <<-EOF
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

resource "aws_iam_role_policy" "rpols3read" {
    name = "rpols3readonly"
    role = aws_iam_role.roles3read.id
    policy = <<-POLICY
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
 POLICY
}

resource "aws_iam_instance_profile" "instprof" {
  name = "s3readprofile"
  role = aws_iam_role.roles3read.name
}