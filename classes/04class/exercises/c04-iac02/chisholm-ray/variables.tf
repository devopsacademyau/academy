variable "vpc_cidr" {
    type = string
}

# variable "subnet_1_name" {
#     default = "My_Subnet_1"
#     type = string
# }

# variable "subnet_1_cidr" {
#     default = "10.1.0.0/24"
#     type = string
# }   

# variable "subnet_2_name" {
#     default = "My_Subnet_2"
#     type = string
# }

# variable "subnet_2_cidr" {
#     default = "10.2.0.0/24"
#     type = string
# } 

# variable "subnet_3_name" {
#     default = "My_Subnet_3"
#     type = string
# }

# variable "subnet_3_cidr" {
#     default = "10.3.0.0/24"
#     type = string
# } 

# variable "subnet_4_name" {
#     default = "My_Subnet_4"
#     type = string
# }

# variable "subnet_4_cidr" {
#     default = "10.4.0.0/24"
#     type = string
# } 

# variable "subnet_mappings_priv" {
#     type = map(any)

# }

variable "subnet_mappings_priv" {
    type = map(object({
        cidr = string
        az   = string
        name = string
    }))
}

variable "subnet_mappings_pub" {
    type = map(object({
        cidr = string
        az   = string
        name = string
    }))
}
