resource "aws_iam_role" "s3_readonly" {
  name = "user_readonly_s3"
  tags = var.common_tags

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

resource "aws_iam_policy" "s3_readonly" {
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

resource "aws_iam_policy_attachment" "s3_readonly" {
  name = "ec2-s3-readonly-policy-attachment"
  roles = [
    aws_iam_role.s3_readonly.name
  ]
  policy_arn = aws_iam_policy.s3_readonly.arn
}

resource "aws_iam_instance_profile" "s3_readonly" {
  name = "ec2-s3-readonly-profile"
  role = aws_iam_role.s3_readonly.name
}

resource "aws_iam_role_policy_attachment" "s3_readonly" {
  role       = aws_iam_role.s3_readonly.name
  policy_arn = aws_iam_policy.s3_readonly.arn
}