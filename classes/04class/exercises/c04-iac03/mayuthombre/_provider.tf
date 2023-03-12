# Configure the AWS Provider to download plugins during terraform init
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Specify region to deploy and manage AWS resources. DO NOT INCLUDE ACCESS KEYS.. Use GitHub secrets instead
provider "aws" {
  region     = "ap-southeast-2"
 } 