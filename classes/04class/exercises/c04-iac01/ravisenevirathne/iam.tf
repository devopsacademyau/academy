resource "aws_iam_policy" "iam_policy" {
  name = "iam_policy"
  policy = data.aws_iam_policy_document.iam_policy_doc.json
}

data "aws_iam_policy_document" "iam_policy_doc"{
  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket"
    ]
    resources = [
      aws_s3_bucket.S3.arn
    ]
  }

    statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject"
    ]
    resources = [
      "${aws_s3_bucket.S3.arn}/*"
    ]
  }

}