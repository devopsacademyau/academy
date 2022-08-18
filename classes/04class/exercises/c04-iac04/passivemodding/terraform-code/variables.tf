variable "aws_region" {
  description = "aws region to use"
  type        = string
  default     = "ap-southeast-2"
}


variable "vpc_id" {
    description = "vpc to be used for the asg"
    type = string
}

variable "cpu_upper_limit" {
    description = "asg scales out when cpu is above the upper limit"
    type = number
    default = 60
}

variable "cpu_lower_limit" {
    description = "asg scales out when cpu is below the lower limit"
    type = number
    default = 20
}

variable "desired_instance_count" {
    description = "desired number of instances"
    type = number
    default = 2
}

variable "max_instance_count" {
    description = "max number of instances"
    type = number
    default = 4
}

variable "min_instance_count" {
    description = "min number of instances"
    type = number
    default = 1
}

variable "public_asg_subnets" {
    description = "subnets to be used for the auto scaling group"
    type = list(string)
}

variable "key_pair" {
    description = "key to be used when connecting to EC2 instances in the asg"
    type = string
}