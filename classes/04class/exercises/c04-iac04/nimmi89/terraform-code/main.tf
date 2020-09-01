data "aws_ami" "amz_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}


module "DA-iac-04-module" {
  source          = "./iac-04-module"
  image_id        = data.aws_ami.amz_linux.id
  vpc_id          = var.vpc_id
  subnets         = var.subnets
  cpu-upper-limit = var.cpu-upper-limit
  cpu-lower-limit = var.cpu-lower-limit
}
