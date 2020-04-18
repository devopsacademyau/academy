terraform {
  backend "local" {
    path = "./critical/terraform.tfstate"
  }
}