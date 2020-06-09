# Launch Template
resource "aws_launch_template" "launch_temp" {
  name           = "devops_01"
  vpc_security_group_ids = var.vpc_security_group_ids
  image_id       = var.image_id
  instance_type  = "t2.micro"
  instance_initiated_shutdown_behavior = "terminate"
    placement {
    availability_zone = "ap-southeast-2a"
  }
user_data = base64encode(var.user_data)
}
