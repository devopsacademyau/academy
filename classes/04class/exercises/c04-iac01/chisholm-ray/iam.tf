data "aws_iam_policy_document" "policy_document" {
  statement {
    actions = [
      "s3:GetBucketLocation",
      "s3:ListAllMyBuckets"
    ]

    resources = [
        "*"
    ]

    effect = "Allow"
  }

  statement {
    actions = [
      "s3:AbortMultipartUpload",
      "s3:DeleteObject",
      "s3:DeleteObjectVersion",
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:ListMultipartUploadParts",
      "s3:PutObject",
    ]

    resources = [
      "${aws_s3_bucket.this.arn}/*",
    ]

    effect = "Allow"
  }
}

data "aws_iam_policy_document" "assume_role_policy_document" {
  statement {
    effect = "Allow"

    principals {
      identifiers = ["ec2.amazonaws.com",]
      type = "Service"
    }

    actions = [
      "sts:AssumeRole",
    ]
  }
}

resource "aws_iam_role" "role" {
  name               = "CCR-EC2-iam-role-s3-access"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy_document.json
}

resource "aws_iam_policy" "policy" {
  name        = "CCR-EC2-s3access-policy"
  description = "S3 access policy"
  policy      = data.aws_iam_policy_document.policy_document.json
}

resource "aws_iam_role_policy_attachment" "attachment" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_instance_profile" "this" {
  name  = "EC2-instance-profile"
  role = aws_iam_role.role.name
}