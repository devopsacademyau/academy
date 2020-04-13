variable "max_private_subnets" {
  description = "Maximum number of private subnets that can be created. The variable is used for CIDR blocks calculation"
}

variable "max_public_subnets" {
  description = "Maximum number of public subnets that can be created. The variable is used for CIDR blocks calculation"
}

variable "cidr_block" {
  type        = string
  description = "Base CIDR block which is divided into subnet CIDR blocks"
}

variable "private_subnet_name" {
  type        = string
  description = "Private subnet name"
}

variable "public_subnet_name" {
  type        = string
  description = "Public subnet name"
}