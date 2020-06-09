variable "projectname" {type=string}
variable vpccidr { type=string }
variable "publicsubnets" { 
    type = list(object({
        name = string
        cidr = string
        az = string
        publicip = bool
    }))
}
