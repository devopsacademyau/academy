module "stack" {
  source                  = "./iac-04-module" 
  project_name            = var.project_name
  stack_name              = var.stack_name
  aws_region              = var.aws_region
  AMIS                    = var.AMIS
  vpc_id                  = var.vpc_id
  subnets                 = var.subnets
  allowed_security_groups = var.allowed_security_groups
  ssl_certificate_id      = var.ssl_certificate_id
  zone_id                 = var.zone_id
}


