# search for latest amazon linux 2 image
data "aws_ami" "this" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

module "iac-module" {
    source = "./iac-04-module"

    ami_image_id = data.aws_ami.this.id

    vpc_id = var.vpc_id
    cpu_upper_limit = var.cpu_upper_limit
    cpu_lower_limit = var.cpu_lower_limit
    desired_instance_count = var.desired_instance_count
    max_instance_count = var.max_instance_count
    min_instance_count = var.min_instance_count
    public_asg_subnets = var.public_asg_subnets
    key_pair = var.key_pair    
}