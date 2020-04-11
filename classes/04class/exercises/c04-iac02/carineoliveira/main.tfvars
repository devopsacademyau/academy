vpc_cidr = "10.0.0.0/16"

subnets = [
        {
        cidr = "10.0.3.0/24"
        zone = "ap-southeast-2a"
        public = true
    },
    {
        cidr = "10.0.4.0/24"
        zone = "ap-southeast-2b"
        public = true
    },
    {
        cidr = "10.0.0.0/24"
        zone = "ap-southeast-2a"
        public = false
    },
    {
        cidr = "10.0.1.0/24"
        zone = "ap-southeast-2b"
        public = false
    }
]

