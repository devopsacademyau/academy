terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

variable "region" {
    default = "ap-southeast-2"
}

provider "aws" {
  region  = var.aws_region
}