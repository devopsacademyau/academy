
variable "aws_region" {
  description = "AWS region"
  type        = string
}


variable "AMIS" {
  description = "AMIS"
  type = map(string)
}

variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "stack_name" {
  description = "stack Name"
  type        = string
}

variable "ssl_certificate_id" {
  description = "Enter your certificate arn from ACM"
  type        = string
}

variable "zone_id" {
  description = "Enter your zone ID "
  type        = string
  default     = "Z0487567QK3UCA9HOK0T"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs to use"
  type        = list(string)
}

variable "allowed_security_groups" {
  description = "A list of Security Group ID's to allow access to."
  type        = list(string)
}











