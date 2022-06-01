terraform {
  required_providers {
    # Using aws provider version 4.16.0 https://registry.terraform.io/providers/hashicorp/aws/4.16.0/docs
    aws = {
      source = "hashicorp/aws"
      version = "4.16.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region  = "ap-southeast-2"
}