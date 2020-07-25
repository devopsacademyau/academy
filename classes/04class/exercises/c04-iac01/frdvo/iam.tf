resource "aws_iam_role" "ec2-read-s3-role-tf" {
  name = "ec2-read-s3-role-tf"

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


resource "aws_iam_role_policy" "s3-ReadOnly-Policy-tf" {
    name = "s3-ReadOnly-Policy-tf"  
	role = aws_iam_role.ec2-read-s3-role-tf.id
	policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowReadDevopsS3Buckets",
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": [
                "arn:aws:s3:::devops-academy-terraform-bucket",
                "arn:aws:s3:::devops-academy-terraform-bucket/*"
            ]
        }
    ]
}
EOF

}
resource "aws_iam_instance_profile" "ec2-read-s3-role-tf-profile" {
  name = "ec2-read-s3-role-tf-profile"
  role = aws_iam_role.ec2-read-s3-role-tf.name
}

