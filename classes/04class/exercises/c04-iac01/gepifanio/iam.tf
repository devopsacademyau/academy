resource "aws_iam_role" "s3-full-access-role" {
    name = "s3-full-access-role"
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
"Sid": "EC2InstancesS3FullAccess"
}
]
}
EOF
}

resource "aws_iam_policy" "policy" {
    name = "s3_full_access_policy"
    policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
{
"Action": [
"s3:*"
],
"Effect": "Allow",
"Resource": "*"
}
]
}
EOF
}

resource "aws_iam_policy_attachment" "s3_full_access" {
    name = "ec2-s3-full_access-policy-attachment"
    roles = [
        aws_iam_role.s3-full-access-role.name
    ]
    policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_instance_profile" "iam-profile" {
    name = "iam-profile"
    role = aws_iam_role.s3-full-access-role.name
}