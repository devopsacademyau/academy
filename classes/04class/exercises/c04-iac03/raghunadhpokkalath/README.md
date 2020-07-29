# C04-IAC03

## Terraform plan output
````
> terraform plan -var-file="main.tfvars"


Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

aws_eip.this: Refreshing state... [id=eipalloc-0aefad74c98e409cb]
aws_vpc.this: Refreshing state... [id=vpc-0538128f8a28236d2]
aws_internet_gateway.this: Refreshing state... [id=igw-01cf6f8c1167c021b]
aws_subnet.public_b: Refreshing state... [id=subnet-0e4ac3becd6429622]
aws_subnet.public_a: Refreshing state... [id=subnet-05131708f9d79298d]
aws_subnet.private_b: Refreshing state... [id=subnet-0ae69374b3fe55950]
aws_subnet.private_a: Refreshing state... [id=subnet-04a414fc0033bf5e2]
aws_route_table.public: Refreshing state... [id=rtb-0d01d3bb8809df040]
aws_nat_gateway.this: Refreshing state... [id=nat-02d858ced2a69bc6d]
aws_route_table_association.public_b: Refreshing state... [id=rtbassoc-0b887d5fde12584e5]
aws_route_table_association.public_a: Refreshing state... [id=rtbassoc-0eef77d55b13a7e91]
aws_route_table.private: Refreshing state... [id=rtb-090be15605ada09b6]
aws_route_table_association.private_b: Refreshing state... [id=rtbassoc-09da4d635ca0433f3]
aws_route_table_association.private_a: Refreshing state... [id=rtbassoc-0c70ad1751522334f]

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_internet_gateway.this will be updated in-place
  ~ resource "aws_internet_gateway" "this" {
        arn      = "arn:aws:ec2:ap-southeast-2:361529347535:internet-gateway/igw-01cf6f8c1167c021b"
        id       = "igw-01cf6f8c1167c021b"
        owner_id = "361529347535"
        tags     = {
            "Name" = "devopsacademy-iac-igw"
        }
      ~ vpc_id   = "vpc-0538128f8a28236d2" -> (known after apply)
    }

  # aws_nat_gateway.this must be replaced
-/+ resource "aws_nat_gateway" "this" {
        allocation_id        = "eipalloc-0aefad74c98e409cb"
      ~ id                   = "nat-02d858ced2a69bc6d" -> (known after apply)
      ~ network_interface_id = "eni-03bf5bc9ba3033f60" -> (known after apply)
      ~ private_ip           = "10.0.101.164" -> (known after apply)
      ~ public_ip            = "3.104.92.133" -> (known after apply)
      ~ subnet_id            = "subnet-05131708f9d79298d" -> (known after apply) # forces replacement
        tags                 = {
            "Name" = "devopsacademy-iac-nat"
        }
    }

  # aws_route_table.private must be replaced
-/+ resource "aws_route_table" "private" {
      ~ id               = "rtb-090be15605ada09b6" -> (known after apply)
      ~ owner_id         = "361529347535" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      ~ route            = [
          - {
              - cidr_block                = "0.0.0.0/0"
              - egress_only_gateway_id    = ""
              - gateway_id                = ""
              - instance_id               = ""
              - ipv6_cidr_block           = ""
              - nat_gateway_id            = "nat-02d858ced2a69bc6d"
              - network_interface_id      = ""
              - transit_gateway_id        = ""
              - vpc_peering_connection_id = ""
            },
            {
                cidr_block                = "0.0.0.0/0"
                egress_only_gateway_id    = ""
                gateway_id                = (known after apply)
                instance_id               = ""
                ipv6_cidr_block           = ""
                nat_gateway_id            = ""
                network_interface_id      = ""
                transit_gateway_id        = ""
                vpc_peering_connection_id = ""
            },
        ]
        tags             = {
            "Name" = "devopsacademy-iac-rt-private"
        }
      ~ vpc_id           = "vpc-0538128f8a28236d2" -> (known after apply) # forces replacement
    }

  # aws_route_table.public must be replaced
