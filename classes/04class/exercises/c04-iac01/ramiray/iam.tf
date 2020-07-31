# Create IAM Role
resource aws_iam_role "myec2_role" {
  name = "myec2_role"

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


# Create EC2 instance profile
resource aws_iam_instance_profile "myec2_instance_profile" {
  name = "my_ec2_instance_profile"
  role = aws_iam_role.myec2_role.name
}

# attach iam policy 
resource aws_iam_policy_attachment "iampolicy-attach" {
  name       = "iampolicy-attach"
  roles      = [aws_iam_role.myec2_role.name]
  policy_arn = aws_iam_policy.mys3_bucket_policy.arn
}


# Create s3readonly policy 
resource aws_iam_policy "mys3_bucket_policy" {
  name   = "mys3_bucket_policy"
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


#attache iam role policy
resource aws_iam_role_policy_attachment "s3readonly_Policy_Attach_role" {
  role       = aws_iam_role.myec2_role.name
  policy_arn = aws_iam_policy.mys3_bucket_policy.arn
}