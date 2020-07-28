data "aws_ami" "amz_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

module "devops_lb" {
  source = "./iac-04-module"

  image_id                              = data.aws_ami.amz_linux.id
  lb_subnets                            = var.lb_subnets
  common_tags                           = var.common_tags
  vpc_id                                = var.vpc_id
  devops_class                          = var.devops_class
  scale_out_when_cpu_usage_greater_than = var.scale_out_when_cpu_usage_greater_than
  scale_in_when_cpu_usage_lower_than    = var.scale_in_when_cpu_usage_lower_than
}