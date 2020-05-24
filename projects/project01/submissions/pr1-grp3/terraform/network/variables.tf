variable "projectname" {
    default = "devopsacademy-project"
    type = string
}

variable "region" {
    default = "ap-southeast-2"
    type = string
}
variable "vpccidr" {
    default = "10.0.0.0/16"
    type = string
}
variable "publicsubnets" { 
    type = list(object({
        name = string
        cidr = string
        az = string
        publicip = bool
    }))
}
variable "privatesubnets" { 
    type = list(object({
        name = string
        cidr = string
        az = string
        publicip = bool
    }))
}