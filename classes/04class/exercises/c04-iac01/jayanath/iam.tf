# Role to run the EC2
resource "aws_iam_role" "doa_ec2_runner" {
  name = "doa_ec2_runner"

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

# Allow the role to have read only access only to a given bucket
resource "aws_iam_role_policy" "dao_ec2_runner_s3_readonly" {
  name = "dao_ec2_runner_s3_readonly"
  role = aws_iam_role.doa_ec2_runner.id

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
                "Resource": [
                    "arn:aws:s3:::${var.bucket_name}",
                    "arn:aws:s3:::${var.bucket_name}/*"
                ]
            }
        ]
    }
  EOF
}

# Instance profile to be attached to the EC2
resource "aws_iam_instance_profile" "doa_ec2_runner_instance_profile" {
  name = "doa_ec2_runner_instance_profile"
  role = aws_iam_role.doa_ec2_runner.name
}