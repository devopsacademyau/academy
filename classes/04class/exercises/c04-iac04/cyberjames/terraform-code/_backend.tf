##########################################################################################
# Define where the terraform state will be stored
##########################################################################################
terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
