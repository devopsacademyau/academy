##########################################################################################
# Call the ALB Module and the rest of the TF
##########################################################################################
module "alb" {
  source                = "./iac-04-module/"
  vpc_cidr              = var.vpc_cidr
  vpc_name              = var.vpc_name
  subnet_pub_1_name     = var.subnet_pub_1_name
  subnet_pub_2_name     = var.subnet_pub_2_name
  subnet_pub_1_cidr     = var.subnet_pub_1_cidr
  subnet_pub_2_cidr     = var.subnet_pub_2_cidr
  subnet_public1_az     = var.subnet_public1_az
  subnet_public2_az     = var.subnet_public2_az
  internet_gateway_name = var.internet_gateway_name
  low_cpu_threshold     = var.low_cpu_threshold
  high_cpu_threshold    = var.high_cpu_threshold
  ec2_key_name          = var.ec2_key_name
}
