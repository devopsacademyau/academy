variable "region" {
  description = "define the aws region to deploy the resources"
  type        = string
  default     = "ap-southeast-2"
}

variable "vpc_cidr" {
  description = "define the vpc cidr_block"
  type        = string
}

variable "public_subnets" {
  description = "list of public subnets"
  type = map(object({
    cidr_block = string
    zone       = string
  }))
}

variable "private_subnets" {
  description = "list of private subnets"
  type = map(object({
    cidr_block = string
    zone       = string
  }))
}

variable "devops_class" {
  description = "define the class id from devops academy"
  type        = string
}

variable "common_tags" {
  description = "define tags which will be applied for every resource created"
  type        = map(string)
  default     = {}
}