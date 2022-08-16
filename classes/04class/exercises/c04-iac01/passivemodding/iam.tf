# iam instance profile since we cannot connect a role directly to ec2
resource "aws_iam_instance_profile" "ec2_role" {
  name = "lj_iam_instance_role_c04_iac01"
  role = aws_iam_role.ec2_role.name

  tags = {
    Name = var.tag
  }
}

# Base iam role
resource "aws_iam_role" "ec2_role" {
  name = "lj_iam_role_c04_iac01"

  tags = {
    Name = var.tag
  }

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

# Policy to read/write to the s3 bucket, attach to the iam role
resource "aws_iam_role_policy" "policy" {
  name = "lj_iam_role_policy_c04_iac01"
  role = aws_iam_role.ec2_role.id

  policy = <<-EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": [
                    "s3:Get*",
                    "s3:Put*",
                    "s3:List*"
                ],
                "Resource": [
                    "${aws_s3_bucket.s3.arn}",
                    "${aws_s3_bucket.s3.arn}/*"
                ]
            }
        ]
    }
  EOF
}