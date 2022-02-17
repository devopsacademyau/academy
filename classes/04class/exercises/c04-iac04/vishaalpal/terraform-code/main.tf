# Import the AWS VPC terraform module
module "vpc" {
  source                   = "terraform-aws-modules/vpc/aws"
  name                     = var.project_name
  cidr                     = var.vpc_cidr
  instance_tenancy         = var.vpc_tenancy
  enable_dns_hostnames     = var.enable_dns_hostnames
  azs                      = var.azs
  private_subnet_suffix    = var.private_subnet_suffix
  private_subnets          = var.private_subnets
  private_route_table_tags = var.private_route_table_tags
  public_subnet_suffix     = var.public_subnet_suffix
  public_subnets           = var.public_subnets
  public_route_table_tags  = var.public_route_table_tags
  create_igw               = true
  enable_nat_gateway       = true
  one_nat_gateway_per_az   = true

  tags = {
    Author = "Vishaal Pal"
  }
}

# Import the webservers module 
module "webservers" {
  source                            = "./iac-04-module"
  project_name                      = var.project_name
  vpc_id                            = module.vpc.vpc_id
  vpc_cidr                          = var.vpc_cidr
  private_subnets                   = module.vpc.private_subnets
  public_subnets                    = module.vpc.public_subnets
  asg_launch_template_desc          = var.asg_launch_template_desc
  asg_launch_template_instance_type = var.asg_launch_template_instance_type
  ec2_key_pair                      = var.ec2_key_pair
  asg_min_size                      = var.asg_min_size
  asg_max_size                      = var.asg_max_size
  asg_desired_capacity              = var.asg_desired_capacity
  ec2_high_cpu_threshold            = var.ec2_high_cpu_threshold
  ec2_low_cpu_threshold             = var.ec2_low_cpu_threshold
}
