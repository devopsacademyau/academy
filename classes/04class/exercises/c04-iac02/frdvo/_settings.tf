terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "> 3"
    }
  }
  backend "s3" {
    bucket = "terraform-fr"
    key    = "da/c04-iac02"
    region = "ap-southeast-2"
  }
}

provider "aws" {
  region                  = "ap-southeast-2"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}