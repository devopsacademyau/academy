module "iac-04-module" {
  source = "./iac-04-module"
  app_name = var.app_name
  vpc_cidr = var.vpc_cidr
  subnet_a_cidr = var.subnet_a_cidr
  subnet_b_cidr = var.subnet_b_cidr
  ami = var.ami
  min_size = var.min_size
  max_size = var.max_size
  desired_capacity = var.desired_capacity
  mem_scale_up_threshold = var.mem_scale_up_threshold
  mem_scale_down_threshold = var.mem_scale_down_threshold
}
