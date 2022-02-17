###############################################################################
# VPC variables
###############################################################################
variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden."
  type        = string
}

variable "vpc_tenancy" {
  description = "A tenancy option for instances launched into the VPC."
  type        = string
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC."
  type        = bool
}

variable "azs" {
  description = "A list of availability zones names or ids in the region."
  type        = list(string)
}
variable "private_subnet_suffix" {
  description = "Additional tags for the private subnets."
  type        = string
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC."
  type        = list(string)
}

variable "private_route_table_tags" {
  description = "Additional tags for the private route tables."
  type        = map(string)
  default = {
    Name = "c04-iac04 - private route table"
  }
}

variable "public_subnet_suffix" {
  description = "Additional tags for the public subnets."
  type        = string
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC."
  type        = list(string)
}

variable "public_route_table_tags" {
  description = "Additional tags for the public route tables."
  type        = map(string)
  default = {
    Name = "c04-iac04 - public route table"
  }
}

variable "create_igw" {
  description = "Controls if an Internet Gateway is created for public subnets and the related routes that connect them."
  type        = bool
}

###############################################################################
# Security group variables
###############################################################################

###############################################################################
# Autoscaling group variables
###############################################################################
variable "asg_launch_template_desc" {
  description = "Description of the launch template."
  type        = string
}

variable "asg_launch_template_instance_type" {
  description = "The type of the instance to launch."
  type        = string
}

variable "asg_min_size" {
  description = "The minimum size of the Auto Scaling Group."
  type        = number
}

variable "asg_max_size" {
  description = "The maximum size of the Auto Scaling Group."
  type        = number
}

variable "asg_desired_capacity" {
  description = "ASG desired_capacity"
  type        = number
}

variable "ec2_high_cpu_threshold" {
  description = "High cpu threshold for the cloudwatch alarm."
  type        = number
}

variable "ec2_low_cpu_threshold" {
  description = "Low cpu threshold for the cloudwatch alarm."
  type        = number
}

###############################################################################
# Application load balancer variables
###############################################################################


###############################################################################
# Other variables
###############################################################################
variable "project_name" {
  description = "Name to be used on all the resources as identifier."
  type        = string
}

variable "ec2_key_pair" {
  description = "The key name to use for the instance."
  type        = string
}
