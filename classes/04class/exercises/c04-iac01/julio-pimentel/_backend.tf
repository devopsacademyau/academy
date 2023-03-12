# Define where the terraform state will be stored
terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}