variable "region" {
  description = "Define the region for providers"
}

variable "aws_ip_cidr_range" {
  type        = "string"
  description = "IP CIDR range for AWS VPC"
}

variable "subnet-name" {
  type        = "map"
  description = "Name tags for the different subnets"
}

variable "subnet-cidr" {
  type        = "map"
  description = "CIDR blocks the different subnets"
}

