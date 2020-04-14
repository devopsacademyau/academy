variable "aws_region" {
  type = string
}

variable "devopsacademy_vpc" {
  type = object({
    name                 = string
    cidr_block           = string
    enable_dns_support   = bool
    enable_dns_hostnames = bool
    enable_classiclink   = bool
    instance_tenancy     = string
  })
}

variable "public_subnets" {
  type = list(object({
    name       = string
    cidr_block = string
  }))
}

variable "private_subnets" {
  type = list(object({
    name       = string
    cidr_block = string
  }))
}
