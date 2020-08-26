# C04-IAC03

- Why changing the VPC CIDR led to replacing multiple resources?

Changing a VPC's CIDR on-the-fly is not possible in AWS.
Therefore, the entire VPC has be deleted then recreated,
including the resources within.

## Terraform plan output

```sh
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

aws_eip.ngw_eip: Refreshing state... [id=eipalloc-0e1d914fb545dc6e6]
aws_vpc.main: Refreshing state... [id=vpc-027d0d08150a6ebec]
aws_subnet.pvt2: Refreshing state... [id=subnet-0a2d9f09e63b127f1]
aws_internet_gateway.igw: Refreshing state... [id=igw-02de0e54c5e566811]
aws_subnet.pub1: Refreshing state... [id=subnet-01cd4ae2348997fbd]
aws_subnet.pub2: Refreshing state... [id=subnet-040d45e8a1fe7608c]
aws_subnet.pvt1: Refreshing state... [id=subnet-06e7583433df5ddce]
aws_nat_gateway.ngw: Refreshing state... [id=nat-0923bb6c03d25ea43]
aws_route_table.pub_route: Refreshing state... [id=rtb-098da2a8f883a593c]
aws_route_table_association.pub2: Refreshing state... [id=rtbassoc-0d6a6e7ed902e806b]
aws_route_table_association.pub1: Refreshing state... [id=rtbassoc-0647cbcbeaebb64ef]
aws_route_table.pvt_route: Refreshing state... [id=rtb-076dc08513eb7f429]
aws_route_table_association.pvt1: Refreshing state... [id=rtbassoc-0f695fda992cae737]
aws_route_table_association.pvt2: Refreshing state... [id=rtbassoc-00d8e80c8ac4a7647]

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_internet_gateway.igw will be updated in-place
  ~ resource "aws_internet_gateway" "igw" {
        arn      = "arn:aws:ec2:ap-southeast-2:437637330966:internet-gateway/igw-02de0e54c5e566811"
        id       = "igw-02de0e54c5e566811"
        owner_id = "437637330966"
        tags     = {
            "Name" = "igw-c04-iac02"
        }
      ~ vpc_id   = "vpc-027d0d08150a6ebec" -> (known after apply)
    }

  # aws_nat_gateway.ngw must be replaced
-/+ resource "aws_nat_gateway" "ngw" {
        allocation_id        = "eipalloc-0e1d914fb545dc6e6"
      ~ id                   = "nat-0923bb6c03d25ea43" -> (known after apply)
      ~ network_interface_id = "eni-0b9d8730fa82dc9e2" -> (known after apply)
      ~ private_ip           = "10.1.1.104" -> (known after apply)
      ~ public_ip            = "52.63.217.223" -> (known after apply)
      ~ subnet_id            = "subnet-06e7583433df5ddce" -> (known after apply) # forces replacement
        tags                 = {
            "Name" = "ngw-c04-iac02"
        }
    }

  # aws_route_table.pub_route must be replaced
-/+ resource "aws_route_table" "pub_route" {
      ~ id               = "rtb-098da2a8f883a593c" -> (known after apply)
      ~ owner_id         = "437637330966" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
        route            = [
            {
                cidr_block                = "0.0.0.0/0"
                egress_only_gateway_id    = ""
                gateway_id                = "igw-02de0e54c5e566811"
                instance_id               = ""
                ipv6_cidr_block           = ""
                nat_gateway_id            = ""
                network_interface_id      = ""
                transit_gateway_id        = ""
                vpc_peering_connection_id = ""
            },
        ]
      - tags             = {} -> null
      ~ vpc_id           = "vpc-027d0d08150a6ebec" -> (known after apply) # forces replacement
    }

  # aws_route_table.pvt_route must be replaced
-/+ resource "aws_route_table" "pvt_route" {
      ~ id               = "rtb-076dc08513eb7f429" -> (known after apply)
      ~ owner_id         = "437637330966" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      ~ route            = [
          - {
              - cidr_block                = "0.0.0.0/0"
              - egress_only_gateway_id    = ""
              - gateway_id                = ""
              - instance_id               = ""
              - ipv6_cidr_block           = ""
              - nat_gateway_id            = "nat-0923bb6c03d25ea43"
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
      - tags             = {} -> null
      ~ vpc_id           = "vpc-027d0d08150a6ebec" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.pub1 must be replaced
-/+ resource "aws_route_table_association" "pub1" {
      ~ id             = "rtbassoc-0647cbcbeaebb64ef" -> (known after apply)
      ~ route_table_id = "rtb-098da2a8f883a593c" -> (known after apply)
      ~ subnet_id      = "subnet-01cd4ae2348997fbd" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.pub2 must be replaced
-/+ resource "aws_route_table_association" "pub2" {
      ~ id             = "rtbassoc-0d6a6e7ed902e806b" -> (known after apply)
      ~ route_table_id = "rtb-098da2a8f883a593c" -> (known after apply)
      ~ subnet_id      = "subnet-040d45e8a1fe7608c" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.pvt1 must be replaced
-/+ resource "aws_route_table_association" "pvt1" {
      ~ id             = "rtbassoc-0f695fda992cae737" -> (known after apply)
      ~ route_table_id = "rtb-076dc08513eb7f429" -> (known after apply)
      ~ subnet_id      = "subnet-06e7583433df5ddce" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.pvt2 must be replaced
-/+ resource "aws_route_table_association" "pvt2" {
      ~ id             = "rtbassoc-00d8e80c8ac4a7647" -> (known after apply)
      ~ route_table_id = "rtb-076dc08513eb7f429" -> (known after apply)
      ~ subnet_id      = "subnet-0a2d9f09e63b127f1" -> (known after apply) # forces replacement
    }

  # aws_subnet.pub1 must be replaced
-/+ resource "aws_subnet" "pub1" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:437637330966:subnet/subnet-01cd4ae2348997fbd" -> (known after apply)
        assign_ipv6_address_on_creation = false
      ~ availability_zone               = "ap-southeast-2c" -> (known after apply)
      ~ availability_zone_id            = "apse2-az2" -> (known after apply)
        cidr_block                      = "10.1.3.0/24"
      ~ id                              = "subnet-01cd4ae2348997fbd" -> (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "437637330966" -> (known after apply)
        tags                            = {
            "Name" = "public subnet 1"
        }
      ~ vpc_id                          = "vpc-027d0d08150a6ebec" -> (known after apply) # forces replacement
    }

  # aws_subnet.pub2 must be replaced
-/+ resource "aws_subnet" "pub2" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:437637330966:subnet/subnet-040d45e8a1fe7608c" -> (known after apply)
        assign_ipv6_address_on_creation = false
      ~ availability_zone               = "ap-southeast-2b" -> (known after apply)
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
        cidr_block                      = "10.1.4.0/24"
      ~ id                              = "subnet-040d45e8a1fe7608c" -> (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "437637330966" -> (known after apply)
        tags                            = {
            "Name" = "public subnet 2"
        }
      ~ vpc_id                          = "vpc-027d0d08150a6ebec" -> (known after apply) # forces replacement
    }

  # aws_subnet.pvt1 must be replaced
-/+ resource "aws_subnet" "pvt1" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:437637330966:subnet/subnet-06e7583433df5ddce" -> (known after apply)
        assign_ipv6_address_on_creation = false
      ~ availability_zone               = "ap-southeast-2c" -> (known after apply)
      ~ availability_zone_id            = "apse2-az2" -> (known after apply)
      ~ cidr_block                      = "10.1.1.0/24" -> "10.1.5.0/24" # forces replacement
      ~ id                              = "subnet-06e7583433df5ddce" -> (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "437637330966" -> (known after apply)
        tags                            = {
            "Name" = "private subnet 1"
        }
      ~ vpc_id                          = "vpc-027d0d08150a6ebec" -> (known after apply) # forces replacement
    }

  # aws_subnet.pvt2 must be replaced
-/+ resource "aws_subnet" "pvt2" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:437637330966:subnet/subnet-0a2d9f09e63b127f1" -> (known after apply)
        assign_ipv6_address_on_creation = false
      ~ availability_zone               = "ap-southeast-2b" -> (known after apply)
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
        cidr_block                      = "10.1.2.0/24"
      ~ id                              = "subnet-0a2d9f09e63b127f1" -> (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "437637330966" -> (known after apply)
      ~ tags                            = {
          ~ "Name" = "private subnet 2" -> "private subnet 2 changed"
        }
      ~ vpc_id                          = "vpc-027d0d08150a6ebec" -> (known after apply) # forces replacement
    }

  # aws_vpc.main must be replaced
-/+ resource "aws_vpc" "main" {
      ~ arn                              = "arn:aws:ec2:ap-southeast-2:437637330966:vpc/vpc-027d0d08150a6ebec" -> (known after apply)
        assign_generated_ipv6_cidr_block = false
      ~ cidr_block                       = "10.1.0.0/16" -> "10.0.0.0/16" # forces replacement
      ~ default_network_acl_id           = "acl-05888d242e00de77b" -> (known after apply)
      ~ default_route_table_id           = "rtb-09d57d3eea8c11885" -> (known after apply)
      ~ default_security_group_id        = "sg-0e18e880246aa5534" -> (known after apply)
      ~ dhcp_options_id                  = "dopt-49257e2e" -> (known after apply)
      ~ enable_classiclink               = false -> (known after apply)
      ~ enable_classiclink_dns_support   = false -> (known after apply)
      ~ enable_dns_hostnames             = false -> (known after apply)
        enable_dns_support               = true
      ~ id                               = "vpc-027d0d08150a6ebec" -> (known after apply)
        instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      ~ main_route_table_id              = "rtb-09d57d3eea8c11885" -> (known after apply)
      ~ owner_id                         = "437637330966" -> (known after apply)
        tags                             = {
            "Name" = "vpc-c04-iac02"
        }
    }

Plan: 12 to add, 1 to change, 12 to destroy.

------------------------------------------------------------------------

This plan was saved to: c04-iac02.tfplan

To perform exactly these actions, run the following command to apply:
    terraform apply "c04-iac02.tfplan"
```

***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/7c4bce633a38e1c65066fdb6544df45cd1dc06ee/classes/04class/exercises/c04-iac03/README.md)
