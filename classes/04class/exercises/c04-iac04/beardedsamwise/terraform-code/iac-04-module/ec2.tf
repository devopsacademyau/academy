# Get the latest Amazon linux 2 AMI ID
data "aws_ami" "amzn2latest" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
  owners = ["amazon"]
}

# Create launch configuration
resource "aws_launch_configuration" "web" {
  depends_on = [ aws_security_group.sg_web ]
  name_prefix = "web-"

  image_id = data.aws_ami.amzn2latest.id 
  instance_type = "t2.micro"
  key_name = "ContinoDojo"

  security_groups = [ aws_security_group.sg_web.id ]

  user_data = file("./iac-04-module/install_apache.sh")

  lifecycle {
    create_before_destroy = true
  }
}

# Create auto scaling group
resource "aws_autoscaling_group" "web" {
  name = "c04-iac04-asg"
  depends_on = [aws_launch_configuration.web, aws_lb_target_group.tg]

  min_size             = 1
  desired_capacity     = 1
  max_size             = 2
  
  health_check_type    = "ELB"

  launch_configuration = aws_launch_configuration.web.name
  target_group_arns = ["${aws_lb_target_group.tg.arn}"]

  # enabled_metrics = [
  #   "GroupMinSize",
  #   "GroupMaxSize",
  #   "GroupDesiredCapacity",
  #   "GroupInServiceInstances",
  #   "GroupTotalInstances"
  # ]
  # metrics_granularity = "1Minute"
  vpc_zone_identifier  = [
    aws_subnet.subnet1.id,
    aws_subnet.subnet2.id
  ]
  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }
}





