module "devopsacademy-iac-alb-asg" {
  source            = "./iac-04-module"
  vpc               = var.vpc
  public_subnet_ids = var.public_subnet_ids
  ami_id            = var.ami_id
  tags              = var.tags
  scales            = var.scales
}