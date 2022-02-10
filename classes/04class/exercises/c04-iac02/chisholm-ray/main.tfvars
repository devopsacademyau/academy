vpc_cidr = "10.0.0.0/16"

# subnet_mappings_priv= [
#     subnet_priv_1 = [
#     "cidr"          = "10.0.0.10/24",
#     "az"            =  "ap-southeast-2a",
#     "name"          =  "subnet_priv_1"
#     ]
#     subnet_priv_2 = [
#     "cidr"          = "10.0.0.11/24",
#     "az"            =  "ap-southeast-2b",
#     "name"          =  "subnet_priv_2"
#     ]
# ]

subnet_mappings_priv = {
    
    "subnet_1" = {
            cidr          = "10.0.10.0/24"
            az            =  "ap-southeast-2a"
            name          = "subnet_1_priv"
    }

    "subnet_2" = {
            cidr          = "10.0.11.0/24"
            az            =  "ap-southeast-2b"
            name          = "subnet_1_priv"
    }
}

subnet_mappings_pub = {
    
    "subnet_1" = {
            cidr          = "10.0.110.0/24"
            az            =  "ap-southeast-2a"
            name          = "subnet_1_pub"
    }

    "subnet_2" = {
            cidr          = "10.0.111.0/24"
            az            =  "ap-southeast-2b"
            name          = "subnet_1_pub"
    }
}
