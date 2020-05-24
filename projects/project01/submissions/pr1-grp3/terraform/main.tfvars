projectname = "pr1-grp3"
region = "ap-southeast-2"
public_subnets = [
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
private_subnets = [
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
private_subnet_id = ""
ecs_nodes_sg_id = ""
vpc_cidr = "10.0.0.0/16"
security_group = [
    {
        id = ""
    }
]
az = [
    "ap-southeast-2a",
    "ap-southeast-2b"
]
inst_type = "t2.micro"
inst_key = ""
ami_id = "ami-064db566f79006111"
asg_desired_capac = "2"
asg_max_size = "2"
asg_min_size = "1"
account_id = ""
retention_in_days = 30


#TO BE UPDATED BY COMPANY
certificate_arn = "arn:aws:acm:ap-southeast-2:048355378787:certificate/a0d93fca-274b-44e6-8d77-5bd0be235ecb"
domainname = "devopsandreazza.tk."