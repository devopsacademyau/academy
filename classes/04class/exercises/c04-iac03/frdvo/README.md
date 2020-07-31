# C04-IAC03

## Terraform plan output
````bash
terraform plan  -var-file="main2.tfvars"
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

aws_vpc.devopsacademy_iac_vpc: Refreshing state... [id=vpc-018899351a1decbc9]
aws_eip.devopsacademy_iac_nat_eip: Refreshing state... [id=eipalloc-0c73bab10982fe407]
aws_subnet.public_subnet_1: Refreshing state... [id=subnet-0b75b10899de216e5]
aws_subnet.public_subnet_2: Refreshing state... [id=subnet-03d7671163be3cceb]
aws_subnet.private_subnet_1: Refreshing state... [id=subnet-0ad975f2c256105ab]
aws_internet_gateway.devopsacademy_iac_vpc_gw: Refreshing state... [id=igw-00c42a2f8b23118a9]
aws_subnet.private_subnet_2: Refreshing state... [id=subnet-0471ad82344dad06c]
aws_route_table.devopsacademy_iac_vpc_public_rt: Refreshing state... [id=rtb-03aecf0369be7f429]
aws_nat_gateway.devopsacademy_iac_vpc_nat_gw: Refreshing state... [id=nat-0d4c04bebef945578]
aws_route_table_association.public_subnet_1: Refreshing state... [id=rtbassoc-08a3f48ddcd85e473]
aws_route_table_association.public_subnet_2: Refreshing state... [id=rtbassoc-08e8de856be261a2b]
aws_route_table.devopsacademy_iac_vpc_private_rt: Refreshing state... [id=rtb-0ef2bc016b3d5e779]
aws_route_table_association.private_subnet_2: Refreshing state... [id=rtbassoc-0e6b6938fedac1c50]
aws_route_table_association.private_subnet_1: Refreshing state... [id=rtbassoc-0bc694ed0286c9878]

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_internet_gateway.devopsacademy_iac_vpc_gw will be updated in-place
  ~ resource "aws_internet_gateway" "devopsacademy_iac_vpc_gw" {
        arn      = "arn:aws:ec2:ap-southeast-2:165765640813:internet-gateway/igw-00c42a2f8b23118a9"
        id       = "igw-00c42a2f8b23118a9"
        owner_id = "165765640813"
        tags     = {
            "Name" = "devopsacademy_iac_vpc_igw"
        }
      ~ vpc_id   = "vpc-018899351a1decbc9" -> (known after apply)
    }

  # aws_nat_gateway.devopsacademy_iac_vpc_nat_gw must be replaced
-/+ resource "aws_nat_gateway" "devopsacademy_iac_vpc_nat_gw" {
        allocation_id        = "eipalloc-0c73bab10982fe407"
      ~ id                   = "nat-0d4c04bebef945578" -> (known after apply)
      ~ network_interface_id = "eni-00f324e6828e43992" -> (known after apply)
      ~ private_ip           = "10.0.201.227" -> (known after apply)
      ~ public_ip            = "54.206.203.67" -> (known after apply)
      ~ subnet_id            = "subnet-0ad975f2c256105ab" -> (known after apply) # forces replacement
        tags                 = {
            "Name" = "devopsacademy_iac_vpc_nat_gw"
        }
    }

  # aws_route_table.devopsacademy_iac_vpc_private_rt must be replaced
-/+ resource "aws_route_table" "devopsacademy_iac_vpc_private_rt" {
      ~ id               = "rtb-0ef2bc016b3d5e779" -> (known after apply)
      ~ owner_id         = "165765640813" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      ~ route            = [
          - {
              - cidr_block                = "0.0.0.0/0"
              - egress_only_gateway_id    = ""
              - gateway_id                = ""
              - instance_id               = ""
              - ipv6_cidr_block           = ""
              - nat_gateway_id            = "nat-0d4c04bebef945578"
              - network_interface_id      = ""
              - transit_gateway_id        = ""
              - vpc_peering_connection_id = ""
            },
            {
                cidr_block                = "0.0.0.0/0"
                egress_only_gateway_id    = ""
                gateway_id                = ""
                instance_id               = ""
                ipv6_cidr_block           = ""
                nat_gateway_id            = (known after apply)
                network_interface_id      = ""
                transit_gateway_id        = ""
                vpc_peering_connection_id = ""
            },
        ]
        tags             = {
            "Name" = "devopsacademy_iac-vpc-private-rt"
        }
      ~ vpc_id           = "vpc-018899351a1decbc9" -> (known after apply) # forces replacement
    }

  # aws_route_table.devopsacademy_iac_vpc_public_rt must be replaced
