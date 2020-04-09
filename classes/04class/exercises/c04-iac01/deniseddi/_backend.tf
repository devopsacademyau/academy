#Configure the backend
terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}
