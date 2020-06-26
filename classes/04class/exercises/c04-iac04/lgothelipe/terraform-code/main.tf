# Default VPC
module "default_vpc" {
  source = "./iac-04-module/default-vpc"
}


module "security_groups" {
  source = "./iac-04-module/security-groups"
}

module "ec2_template" {
  source = "./iac-04-module/ec2-template"

  image_id = var.image_id
  vpc_security_group_ids = [module.security_groups.ec2_sg_id]

}

module "auto_scalling" {
  source = "./iac-04-module/auto-scalling"

  scaling_up = var.scaling_up
  scaling_down = var.scaling_down
  launch_temp_id = module.ec2_template.id
  default_vpc_id = module.default_vpc.id
  image_id = var.image_id

}

module "app_load_balancer" {
  source = "./iac-04-module/app-load-balancer"

  security_groups = [module.security_groups.alb_sg_id]
  subnets_id = var.subnets_id
  target_group_arn = module.auto_scalling.arn

}