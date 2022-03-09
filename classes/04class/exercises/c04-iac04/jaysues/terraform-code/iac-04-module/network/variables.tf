variable "project" {
  	type    = string
   	description = "project name"
  	default = "c04_iac04"
}
variable "vpcCIDR" {
    description = "VPC network CIDR"
    type = string	
}
variable "instanceTenancy" {
    type    = string
    description = "defult or dedicated"
    default = "default"
}
variable "dnsSupport" {
    type    = bool
    default = true
    
}
variable "dnsHostNames" {
    type    = bool
    default = true
}
variable "map_public_ip1" {
    type    = bool
    default = true
}
variable "map_public_ip2" {
    type    = bool
    default = true
}
variable "subnet_public_1" {
  description = "public subnet 1 name"
  type = string
}
variable "subnet_public_2" {
  description = "public subnet 2 name"
  type = string
}
variable "subnet_private_1" {
  description = "private subnet 1 name"
  type = string
}
variable "subnet_private_2" {
  description = "private subnet 2 name"
  type = string
}
