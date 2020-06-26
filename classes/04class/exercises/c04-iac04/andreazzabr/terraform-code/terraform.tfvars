projectname = "c04-iac04"

vpccidr = "10.0.0.0/16"
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
ami = "ami-0970010f37c4f9c8d"
key_name = ""
inst_type = "t2.micro"