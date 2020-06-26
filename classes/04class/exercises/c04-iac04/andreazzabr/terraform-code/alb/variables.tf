variable projectname {type = string}
# variable publicsubnets { 
#     type = list(object({
#         name = string
#         cidr = string
#         az = string
#         publicip = bool
#     }))
# }
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
