###############################################################################
# VPC variables
###############################################################################
variable "vpc_id" {}
variable "vpc_cidr" {}
variable "private_subnets" {}
variable "public_subnets" {}

###############################################################################
# Security group variables
###############################################################################

###############################################################################
# Autoscaling group variables
###############################################################################
variable "asg_launch_template_desc" {}
variable "asg_launch_template_instance_type" {}
variable "asg_min_size" {}
variable "asg_max_size" {}
variable "asg_desired_capacity" {}
variable "ec2_high_cpu_threshold" {}
variable "ec2_low_cpu_threshold" {}

###############################################################################
# Application load balancer variables
###############################################################################

###############################################################################
# Other variables
###############################################################################
variable "project_name" {}
variable "ec2_key_pair" {}
