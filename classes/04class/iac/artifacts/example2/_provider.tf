provider "aws" {
  version = "~> 2.0"
  region  = "ap-southeast-2"
  # export TF_VAR_profile=$AWS_PROFILE
  profile = var.profile
}