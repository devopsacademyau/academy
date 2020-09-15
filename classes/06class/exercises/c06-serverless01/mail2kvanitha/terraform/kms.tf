resource "aws_kms_key" "encryption" {
}

resource "aws_kms_grant" "this" {
  name              = "lamda-grant"
  key_id            = aws_kms_key.encryption.id
  grantee_principal = aws_iam_role.iam_for_lambda.arn
  operations        = ["Decrypt"]
}
