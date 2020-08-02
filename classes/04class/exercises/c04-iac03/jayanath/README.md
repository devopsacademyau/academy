# C04-IAC03

## Terraform plan output

```
➜  jayanath git:(jayanath/c04-iac02) ✗ tplan -var-file=main.tfvars

Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

aws_vpc.doa_iac_vpc: Refreshing state... [id=vpc-02052cbe96bb71f3c]
aws_eip.iac_nat_eip: Refreshing state... [id=eipalloc-0ce0d591b89ec32ba]
aws_subnet.public_a: Refreshing state... [id=subnet-0b047c0a6e32f8792]
aws_subnet.private_b: Refreshing state... [id=subnet-06616ddbc726ce604]
aws_internet_gateway.iac_vpc_gw: Refreshing state... [id=igw-0ac04ca745149140a]
aws_subnet.public_b: Refreshing state... [id=subnet-0d100205f4b69f6a8]
aws_subnet.private_a: Refreshing state... [id=subnet-0f47ba493775fda3d]
aws_network_acl.main: Refreshing state... [id=acl-001ec761a421d2a44]
aws_route_table.iac_vpc_public_rt: Refreshing state... [id=rtb-067e14f64e1f5c208]
aws_nat_gateway.iac_vpc_nat_gw: Refreshing state... [id=nat-022f150fc73d9a2dd]
aws_route_table_association.public_b: Refreshing state... [id=rtbassoc-06ec39b564d12ef15]
aws_route_table_association.public_a: Refreshing state... [id=rtbassoc-0f9f3974ced1cdba0]
aws_route_table.iac_vpc_private_rt: Refreshing state... [id=rtb-07de2762abca6fa8f]
aws_route_table_association.private_a: Refreshing state... [id=rtbassoc-070777eeb5a3be855]
aws_route_table_association.private_b: Refreshing state... [id=rtbassoc-04d5841c6365c9b45]

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_internet_gateway.iac_vpc_gw will be updated in-place
  ~ resource "aws_internet_gateway" "iac_vpc_gw" {
        arn      = "arn:aws:ec2:ap-southeast-2:907095435092:internet-gateway/igw-0ac04ca745149140a"
        id       = "igw-0ac04ca745149140a"
        owner_id = "907095435092"
        tags     = {
            "Name" = "iac-vpc-igw"
        }
      ~ vpc_id   = "vpc-02052cbe96bb71f3c" -> (known after apply)
    }

  # aws_nat_gateway.iac_vpc_nat_gw must be replaced
-/+ resource "aws_nat_gateway" "iac_vpc_nat_gw" {
        allocation_id        = "eipalloc-0ce0d591b89ec32ba"
      ~ id                   = "nat-022f150fc73d9a2dd" -> (known after apply)
      ~ network_interface_id = "eni-00c51528e63e8f57a" -> (known after apply)
      ~ private_ip           = "10.0.0.226" -> (known after apply)
      ~ public_ip            = "54.79.195.160" -> (known after apply)
      ~ subnet_id            = "subnet-0f47ba493775fda3d" -> (known after apply) # forces replacement
        tags                 = {
            "Name" = "iac-vpc-nat-gw"
        }
    }

  # aws_network_acl.main must be replaced
-/+ resource "aws_network_acl" "main" {
      ~ arn        = "arn:aws:ec2:ap-southeast-2:907095435092:network-acl/acl-001ec761a421d2a44" -> (known after apply)
      ~ egress     = [
          - {
              - action          = "allow"
              - cidr_block      = "10.0.0.0/16"
              - from_port       = 0
              - icmp_code       = 0
              - icmp_type       = 0
              - ipv6_cidr_block = ""
              - protocol        = "-1"
              - rule_no         = 100
              - to_port         = 0
            },
          + {
              + action          = "allow"
              + cidr_block      = "10.0.0.0/16"
              + from_port       = 0
              + icmp_code       = null
              + icmp_type       = null
              + ipv6_cidr_block = ""
              + protocol        = "all"
              + rule_no         = 100
              + to_port         = 0
            },
          - {
              - action          = "allow"
              - cidr_block      = "121.200.5.90/32"
              - from_port       = 0
              - icmp_code       = 0
              - icmp_type       = 0
              - ipv6_cidr_block = ""
              - protocol        = "-1"
              - rule_no         = 200
              - to_port         = 0
            },
          + {
              + action          = "allow"
              + cidr_block      = "121.200.5.90/32"
              + from_port       = 0
              + icmp_code       = null
              + icmp_type       = null
              + ipv6_cidr_block = ""
              + protocol        = "all"
              + rule_no         = 200
              + to_port         = 0
            },
        ]
      ~ id         = "acl-001ec761a421d2a44" -> (known after apply)
      ~ ingress    = [
          - {
              - action          = "allow"
              - cidr_block      = "10.0.0.0/16"
              - from_port       = 0
              - icmp_code       = 0
              - icmp_type       = 0
              - ipv6_cidr_block = ""
              - protocol        = "-1"
              - rule_no         = 300
              - to_port         = 0
            },
          + {
              + action          = "allow"
              + cidr_block      = "10.0.0.0/16"
              + from_port       = 0
              + icmp_code       = null
              + icmp_type       = null
              + ipv6_cidr_block = ""
              + protocol        = "all"
              + rule_no         = 300
              + to_port         = 0
            },
          - {
              - action          = "allow"
              - cidr_block      = "121.200.5.90/32"
              - from_port       = 0
              - icmp_code       = 0
              - icmp_type       = 0
              - ipv6_cidr_block = ""
              - protocol        = "-1"
              - rule_no         = 400
              - to_port         = 0
            },
          + {
              + action          = "allow"
              + cidr_block      = "121.200.5.90/32"
              + from_port       = 0
              + icmp_code       = null
              + icmp_type       = null
              + ipv6_cidr_block = ""
              + protocol        = "all"
              + rule_no         = 400
              + to_port         = 0
            },
        ]
      ~ owner_id   = "907095435092" -> (known after apply)
      ~ subnet_ids = [] -> (known after apply)
        tags       = {
            "Name" = "iac-vpc-nacl"
        }
      ~ vpc_id     = "vpc-02052cbe96bb71f3c" -> (known after apply) # forces replacement
    }

  # aws_route_table.iac_vpc_private_rt must be replaced
-/+ resource "aws_route_table" "iac_vpc_private_rt" {
      ~ id               = "rtb-07de2762abca6fa8f" -> (known after apply)
      ~ owner_id         = "907095435092" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      ~ route            = [
          - {
              - cidr_block                = "0.0.0.0/0"
              - egress_only_gateway_id    = ""
              - gateway_id                = ""
              - instance_id               = ""
              - ipv6_cidr_block           = ""
              - nat_gateway_id            = "nat-022f150fc73d9a2dd"
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
            "Name" = "iac-vpc-private-rt"
        }
      ~ vpc_id           = "vpc-02052cbe96bb71f3c" -> (known after apply) # forces replacement
    }

  # aws_route_table.iac_vpc_public_rt must be replaced
-/+ resource "aws_route_table" "iac_vpc_public_rt" {
      ~ id               = "rtb-067e14f64e1f5c208" -> (known after apply)
      ~ owner_id         = "907095435092" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
        route            = [
            {
                cidr_block                = "0.0.0.0/0"
                egress_only_gateway_id    = ""
                gateway_id                = "igw-0ac04ca745149140a"
                instance_id               = ""
                ipv6_cidr_block           = ""
                nat_gateway_id            = ""
                network_interface_id      = ""
                transit_gateway_id        = ""
                vpc_peering_connection_id = ""
            },
        ]
        tags             = {
            "Name" = "iac-vpc-public-rt"
        }
      ~ vpc_id           = "vpc-02052cbe96bb71f3c" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private_a must be replaced
-/+ resource "aws_route_table_association" "private_a" {
      ~ id             = "rtbassoc-070777eeb5a3be855" -> (known after apply)
      ~ route_table_id = "rtb-07de2762abca6fa8f" -> (known after apply)
      ~ subnet_id      = "subnet-0f47ba493775fda3d" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private_b must be replaced
-/+ resource "aws_route_table_association" "private_b" {
      ~ id             = "rtbassoc-04d5841c6365c9b45" -> (known after apply)
      ~ route_table_id = "rtb-07de2762abca6fa8f" -> (known after apply)
      ~ subnet_id      = "subnet-06616ddbc726ce604" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public_a must be replaced
-/+ resource "aws_route_table_association" "public_a" {
      ~ id             = "rtbassoc-0f9f3974ced1cdba0" -> (known after apply)
      ~ route_table_id = "rtb-067e14f64e1f5c208" -> (known after apply)
      ~ subnet_id      = "subnet-0b047c0a6e32f8792" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public_b must be replaced
-/+ resource "aws_route_table_association" "public_b" {
      ~ id             = "rtbassoc-06ec39b564d12ef15" -> (known after apply)
      ~ route_table_id = "rtb-067e14f64e1f5c208" -> (known after apply)
      ~ subnet_id      = "subnet-0d100205f4b69f6a8" -> (known after apply) # forces replacement
    }

  # aws_subnet.private_a must be replaced
-/+ resource "aws_subnet" "private_a" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:907095435092:subnet/subnet-0f47ba493775fda3d" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
      ~ cidr_block                      = "10.0.0.0/24" -> "10.0.7.0/24" # forces replacement
      ~ id                              = "subnet-0f47ba493775fda3d" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "907095435092" -> (known after apply)
        tags                            = {
            "Name" = "doa-iac-private-a"
        }
      ~ vpc_id                          = "vpc-02052cbe96bb71f3c" -> (known after apply) # forces replacement
    }

  # aws_subnet.private_b must be replaced
-/+ resource "aws_subnet" "private_b" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:907095435092:subnet/subnet-06616ddbc726ce604" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2b"
      ~ availability_zone_id            = "apse2-az3" -> (known after apply)
        cidr_block                      = "10.0.1.0/24"
      ~ id                              = "subnet-06616ddbc726ce604" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "907095435092" -> (known after apply)
        tags                            = {
            "Name" = "doa-iac-private-b"
        }
      ~ vpc_id                          = "vpc-02052cbe96bb71f3c" -> (known after apply) # forces replacement
    }

  # aws_subnet.public_a must be replaced
-/+ resource "aws_subnet" "public_a" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:907095435092:subnet/subnet-0b047c0a6e32f8792" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
        cidr_block                      = "10.0.2.0/24"
      ~ id                              = "subnet-0b047c0a6e32f8792" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "907095435092" -> (known after apply)
      ~ tags                            = {
          ~ "Name" = "doa-iac-public-a" -> "doa-iac-public-a-updated"
        }
      ~ vpc_id                          = "vpc-02052cbe96bb71f3c" -> (known after apply) # forces replacement
    }

  # aws_subnet.public_b must be replaced
-/+ resource "aws_subnet" "public_b" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:907095435092:subnet/subnet-0d100205f4b69f6a8" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2b"
      ~ availability_zone_id            = "apse2-az3" -> (known after apply)
        cidr_block                      = "10.0.3.0/24"
      ~ id                              = "subnet-0d100205f4b69f6a8" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "907095435092" -> (known after apply)
        tags                            = {
            "Name" = "doa-iac-public-b"
        }
      ~ vpc_id                          = "vpc-02052cbe96bb71f3c" -> (known after apply) # forces replacement
    }

  # aws_vpc.doa_iac_vpc must be replaced
-/+ resource "aws_vpc" "doa_iac_vpc" {
      ~ arn                              = "arn:aws:ec2:ap-southeast-2:907095435092:vpc/vpc-02052cbe96bb71f3c" -> (known after apply)
        assign_generated_ipv6_cidr_block = false
      ~ cidr_block                       = "10.0.0.0/16" -> "10.0.0.0/18" # forces replacement
      ~ default_network_acl_id           = "acl-0c4669e869a7fa209" -> (known after apply)
      ~ default_route_table_id           = "rtb-091c595346453c840" -> (known after apply)
      ~ default_security_group_id        = "sg-06699e53889658ab6" -> (known after apply)
      ~ dhcp_options_id                  = "dopt-3d63485a" -> (known after apply)
      ~ enable_classiclink               = false -> (known after apply)
      ~ enable_classiclink_dns_support   = false -> (known after apply)
      ~ enable_dns_hostnames             = false -> (known after apply)
        enable_dns_support               = true
      ~ id                               = "vpc-02052cbe96bb71f3c" -> (known after apply)
        instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      ~ main_route_table_id              = "rtb-091c595346453c840" -> (known after apply)
      ~ owner_id                         = "907095435092" -> (known after apply)
        tags                             = {
            "Name" = "devopsacademy-iac"
        }
    }

Plan: 13 to add, 1 to change, 13 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.

```

***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/205c822cbdcd0fd791608eed129941bbee16ce5f/classes/04class/exercises/c04-iac03/README.md)