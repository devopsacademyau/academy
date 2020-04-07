variable "availability_zone" {
    type = list(string)
    default = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
}

variable "cidr_vpc" {
    type    = string
    default = "10.0.0.0/16"
}

variable "private_subnet-a" {
    type    = string
    default = "10.0.63.0/18"
}

variable "private_subnet-b" {
    type    = string
    default = "10.0.127.0/18"
}

variable "public_subnet-a" {
    type    =  string
    default = "10.0.191.0/18"
}

variable "public_subnet-b" {
    type    =  string
    default = "10.0.255.0/18"
}
