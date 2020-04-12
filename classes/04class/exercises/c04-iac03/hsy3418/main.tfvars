vpc_cidr = "10.0.0.0/18"

public_subnets = [
    {
        name = "public-a"
        cidr = "10.0.10.0/24"
        az   = "ap-southeast-2a"
    },
    {
        name = "public-b-iac03"
        cidr = "10.0.1.0/24"
        az   = "ap-southeast-2b"
    }
]

private_subnets = [
    {
        name = "private-a"
        cidr = "10.0.2.0/24"
        az   = "ap-southeast-2a"
    },
    {
        name = "private-b"
        cidr = "10.0.3.0/24"
        az   = "ap-southeast-2a" 
    }
]