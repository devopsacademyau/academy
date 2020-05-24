module "network" {
  source  = "./network"
  projectname = var.projectname
  publicsubnets = var.public_subnets
  region = var.region
  privatesubnets = var.private_subnets
  vpccidr = var.vpc_cidr
}
module "ecr" {
  source = "./ecr"
  projectname = var.projectname
}
module "efs" {
  source = "./efs"
  project_name = var.projectname
  vpc_id = module.network.aws_vpc_id
  vpc_cidr = var.vpc_cidr
  region = var.region
  private_subnet_id = module.network.aws_subnet_private-subs_id
  security_group =  var.security_group  
  ecs_nodes_secgrp_id = module.ecs.ecs_nodes_secgrp_id
}
module "ecs" {
  source = "./ecs"
  projectname = var.projectname
  az = var.az
  inst_type = var.inst_type
  inst_key = var.inst_key
  ami_id = var.ami_id
  asg_desired_capac = var.asg_desired_capac
  asg_max_size = var.asg_max_size
  asg_min_size = var.asg_min_size
  efs_id = module.efs.efs_id
  rds_endpoint = module.rds.endpoint
  alb_sg = module.alb.alb_sg
  vpc_id = module.network.aws_vpc_id
  db_host_arn = module.rds.db_host_arn
  db_user_arn = module.rds.db_user_arn
  db_passowrd_arn = module.rds.db_passowrd_arn
  db_name_arn = module.rds.db_name_arn
  pub_sub1 = module.network.private_subnet_id1
  pub_sub2 = module.network.private_subnet_id2
  target_group_arn = module.alb.target_group_arn
  containerimage = var.containerimage
  retention_in_days = var.retention_in_days
}
module "rds" {
  source  = "./rds"
  vpc_id = module.network.aws_vpc_id
  private_subnet_id1 = module.network.private_subnet_id1
  private_subnet_id2 = module.network.private_subnet_id2
  ecs_nodes_secgrp_id = module.ecs.ecs_nodes_secgrp_id
  availability_zones = var.availability_zones
}
module "alb" {
  source = "./alb"
  projectname = var.projectname
  ami = var.ami_id
  pub_sub1 = module.network.pub_sub1
  pub_sub2 = module.network.pub_sub2
  vpc_id = module.network.aws_vpc_id
  certificate_arn = var.certificate_arn
  domainname = var.domainname
}

