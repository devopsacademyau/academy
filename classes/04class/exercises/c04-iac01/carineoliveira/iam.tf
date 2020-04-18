resource "aws_iam_role" "my_role" {
    name = "my_role"

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
        tag-key = "c04-iac01"
    }
}

resource "aws_iam_role_policy_attachment" "my_policyAttachment" {
    role       = aws_iam_role.my_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_instance_profile" "my_profile" {
    name = "my_profile"
    role = aws_iam_role.my_role.name
}
