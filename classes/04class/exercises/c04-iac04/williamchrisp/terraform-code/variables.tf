# Variables
variable "vpc_cidr" {
  type = string
}
variable "subnet1_public_name" {
  type = string
}
variable "subnet1_public_cidr" {
  type = string
}
variable "subnet2_public_name" {
  type = string
}
variable "subnet2_public_cidr" {
  type = string
}
variable "ami" {
  type = string
}
variable "high_cpu_threshold" {
  type = string
}
variable "low_cpu_threshold" {
  type = string
}
variable "key_pair" {
  type = string
}