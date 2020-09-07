resource "aws_iam_role" "S3readOnly" {
  name = "S3_Readonly"
  
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": "EC2InstancesS3Readonly"
    }
  ]
}
POLICY
}

resource "aws_iam_policy" "S3readOnly" {
  name = "s3_readonly_policy"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "s3readonlypolicy",
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": [
                "arn:aws:s3:::${var.bucket_name}/*"
            ]
        }
    ]
}
POLICY
}

resource "aws_iam_policy_attachment" "S3readOnly" {
  name = "ec2-s3-readonly-policy-attachment"
  roles = [
    aws_iam_role.S3readOnly.name
  ]
  policy_arn = aws_iam_policy.S3readOnly.arn
}

resource "aws_iam_instance_profile" "S3readOnly" {
  name = "ec2-s3-readonly-profile"
  role = aws_iam_role.S3readOnly.name
}

resource "aws_iam_role_policy_attachment" "S3readOnly" {
  role       = aws_iam_role.S3readOnly.name
  policy_arn = aws_iam_policy.S3readOnly.arn
}