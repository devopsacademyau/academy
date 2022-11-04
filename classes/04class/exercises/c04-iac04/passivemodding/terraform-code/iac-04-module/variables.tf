variable "vpc_id" {
    description = "vpc to be used for the asg"
    type = string
}

variable "cpu_upper_limit" {
    description = "asg scales out when cpu is above the upper limit"
    type = number
}

variable "cpu_lower_limit" {
    description = "asg scales out when cpu is below the lower limit"
    type = number
}

variable "desired_instance_count" {
    description = "desired number of instances"
    type = number
}

variable "max_instance_count" {
    description = "max number of instances"
    type = number
}

variable "min_instance_count" {
    description = "min number of instances"

    type = number
}

variable "public_asg_subnets" {
    description = "subnets to be used for the auto scaling group"
    type = list(string)
}

variable "key_pair" {
    description = "key to be used when connecting to EC2 instances in the asg"
    type = string
}

variable "ami_image_id" {
    description = "image to be used when creating new EC2 instances"
    type = string
}