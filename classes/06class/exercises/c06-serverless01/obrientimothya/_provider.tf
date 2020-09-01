provider "aws" {
  version = "~> 3.0"
  region  = "ap-southeast-2"
}

terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}
