resource aws_iam_role "s3-ReadOnly-role" {
        name = "s3-ReadOnly-role"

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

resource aws_iam_policy "s3-ReadOnly-Policy" {
    name = "s3-ReadOnly-Policy"  
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

resource aws_iam_policy_attachment "s3-ReadOnly-Policy-Attach" {
   name = "s3-ReadOnly-Policy-Attach"
   roles = [aws_iam_role.s3-ReadOnly-role.name]
   policy_arn = aws_iam_policy.s3-ReadOnly-Policy.arn
}

resource aws_iam_instance_profile "s3-ReadOnly-profile1" {
    name = "s3-ReadOnly-profile1"
    role = aws_iam_role.s3-ReadOnly-role.name
}

resource "aws_iam_role_policy_attachment" "s3-ReadOnly-Policy-Attach-Role" {
  role = aws_iam_role.s3-ReadOnly-role.name
  policy_arn = aws_iam_policy.s3-ReadOnly-Policy.arn
}
