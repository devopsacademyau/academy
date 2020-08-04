variable "autoscaling_security_group_id" {}
variable "autoscaling_security_group_name" {}
variable "app_load_balancer_security_group_id" {}
variable "app_load_balancer_security_group_name" {}

variable "image_id" {
    type = string
}

variable "vpc_id" {
    type = string
}

variable "subnets_public_1_id" {
    type = string
}
variable "subnets_public_2_id" {
    type = string
}
variable "subnets_private_1_id" {
    type = string
}
variable "subnets_private_2_id" {
    type = string
}
variable "project" {
  type = string
}

variable "min_size" {
  type        = number
}

variable "max_size" {
  type        = number
}

variable "add_threshold" {
  type        = number
}

variable "remove_threshold" {
  type        = number
}

