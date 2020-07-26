variable "region" {
    type    = string
    default = "ap-southeast-2"
}

variable "key_pair_name" {
    type    = string
}

variable "ami" {
    type    = string
}
variable "subnets" {
    type    = string
}
variable "asg_policy_up" {
    type    = string
}
variable "asg_policy_down" {
    type    = string
}