-/+ resource "aws_route_table" "devopsacademy_iac_vpc_public_rt" {
      ~ id               = "rtb-03aecf0369be7f429" -> (known after apply)
      ~ owner_id         = "165765640813" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
        route            = [
            {
                cidr_block                = "0.0.0.0/0"
                egress_only_gateway_id    = ""
                gateway_id                = "igw-00c42a2f8b23118a9"
                instance_id               = ""
                ipv6_cidr_block           = ""
                nat_gateway_id            = ""
                network_interface_id      = ""
                transit_gateway_id        = ""
                vpc_peering_connection_id = ""
            },
        ]
        tags             = {
            "Name" = "devopsacademy_iac_vpc_public_rt"
        }
      ~ vpc_id           = "vpc-018899351a1decbc9" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private_subnet_1 must be replaced
-/+ resource "aws_route_table_association" "private_subnet_1" {
      ~ id             = "rtbassoc-0bc694ed0286c9878" -> (known after apply)
      ~ route_table_id = "rtb-0ef2bc016b3d5e779" -> (known after apply)
      ~ subnet_id      = "subnet-0ad975f2c256105ab" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private_subnet_2 must be replaced
-/+ resource "aws_route_table_association" "private_subnet_2" {
      ~ id             = "rtbassoc-0e6b6938fedac1c50" -> (known after apply)
      ~ route_table_id = "rtb-0ef2bc016b3d5e779" -> (known after apply)
      ~ subnet_id      = "subnet-0471ad82344dad06c" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public_subnet_1 must be replaced
-/+ resource "aws_route_table_association" "public_subnet_1" {
      ~ id             = "rtbassoc-08a3f48ddcd85e473" -> (known after apply)
      ~ route_table_id = "rtb-03aecf0369be7f429" -> (known after apply)
      ~ subnet_id      = "subnet-0b75b10899de216e5" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public_subnet_2 must be replaced
-/+ resource "aws_route_table_association" "public_subnet_2" {
      ~ id             = "rtbassoc-08e8de856be261a2b" -> (known after apply)
      ~ route_table_id = "rtb-03aecf0369be7f429" -> (known after apply)
      ~ subnet_id      = "subnet-03d7671163be3cceb" -> (known after apply) # forces replacement
    }

  # aws_subnet.private_subnet_1 must be replaced
-/+ resource "aws_subnet" "private_subnet_1" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:165765640813:subnet/subnet-0ad975f2c256105ab" -> (known after apply)
        assign_ipv6_address_on_creation = false
      ~ availability_zone               = "ap-southeast-2b" -> (known after apply)
      ~ availability_zone_id            = "apse2-az3" -> (known after apply)
        cidr_block                      = "10.0.201.0/24"
      ~ id                              = "subnet-0ad975f2c256105ab" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "165765640813" -> (known after apply)
      ~ tags                            = {
          ~ "Name" = "private_subnet_1" -> "new_private_subnet_1"
        }
      ~ vpc_id                          = "vpc-018899351a1decbc9" -> (known after apply) # forces replacement
    }

  # aws_subnet.private_subnet_2 must be replaced
-/+ resource "aws_subnet" "private_subnet_2" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:165765640813:subnet/subnet-0471ad82344dad06c" -> (known after apply)
        assign_ipv6_address_on_creation = false
      ~ availability_zone               = "ap-southeast-2c" -> (known after apply)
      ~ availability_zone_id            = "apse2-az2" -> (known after apply)
        cidr_block                      = "10.0.202.0/24"
      ~ id                              = "subnet-0471ad82344dad06c" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "165765640813" -> (known after apply)
      ~ tags                            = {
          ~ "Name" = "private_subnet_2" -> "new_private_subnet_2"
        }
      ~ vpc_id                          = "vpc-018899351a1decbc9" -> (known after apply) # forces replacement
    }

  # aws_subnet.public_subnet_1 must be replaced
-/+ resource "aws_subnet" "public_subnet_1" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:165765640813:subnet/subnet-0b75b10899de216e5" -> (known after apply)
        assign_ipv6_address_on_creation = false
      ~ availability_zone               = "ap-southeast-2b" -> (known after apply)
      ~ availability_zone_id            = "apse2-az3" -> (known after apply)
      ~ cidr_block                      = "10.0.101.0/24" -> "10.0.128.0/24" # forces replacement
      ~ id                              = "subnet-0b75b10899de216e5" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "165765640813" -> (known after apply)
        tags                            = {
            "Name" = "public_subnet_1"
        }
      ~ vpc_id                          = "vpc-018899351a1decbc9" -> (known after apply) # forces replacement
    }

  # aws_subnet.public_subnet_2 must be replaced
-/+ resource "aws_subnet" "public_subnet_2" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:165765640813:subnet/subnet-03d7671163be3cceb" -> (known after apply)
        assign_ipv6_address_on_creation = false
      ~ availability_zone               = "ap-southeast-2a" -> (known after apply)
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
      ~ cidr_block                      = "10.0.102.0/24" -> "10.0.129.0/24" # forces replacement
      ~ id                              = "subnet-03d7671163be3cceb" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "165765640813" -> (known after apply)
        tags                            = {
            "Name" = "public_subnet_2"
        }
      ~ vpc_id                          = "vpc-018899351a1decbc9" -> (known after apply) # forces replacement
    }

  # aws_vpc.devopsacademy_iac_vpc must be replaced
-/+ resource "aws_vpc" "devopsacademy_iac_vpc" {
      ~ arn                              = "arn:aws:ec2:ap-southeast-2:165765640813:vpc/vpc-018899351a1decbc9" -> (known after apply)
        assign_generated_ipv6_cidr_block = false
      ~ cidr_block                       = "10.0.0.0/16" -> "10.0.128.0/17" # forces replacement
      ~ default_network_acl_id           = "acl-0d712dc8a5f222352" -> (known after apply)
      ~ default_route_table_id           = "rtb-0b77d34b011e7125a" -> (known after apply)
      ~ default_security_group_id        = "sg-003916388e57a0410" -> (known after apply)
      ~ dhcp_options_id                  = "dopt-fd1f919a" -> (known after apply)
      ~ enable_classiclink               = false -> (known after apply)
      ~ enable_classiclink_dns_support   = false -> (known after apply)
      ~ enable_dns_hostnames             = false -> (known after apply)
        enable_dns_support               = true
      ~ id                               = "vpc-018899351a1decbc9" -> (known after apply)
        instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      ~ main_route_table_id              = "rtb-0b77d34b011e7125a" -> (known after apply)
      ~ owner_id                         = "165765640813" -> (known after apply)
        tags                             = {
            "Name" = "devopsacademy_iac"
        }
    }

Plan: 12 to add, 1 to change, 12 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
````
<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/205c822cbdcd0fd791608eed129941bbee16ce5f/classes/04class/exercises/c04-iac03/README.md)