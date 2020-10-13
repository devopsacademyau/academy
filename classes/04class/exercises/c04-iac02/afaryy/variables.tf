
variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "ap-southeast-2"
}

variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "vpc_cidr" {
  description = "define the vpc cidr_block"
  type        = string
}

variable "public_subnets" {
    description = "list of public subnets"
    type = map
}

variable "private_subnets" {
    description = "list of private subnets"
    type = map
}


