# deploy ALB environment using iac-04-module
module "alb" {
  source             = "./iac-04-module/"
  subnet1_cidr       = var.subnet1_cidr
  subnet2_cidr       = var.subnet2_cidr
  ec2_ami            = var.ec2_ami
  low_cpu_threshold  = var.low_cpu_threshold
  high_cpu_threshold = var.high_cpu_threshold
}

# output App Load Balancer FQDN
output "alb_fqdn" {
  description = "Application Load Balancer FQDN"
  value       = module.alb.alb_fqdn
}

