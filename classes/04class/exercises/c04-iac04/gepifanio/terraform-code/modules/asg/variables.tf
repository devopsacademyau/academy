variable "vpc_id" {
  type        = string
}

variable "ami" {
  type        = string
}

variable "instance_type" {
  type        = string
}

variable "asg_policy_up" {
  type        = number
}

variable "asg_policy_down" {
  type        = number
}

variable "public_subnets" {
    description = "list of public subnets"
    type = any
}

variable "lb_arn" {
  type        = string
}