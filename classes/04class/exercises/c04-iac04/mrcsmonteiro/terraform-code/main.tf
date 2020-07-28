module "vpc" {
  source = "./iac-04-module/vpc"

  vpc_cidr    = var.vpc_cidr
  vpc_name    = var.vpc_name
  az_a        = var.az_a
  az_b        = var.az_b
  az_c        = var.az_c
  pub_name_a  = var.sub_pub_name_a
  pub_name_b  = var.sub_pub_name_b
  pub_name_c  = var.sub_pub_name_c
  pub_cidr_a  = var.sub_pub_cidr_a
  pub_cidr_b  = var.sub_pub_cidr_b
  pub_cidr_c  = var.sub_pub_cidr_c
  igw_name    = var.igw_name
  pub_rt_name = var.pub_rt_name
}

module "alb" {
  source = "./iac-04-module/alb"

  pub_cidr_id_a = module.vpc.pub_cidr_id_a
  pub_cidr_id_b = module.vpc.pub_cidr_id_b
  pub_cidr_id_c = module.vpc.pub_cidr_id_c
  alb_name      = var.alb_name
  alb_sg_id     = module.sg.alb_sg_id
  vpc_id        = module.vpc.vpc_id
  asg_id        = module.asg.asg_id
}

module "sg" {
  source = "./iac-04-module/sg"

  vpc_id      = module.vpc.vpc_id
  alb_sg_name = var.alb_sg_name
  my_ip       = var.my_ip
}

module "asg" {
  source = "./iac-04-module/asg"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  pub_cidr_id_a = module.vpc.pub_cidr_id_a
  pub_cidr_id_b = module.vpc.pub_cidr_id_b
  pub_cidr_id_c = module.vpc.pub_cidr_id_c
  asg_desired   = var.asg_desired
  asg_min       = var.asg_min
  asg_max       = var.asg_max
  alb_tg_arn    = module.alb.alb_tg_arn
}