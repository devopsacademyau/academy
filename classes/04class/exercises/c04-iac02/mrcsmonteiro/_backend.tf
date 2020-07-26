terraform {
  backend "s3" {
    bucket = "devops-academy-tf-backend"
    key    = "terraform/terraform.c04-iac02.tfstate"
    region = "ap-southeast-2"
  }
}