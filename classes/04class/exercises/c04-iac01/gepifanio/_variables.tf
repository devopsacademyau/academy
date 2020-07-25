variable "region" {
    type    = string
    default = "ap-southeast-2"
}

variable "availability_zone" {
    type    = string
    default = "ap-southeast-2a"
}

variable "instance_type" {
    type    = string
    default = "t2.micro"
}

variable "ami" {
    type    = string
    default = "ami-0e4bc04bd401729d6"
}

variable "key_pair_name" {
    type    = string
}