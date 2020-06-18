variable "ami" { type = string }

variable "subnets"  { type = list(map(any))}


variable "asg_policies" {type = list(map(any))}


