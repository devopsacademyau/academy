module "c04_iac04_vpc" {
  source = "./iac-04-module/c04_iac04_vpc"

  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
  az_a = var.az_a
  az_b = var.az_b
  az_c = var.az_c
  pub_sub_name_1 = var.pub_sub_name_1
  pub_sub_name_2 = var.pub_sub_name_2
  pub_sub_name_3 = var.pub_sub_name_3
  pub_sub_cidr_1 = var.pub_sub_cidr_1
  pub_sub_cidr_2 = var.pub_sub_cidr_2
  pub_sub_cidr_3 = var.pub_sub_cidr_3
  igw_name = var.igw_name
  pub_rt_name = var.pub_rt_name
}

module "c04_iac04_sg" {
  source = "./iac-04-module/c04_iac04_sg"

  vpc_id = module.c04_iac04_vpc.vpc_id
  alb_sg_name = var.alb_sg_name

  depends_on = [module.c04_iac04_vpc]
}

module "c04_iac04_alb" {
  source = "./iac-04-module/c04_iac04_alb"

  pub_cidr_id_1 = module.c04_iac04_vpc.pub_cidr_id_1
  pub_cidr_id_2 = module.c04_iac04_vpc.pub_cidr_id_2
  pub_cidr_id_3 = module.c04_iac04_vpc.pub_cidr_id_3
  alb_name = var.alb_name
  alb_sg_id = module.c04_iac04_sg.alb_sg_id
  vpc_id = module.c04_iac04_vpc.vpc_id

  depends_on = [module.c04_iac04_vpc, module.c04_iac04_sg]
}


module "c04_iac04_asg" {
  source = "./iac-04-module/c04_iac04_asg"

  ami_id = var.ami_id
  instance_type = var.instance_type
  pub_cidr_id_1 = module.c04_iac04_vpc.pub_cidr_id_1
  pub_cidr_id_2 = module.c04_iac04_vpc.pub_cidr_id_2
  pub_cidr_id_3 = module.c04_iac04_vpc.pub_cidr_id_3
  asg_desired = var.asg_desired
  asg_min = var.asg_min
  asg_max = var.asg_max
  alb_tg_arn = module.c04_iac04_alb.alb_tg_arn
  alb_sg_id = module.c04_iac04_sg.alb_sg_id

  depends_on = [module.c04_iac04_vpc, module.c04_iac04_sg]
}