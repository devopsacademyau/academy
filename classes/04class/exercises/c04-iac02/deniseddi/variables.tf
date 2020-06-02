variable "aws_region" {
  type        = string
  default     = "ap-southeast-2"
  description = "The region where VPC will be created"
}

variable "cidr_block" {
  type        = string
  description = "the CIDR block for the VPC"
}

variable "subnet_count" {
  type        = number
  default     = "2"
  description = "The number of public and private subnets created."
}
