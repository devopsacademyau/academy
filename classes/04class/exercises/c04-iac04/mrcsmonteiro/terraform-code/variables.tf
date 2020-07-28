variable "aws_region" {
  default = "ap-southeast-2"
}

variable "az_a" {
  type    = string
  default = "ap-southeast-2a"
}

variable "az_b" {
  type    = string
  default = "ap-southeast-2b"
}

variable "az_c" {
  type    = string
  default = "ap-southeast-2c"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "vpc_name" {
  description = "Name to set on the VPC"
  type        = string
}

variable "sub_pub_name_a" {
  type = string
}

variable "sub_pub_name_b" {
  type = string
}

variable "sub_pub_name_c" {
  type = string
}

variable "sub_pub_cidr_a" {
  type = string
}

variable "sub_pub_cidr_b" {
  type = string
}

variable "sub_pub_cidr_c" {
  type = string
}

variable "igw_name" {
  type = string
}

variable "pub_rt_name" {
  type = string
}

variable "alb_name" {
  type = string
}

variable "alb_sg_name" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "asg_desired" {
  type = string
}

variable "asg_min" {
  type = string
}

variable "asg_max" {
  type = string
}

variable "my_ip" {
  type = string
}