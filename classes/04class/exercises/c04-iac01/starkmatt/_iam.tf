resource "aws_iam_instance_profile" "devops-s3-terra" {
  name = "S3-FullAccess"
  role = "S3-FullAcess"
}

