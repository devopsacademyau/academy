vpc-cidr = "10.0.0.0/16"
publicsubnets = [
 {
    name = "public-a"
    cidr = "10.0.10.0/24"
    az   = "ap-southeast-2a"
    publicip = true
 },
 {
    name = "public-b"
    cidr = "10.0.20.0/24"
    az   = "ap-southeast-2b"
    publicip = true
 }
]
privatesubnets = [
  {
    name = "private-a"
    cidr = "10.0.11.0/24"
    az = "ap-southeast-2a"
    publicip = false
  },
  {
    name = "private-b"
    cidr = "10.0.21.0/24"
    az = "ap-southeast-2b"
    publicip = false
  }
]

