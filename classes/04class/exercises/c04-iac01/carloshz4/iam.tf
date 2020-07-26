#Creates the role using the trust policy
resource "aws_iam_role" "DA_EC2_TO_S3_ROLE" {
  name = "DA_EC2_TO_S3_ROLE"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF


  tags = {
    Name = "DA_EC2_TO_S3_ROLE"
  }
}

#Creates the ec2 instance profile
resource "aws_iam_instance_profile" "DA_EC2_TO_S3_ROLE-InstanceProfile" {
  name = "DA_EC2_TO_S3_ROLE-InstanceProfile"
  role = aws_iam_role.DA_EC2_TO_S3_ROLE.name
}

#Creates policy with S3 permissions and links it to the role previously created
resource "aws_iam_role_policy" "DA_EC2_TO_S3_POLICY" {
  name   = "DA_EC2_TO_S3_POLICY"
  role   = aws_iam_role.DA_EC2_TO_S3_ROLE.id
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
            "Resource": "*"
        }
    ]
}
EOF

}

