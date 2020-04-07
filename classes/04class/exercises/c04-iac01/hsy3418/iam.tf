#create an iam role
resource "aws_iam_role" "ec2_s3_access_role" {
        name = "s3-role"

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

resource "aws_iam_policy" "example_policy" {
    name = "example_policy"
    # role = "${aws_iam_instance_profile.example_profile.id}"
    
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Action": ["s3:ListBucket"],
        "Resource": ["arn:aws:s3:::terraformtestbucket123"]
        },
        {
        "Effect": "Allow",
        "Action": [
            "s3:PutObject",
            "s3:GetObject",
            "s3:DeleteObject"
        ],
        "Resource": ["arn:aws:s3:::terraformtestbucket123/*"]
        }
    ]
}
    EOF
}  

resource "aws_iam_policy_attachment" "test-attach" {
   name = "test-attachment"
   roles = ["${aws_iam_role.ec2_s3_access_role.name}"]
   policy_arn = "${aws_iam_policy.example_policy.arn}"
}

resource "aws_iam_instance_profile" "example_profile" {
    name = "example_profile"
    role = "${aws_iam_role.ec2_s3_access_role.name}"
}





