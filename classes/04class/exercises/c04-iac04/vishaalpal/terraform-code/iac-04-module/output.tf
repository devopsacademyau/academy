####################################################################################
# VPC outputs
####################################################################################


####################################################################################
# Security group outputs
####################################################################################
output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "private_instance_sg_id" {
  value = aws_security_group.private_instance_sg.id
}

####################################################################################
# Auto scaling group outputs
####################################################################################
output "asg_name" {
  value = aws_autoscaling_group.asg.name
}

output "asg_min_size" {
  value = aws_autoscaling_group.asg.min_size
}

output "asg_max_size" {
  value = aws_autoscaling_group.asg.max_size
}

output "asg_desired_capacity" {
  value = aws_autoscaling_group.asg.desired_capacity
}

####################################################################################
# Application load balancer outputs
####################################################################################
output "alb_dns_name" {
  value = aws_alb.alb.dns_name
}

###############################################################################
# Other outputs
###############################################################################
output "ec2_key_pair" {
  value = aws_key_pair.mykey.key_name
}
