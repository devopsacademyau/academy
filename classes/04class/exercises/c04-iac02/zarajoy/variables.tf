#variable declaration
variable "project-name" {
  	type    = string
   	description = "project name"
  	default = "c04-iac02"
}

variable "vpcCIDR" {
    description = "VPC network CIDR"
    type = string	
}

variable "instanceTenancy" {
    type    = list(string)
    description = "defult or dedicated"
    default = ["default","dedicated"]
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

variable "subnet-public-1" {
  description = "public subnet 1 name"
  type = string
}
variable "subnet-public-2" {
  description = "public subnet 2 name"
  type = string
}
variable "subnet-private-1" {
  description = "private subnet 1 name"
  type = string
}
variable "subnet-private-2" {
  description = "private subnet 2 name"
  type = string
}


