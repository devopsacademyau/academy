# Create an IAM role for Ec2 instance.

resource "aws_iam_role" "ec2_s3_access_role" {
  name = "ec2_s3_access_role"
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
resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = aws_iam_role.ec2_s3_access_role.name
}



resource "aws_iam_role_policy" "S3_read_policy" {
  name = "test_policy"
  role = aws_iam_role.ec2_s3_access_role.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Effect": "Allow",
          "Action": [
              "s3:ListBucket"
          ],
          "Resource": [
              "arn:aws:s3:::da-july-bucket"
          ]
      },
      {
          "Effect": "Allow",
          "Action": [
              "s3:GetObject"
          ],
          "Resource": [
              "arn:aws:s3:::da-july-bucket/*"
          ]
      }
  ]

}
EOF
}


