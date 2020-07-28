data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

module "doa_alb_module" {
  source = "./iac-04-module"

  aws_ami            = data.aws_ami.amazon-linux-2.id
  vpc_id             = var.vpc_id
  private_subnet_ids = var.private_subnet_ids
  public_subnet_ids  = var.public_subnet_ids
  scale_up_by        = var.scale_up_by
  scale_down_by      = var.scale_down_by
}

