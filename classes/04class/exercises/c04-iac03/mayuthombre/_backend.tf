#Specify the backend location. In this example we will be using local backend
terraform {
  backend "local" {
    path = "./terraform/terraform.tfstate"
  }
} 