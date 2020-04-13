output "my_subnet_ids" {
  value       = [for id in data.aws_subnet_ids.my_subnet_ids : id]
  description = "existing subnet ids"
}

output "my_subnets" {
  value       = [for subnet in data.aws_subnet.my_subnets : subnet]
  description = "existing subnets"
}

output "my_security_groups" {
  value       = [for securityGroup in data.aws_security_groups.my_security_groups : securityGroup]
  description = "existing security group"
}

output "my_launch_configuration" {
  value       = aws_launch_configuration.my_launch_configuration
  description = "new launch configuration which has been created"
}

output "my_auto_scaling_group" {
  value       = aws_autoscaling_group.my_auto_scaling_group
  description = "new auto scaling group which has been created"
}

output "my_target_group" {
  value       = aws_lb_target_group.my_target_group
  description = "new target group which has been created"
}

output "my_load_balancer" {
  value       = aws_elb.my_load_balancer
  description = "new load balance which has been created"
}


output "vpc_cidr" {
  value       = aws_vpc.my_vpc.cidr_block
  description = "Value of attribute cidr_block for the created vpc"
}
