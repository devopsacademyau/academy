variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "AMIS" {
  description = "AMIS"
  type = map(string)
  #default = {
   # ap-southeast-2 = "ami-0ded330691a314693"
  #}
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


