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
variable projectname {type=string}
variable asg_dependson {
    type = any
    default = null
}
variable albarn {type=string}
variable publicsubnets_ids {
    type = any
    default = null
}