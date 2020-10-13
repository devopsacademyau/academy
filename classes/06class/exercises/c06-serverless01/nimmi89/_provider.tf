provider "aws" {
  version = "~> 2.0"
  region  = "ap-southeast-2"
}

terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}
  