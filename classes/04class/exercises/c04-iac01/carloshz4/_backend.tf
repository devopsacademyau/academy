# Define where the terraform state will be stored
terraform {
  backend "local" {
    path = "/root/academy/classes/04class/exercises/c04-iac01/carloshz4/terraform.tfstate"
  }
}
