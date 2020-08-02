variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "vpc_name" {
  description = "Tag to set on the VPC"
  type        = string
}

variable "pub_name_a" {
  type = string
}

variable "pub_name_b" {
  type = string
}

variable "pub_name_c" {
  type = string
}

variable "pub_cidr_a" {
  type = string
}

variable "pub_cidr_b" {
  type = string
}

variable "pub_cidr_c" {
  type = string
}

variable "az_a" {
  type = string
}

variable "az_b" {
  type = string
}

variable "az_c" {
  type = string
}

variable "igw_name" {
  type = string
}

variable "pub_rt_name" {
  type = string
}