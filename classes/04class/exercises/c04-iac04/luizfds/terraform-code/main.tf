module "iac_04_module" {
  source = "./iac-04-module"

  aws_region      = var.aws_region
  aws_amis        = var.aws_amis
  vpc_id          = var.vpc_id
  subnets         = var.subnets
  instance_type   = var.instance_type
  min_size        = var.min_size
  max_size        = var.max_size
}
