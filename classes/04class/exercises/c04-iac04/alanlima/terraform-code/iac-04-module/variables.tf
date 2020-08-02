variable "common_tags" {
  description = "list of common tags to apply every resource"
  type        = map(string)
}

variable "vpc_id" {
  description = "aws vpc id for the autoscalling group"
  type        = string
}

variable "lb_subnets" {
  description = "list of subnets for the autoscalling group"
  type        = list(string)
}

variable "image_id" {
  description = "ami image id for the ec2 instances created by ASG"
  type        = string
}

variable "key_pair" {
  description = "key pair to allow ssh connection with the ec2 instances"
  type        = string
  default     = "kp-devops"
}

variable "devops_class" {
  description = "devops academy class identifier for the resources"
  type        = string
}

variable "scale_out_when_cpu_usage_greater_than" {
  description = "define that new instances should be created when CPU usage is greater than"
  type        = number
}

variable "scale_in_when_cpu_usage_lower_than" {
  description = "define that instances can be terminated when CPU usage is lower than"
  type        = number
}