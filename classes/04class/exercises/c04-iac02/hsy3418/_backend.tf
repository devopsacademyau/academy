terraform {
  backend "s3" {
    bucket = "adaexerciseterrafromstate"
    key    = "terraform.tfstate"
    region = "ap-southeast-2"
  }
}