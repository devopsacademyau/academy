module "web_app" {
  source = "./iac-04-module"

  vpc_cidr            = var.vpc_cidr
  subnet1_public_cidr = var.subnet1_public_cidr
  subnet1_public_name = var.subnet1_public_name
  subnet2_public_cidr = var.subnet2_public_cidr
  subnet2_public_name = var.subnet2_public_name
  ami                 = var.ami
  key_pair            = var.key_pair
  low_cpu_threshold   = var.low_cpu_threshold
  high_cpu_threshold  = var.high_cpu_threshold
}