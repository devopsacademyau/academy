# Define the AWS provider and authentication method
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.0.0"
    }
  }
}

provider "aws" {
  region                   = "ap-southeast-2"
  shared_config_files      = ["/Users/vishaal.pal@contino.io/.aws/config"]
  shared_credentials_files = ["/Users/vishaal.pal@contino.io/.aws/credentials"]
}
