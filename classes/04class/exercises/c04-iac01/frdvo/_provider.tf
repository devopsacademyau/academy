# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region                  = "ap-southeast-2"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}