-/+ resource "aws_route_table" "public" {
      ~ id               = "rtb-0d01d3bb8809df040" -> (known after apply)
      ~ owner_id         = "361529347535" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
        route            = [
            {
                cidr_block                = "0.0.0.0/0"
                egress_only_gateway_id    = ""
                gateway_id                = "igw-01cf6f8c1167c021b"
                instance_id               = ""
                ipv6_cidr_block           = ""
                nat_gateway_id            = ""
                network_interface_id      = ""
                transit_gateway_id        = ""
                vpc_peering_connection_id = ""
            },
        ]
        tags             = {
            "Name" = "devopsacademy-iac-rt-public"
        }
      ~ vpc_id           = "vpc-0538128f8a28236d2" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private_a must be replaced
-/+ resource "aws_route_table_association" "private_a" {
      ~ id             = "rtbassoc-0c70ad1751522334f" -> (known after apply)
      ~ route_table_id = "rtb-090be15605ada09b6" -> (known after apply)
      ~ subnet_id      = "subnet-04a414fc0033bf5e2" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private_b must be replaced
-/+ resource "aws_route_table_association" "private_b" {
      ~ id             = "rtbassoc-09da4d635ca0433f3" -> (known after apply)
      ~ route_table_id = "rtb-090be15605ada09b6" -> (known after apply)
      ~ subnet_id      = "subnet-0ae69374b3fe55950" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public_a must be replaced
-/+ resource "aws_route_table_association" "public_a" {
      ~ id             = "rtbassoc-0eef77d55b13a7e91" -> (known after apply)
      ~ route_table_id = "rtb-0d01d3bb8809df040" -> (known after apply)
      ~ subnet_id      = "subnet-05131708f9d79298d" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public_b must be replaced
-/+ resource "aws_route_table_association" "public_b" {
      ~ id             = "rtbassoc-0b887d5fde12584e5" -> (known after apply)
      ~ route_table_id = "rtb-0d01d3bb8809df040" -> (known after apply)
      ~ subnet_id      = "subnet-0e4ac3becd6429622" -> (known after apply) # forces replacement
    }

  # aws_subnet.private_a must be replaced
-/+ resource "aws_subnet" "private_a" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:361529347535:subnet/subnet-04a414fc0033bf5e2" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
        cidr_block                      = "10.0.1.0/24"
      ~ id                              = "subnet-04a414fc0033bf5e2" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "361529347535" -> (known after apply)
        tags                            = {
            "Name" = "devopsacademy-iac-private-subnet-a"
        }
      ~ vpc_id                          = "vpc-0538128f8a28236d2" -> (known after apply) # forces replacement
    }

  # aws_subnet.private_b must be replaced
-/+ resource "aws_subnet" "private_b" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:361529347535:subnet/subnet-0ae69374b3fe55950" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2c"
      ~ availability_zone_id            = "apse2-az2" -> (known after apply)
        cidr_block                      = "10.0.2.0/24"
      ~ id                              = "subnet-0ae69374b3fe55950" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "361529347535" -> (known after apply)
        tags                            = {
            "Name" = "devopsacademy-iac-private-subnet-b"
        }
      ~ vpc_id                          = "vpc-0538128f8a28236d2" -> (known after apply) # forces replacement
    }

  # aws_subnet.public_a must be replaced
-/+ resource "aws_subnet" "public_a" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:361529347535:subnet/subnet-05131708f9d79298d" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
      ~ cidr_block                      = "10.0.101.0/24" -> "10.0.301.0/24" # forces replacement
      ~ id                              = "subnet-05131708f9d79298d" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "361529347535" -> (known after apply)
        tags                            = {
            "Name" = "devopsacademy-iac-public-subnet-a"
        }
      ~ vpc_id                          = "vpc-0538128f8a28236d2" -> (known after apply) # forces replacement
    }

  # aws_subnet.public_b must be replaced
-/+ resource "aws_subnet" "public_b" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:361529347535:subnet/subnet-0e4ac3becd6429622" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2c"
      ~ availability_zone_id            = "apse2-az2" -> (known after apply)
        cidr_block                      = "10.0.201.0/24"
      ~ id                              = "subnet-0e4ac3becd6429622" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "361529347535" -> (known after apply)
      ~ tags                            = {
          ~ "Name" = "devopsacademy-iac-public-subnet-b" -> "devopsacademy-iac-public-subnet-b-upd"
        }
      ~ vpc_id                          = "vpc-0538128f8a28236d2" -> (known after apply) # forces replacement
    }

  # aws_vpc.this must be replaced
-/+ resource "aws_vpc" "this" {
      ~ arn                              = "arn:aws:ec2:ap-southeast-2:361529347535:vpc/vpc-0538128f8a28236d2" -> (known after apply)
        assign_generated_ipv6_cidr_block = false
      ~ cidr_block                       = "10.0.0.0/16" -> "10.0.0.0/18" # forces replacement
      ~ default_network_acl_id           = "acl-0fff980dd12a0e446" -> (known after apply)
      ~ default_route_table_id           = "rtb-0ca91fe6fc3c224f5" -> (known after apply)
      ~ default_security_group_id        = "sg-0d09b5a21dbd07b13" -> (known after apply)
      ~ dhcp_options_id                  = "dopt-f585d092" -> (known after apply)
      ~ enable_classiclink               = false -> (known after apply)
      ~ enable_classiclink_dns_support   = false -> (known after apply)
      ~ enable_dns_hostnames             = false -> (known after apply)
        enable_dns_support               = true
      ~ id                               = "vpc-0538128f8a28236d2" -> (known after apply)
        instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      ~ main_route_table_id              = "rtb-0ca91fe6fc3c224f5" -> (known after apply)
      ~ owner_id                         = "361529347535" -> (known after apply)
        tags                             = {
            "Name" = "devopsacademy-iac-vpc"
        }
    }

Plan: 12 to add, 1 to change, 12 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.

````


***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/205c822cbdcd0fd791608eed129941bbee16ce5f/classes/04class/exercises/c04-iac03/README.md)