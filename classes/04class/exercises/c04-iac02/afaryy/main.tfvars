project_name = "da-c04-iac02"

vpc_cidr = "10.0.0.0/16"

public_subnets = {
    public_subnet_a = {
        cidr_block = "10.0.1.0/24"
        zone       = "ap-southeast-2a"
    }
    public_subnet_b = {
        cidr_block = "10.0.2.0/24"
        zone       = "ap-southeast-2b"
    }
}

private_subnets = {
    private_subnet_a = {
        cidr_block = "10.0.11.0/24"
        zone       = "ap-southeast-2a"
    }
    private_subnet_b = {
        cidr_block = "10.0.22.0/24"
        zone       = "ap-southeast-2b"
    }
}

