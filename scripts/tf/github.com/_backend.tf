terraform {
  backend "s3" {
    bucket         = "devopsacademy-terraform"
    key            = "github"
    region         = "ap-southeast-2"
    encrypt        = true
    dynamodb_table = "devopsacademy-terraform"
    role_arn       = "arn:aws:iam::085104910000:role/devopsacademy"
  }
}