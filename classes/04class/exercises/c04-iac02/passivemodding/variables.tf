variable "region" {
  type = string
  default = "ap-southeast-2"  
}

variable "vpc_cidr" {
  type = string
}

variable "subnet_public_1_name" {
  type = string
}
variable "subnet_public_1_cidr" {
  type = string
}
variable "subnet_public_2_name" {
  type = string
}
variable "subnet_public_2_cidr" {
  type = string
}
variable "subnet_private_1_name" {
  type = string
}
variable "subnet_private_1_cidr" {
  type = string
}
variable "subnet_private_2_name" {
  type = string
}
variable "subnet_private_2_cidr" {
  type = string
}
