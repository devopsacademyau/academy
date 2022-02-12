module "vpc" {
  source       = "./iac-04-module/"
  subnet1_cidr = var.subnet1_cidr
  subnet2_cidr = var.subnet2_cidr
  ec2_ami = var.ec2_ami
}
