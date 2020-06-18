variable projectname {type=string}
variable vpccidr { type=string }
variable publicsubnets { 
    type = list(object({
        name = string
        cidr = string
        az = string
        publicip = bool
    }))
}


variable ami {type=string}
variable key_name {type=string}
variable inst_type {type=string}
variable asg_dependson {
    type = any
    default = null
}


variable publicsubnets_ids {
    type = any
    default = null
}
variable vpcid {
    type=any
    default=null
}
variable albarn {
    type=string
    default=null
}