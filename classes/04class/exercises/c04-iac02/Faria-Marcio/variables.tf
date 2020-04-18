variable "vpc_cidr" {
    type = string
}

variable "subnets_private_name" {
	type = "list"
}
variable "subnets_private_cidr" {
	type = "list"
}

variable "subnets_public_name" {
	type = "list"
}
variable "subnets_public_cidr" {
	type = "list"
}

variable "azs" {
	type = "list"
}

variable "eip_id" {
	type = "list"
}
