# Define location of terraform state
terraform {
  backend "s3" {
    bucket = "aug-devops-academy-tf-backend"
    key    = "terraform/terraform.c04-iac02.tfstate"
    region = "ap-southeast-2"
  }
}