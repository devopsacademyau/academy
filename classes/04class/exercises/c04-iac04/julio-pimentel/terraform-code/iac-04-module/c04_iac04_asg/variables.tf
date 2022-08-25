#EC2 instance 
variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

#Public subnets CIDR IDs
variable "pub_cidr_id_1" {
  type = string
}

variable "pub_cidr_id_2" {
  type = string
}

variable "pub_cidr_id_3" {
  type = string
}

#ASG policy values 
variable "asg_desired" {
  type = string
}

variable "asg_min" {
  type = string
}

variable "asg_max" {
  type = string
}

#ALB target group ARN 
variable "alb_tg_arn" {
  type = string
}

variable "alb_sg_id" {
  type = string
}