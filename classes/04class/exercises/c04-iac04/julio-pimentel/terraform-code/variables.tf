# Region and AZs 
variable "aws_region" {
  default = "ap-southeast-2"
}

variable "az_a" {
  type = string
  default = "ap-southeast-2a"
}

variable "az_b" {
  type = string
  default = "ap-southeast-2b"
}

variable "az_c" {
  type = string
  default = "ap-southeast-2c"
}

#VPC
variable "vpc_cidr" {
  description = "VPC CIDR"
  type = string
}

variable "vpc_name" {
  description = "Name to set on the VPC"
  type = string
  default = "c04-iac04-vpc"
}

#Public subnet values 
variable "pub_sub_name_1" {
  type = string
}

variable "pub_sub_name_2" {
  type = string
}

variable "pub_sub_name_3" {
  type = string
}

variable "pub_sub_cidr_1" {
  type = string
}

variable "pub_sub_cidr_2" {
  type = string
}

variable "pub_sub_cidr_3" {
  type = string
}

#Internet Gateway
variable "igw_name" {
  type = string
  default = "c04-iac04-igw"
}

variable "pub_rt_name" {
  type = string
  default = "c04-iac04-public-rt"
}

#ALB
variable "alb_name" {
  type = string
  default = "c04-iac04-alb"
}

variable "alb_sg_name" {
  type = string
  default = "c04-iac04-alb-sg"
}

#EC2 instance 
variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

#ASG policy values 
variable "asg_min" {
  type = string
}

variable "asg_desired" {
  type = string
}

variable "asg_max" {
  type = string
}