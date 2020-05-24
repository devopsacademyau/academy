
variable "region" {
    default = "ap-southeast-2"
}

variable "vpc_cidr" { type = string }

variable "availability_zones" {
    type = list
    default = ["ap-southeast-2a", "ap-southeast-2b"]
}

variable "projectname" {type = string}

variable "public_subnets" { 
    type = list(object({
        name = string
        cidr = string
        az = string
        publicip = bool
    }))
}
variable "private_subnets" { 
    type = list(object({
        name = string
        cidr = string
        az = string
        publicip = bool
    }))
}
variable "az" {type = list}
variable "inst_type" {type = string}
variable "inst_key" {type = string}
variable "ami_id" {type=string}
variable "asg_desired_capac"  {type=string}
variable "asg_max_size"  {type=string}
variable "asg_min_size"  {type=string}
variable "private_subnet_id" {
  type = any
  default = ""
}
variable "ecs_nodes_sg_id" {
   type = string
}
variable "security_group" {
  type = list(any)
}
variable containerimage {type=string}
variable "retention_in_days" {type=number}
variable account_id {type=any}
variable certificate_arn {type=string}
variable domainname {type=string}