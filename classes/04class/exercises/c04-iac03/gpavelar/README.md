# C04-IAC03

## Terraform plan output

```bash
terraform plan -var-file="main.tfvars"
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

aws_eip.eip_nat: Refreshing state... [id=eipalloc-0ff1c0ddce856eecb]
aws_vpc.devopsacademy-iac: Refreshing state... [id=vpc-058a9495b9e9c878f]
aws_route_table.devopsacademy-iac-rt: Refreshing state... [id=rtb-0b5bb3fd5554ff0e5]
aws_internet_gateway.c04-iac-igw: Refreshing state... [id=igw-0e4764d6277c10a95]
aws_subnet.private_subnet[0]: Refreshing state... [id=subnet-0fb432e22a5fcda87]
aws_subnet.private_subnet[1]: Refreshing state... [id=subnet-04d95593b4b61f865]
aws_subnet.public_subnet[1]: Refreshing state... [id=subnet-03aed552f6d65ed5d]
aws_subnet.public_subnet[0]: Refreshing state... [id=subnet-07d1f7f41af625a1e]
aws_route_table_association.public[1]: Refreshing state... [id=rtbassoc-0a1bbd0e8908fb243]
aws_route_table_association.public[0]: Refreshing state... [id=rtbassoc-0341b5a79cf26e55d]
aws_nat_gateway.nat_1[0]: Refreshing state... [id=nat-0285d9b7781c989bf]

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  ~ update in-place
-/+ destroy and then create replacement
 <= read (data resources)

Terraform will perform the following actions:

  # data.aws_subnet.subnets[0] will be read during apply
  # (config refers to values not yet known)
 <= data "aws_subnet" "subnets"  {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = (known after apply)
      + availability_zone               = (known after apply)
      + availability_zone_id            = (known after apply)
      + cidr_block                      = (known after apply)
      + default_for_az                  = (known after apply)
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = (known after apply)
      + outpost_arn                     = (known after apply)
      + owner_id                        = (known after apply)
      + state                           = (known after apply)
      + tags                            = (known after apply)
      + vpc_id                          = (known after apply)
    }

  # data.aws_subnet.subnets[1] will be read during apply
  # (config refers to values not yet known)
 <= data "aws_subnet" "subnets"  {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = (known after apply)
      + availability_zone               = (known after apply)
      + availability_zone_id            = (known after apply)
      + cidr_block                      = (known after apply)
      + default_for_az                  = (known after apply)
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = (known after apply)
      + outpost_arn                     = (known after apply)
      + owner_id                        = (known after apply)
      + state                           = (known after apply)
      + tags                            = (known after apply)
      + vpc_id                          = (known after apply)
    }

  # data.aws_subnet.subnets[2] will be read during apply
  # (config refers to values not yet known)
 <= data "aws_subnet" "subnets"  {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = (known after apply)
      + availability_zone               = (known after apply)
      + availability_zone_id            = (known after apply)
      + cidr_block                      = (known after apply)
      + default_for_az                  = (known after apply)
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = (known after apply)
      + outpost_arn                     = (known after apply)
      + owner_id                        = (known after apply)
      + state                           = (known after apply)
      + tags                            = (known after apply)
      + vpc_id                          = (known after apply)
    }

  # data.aws_subnet.subnets[3] will be read during apply
  # (config refers to values not yet known)
 <= data "aws_subnet" "subnets"  {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = (known after apply)
      + availability_zone               = (known after apply)
      + availability_zone_id            = (known after apply)
      + cidr_block                      = (known after apply)
      + default_for_az                  = (known after apply)
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = (known after apply)
      + outpost_arn                     = (known after apply)
      + owner_id                        = (known after apply)
      + state                           = (known after apply)
      + tags                            = (known after apply)
      + vpc_id                          = (known after apply)
    }

  # data.aws_subnet_ids.all_subnets will be read during apply
  # (config refers to values not yet known)
 <= data "aws_subnet_ids" "all_subnets"  {
      + id     = (known after apply)
      + ids    = (known after apply)
      + tags   = (known after apply)
      + vpc_id = (known after apply)
    }

  # aws_internet_gateway.c04-iac-igw will be updated in-place
  ~ resource "aws_internet_gateway" "c04-iac-igw" {
        arn      = "arn:aws:ec2:ap-southeast-2:478433196210:internet-gateway/igw-0e4764d6277c10a95"
        id       = "igw-0e4764d6277c10a95"
        owner_id = "478433196210"
        tags     = {
            "Name" = "c04-iac-igw"
        }
      ~ vpc_id   = "vpc-058a9495b9e9c878f" -> (known after apply)
    }

  # aws_nat_gateway.nat_1[0] must be replaced
-/+ resource "aws_nat_gateway" "nat_1" {
        allocation_id        = "eipalloc-0ff1c0ddce856eecb"
      ~ id                   = "nat-0285d9b7781c989bf" -> (known after apply)
      ~ network_interface_id = "eni-0e9c015e6c4a9e793" -> (known after apply)
      ~ private_ip           = "10.0.3.160" -> (known after apply)
      ~ public_ip            = "54.206.199.234" -> (known after apply)
      ~ subnet_id            = "subnet-07d1f7f41af625a1e" -> (known after apply) # forces replacement
        tags                 = {
            "Name" = "c04-gw-NAT"
        }
    }

  # aws_route_table.devopsacademy-iac-rt must be replaced
-/+ resource "aws_route_table" "devopsacademy-iac-rt" {
      ~ id               = "rtb-0b5bb3fd5554ff0e5" -> (known after apply)
      ~ owner_id         = "478433196210" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      ~ route            = [] -> (known after apply)
        tags             = {
            "Name" = "DevOps IAC RT"
        }
      ~ vpc_id           = "vpc-058a9495b9e9c878f" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public[0] must be replaced
-/+ resource "aws_route_table_association" "public" {
      ~ id             = "rtbassoc-0341b5a79cf26e55d" -> (known after apply)
      ~ route_table_id = "rtb-0b5bb3fd5554ff0e5" -> (known after apply)
      ~ subnet_id      = "subnet-07d1f7f41af625a1e" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public[1] must be replaced
-/+ resource "aws_route_table_association" "public" {
      ~ id             = "rtbassoc-0a1bbd0e8908fb243" -> (known after apply)
      ~ route_table_id = "rtb-0b5bb3fd5554ff0e5" -> (known after apply)
      ~ subnet_id      = "subnet-03aed552f6d65ed5d" -> (known after apply) # forces replacement
    }

  # aws_subnet.private_subnet[0] must be replaced
-/+ resource "aws_subnet" "private_subnet" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:478433196210:subnet/subnet-0fb432e22a5fcda87" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az3" -> (known after apply)
        cidr_block                      = "10.0.1.0/24"
      ~ id                              = "subnet-0fb432e22a5fcda87" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "478433196210" -> (known after apply)
      ~ tags                            = {
          ~ "Name" = "Private Subnet 1" -> "Private sn 1"
        }
      ~ vpc_id                          = "vpc-058a9495b9e9c878f" -> (known after apply) # forces replacement
    }

  # aws_subnet.private_subnet[1] must be replaced
-/+ resource "aws_subnet" "private_subnet" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:478433196210:subnet/subnet-04d95593b4b61f865" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2b"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
        cidr_block                      = "10.0.2.0/24"
      ~ id                              = "subnet-04d95593b4b61f865" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "478433196210" -> (known after apply)
      ~ tags                            = {
          ~ "Name" = "Private Subnet 2" -> "Private sn 2"
        }
      ~ vpc_id                          = "vpc-058a9495b9e9c878f" -> (known after apply) # forces replacement
    }

  # aws_subnet.public_subnet[0] must be replaced
-/+ resource "aws_subnet" "public_subnet" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:478433196210:subnet/subnet-07d1f7f41af625a1e" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az3" -> (known after apply)
      ~ cidr_block                      = "10.0.3.0/24" -> "10.0.4.0/24" # forces replacement
      ~ id                              = "subnet-07d1f7f41af625a1e" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = true
      ~ owner_id                        = "478433196210" -> (known after apply)
        tags                            = {
            "Name" = "Public Subnet 3"
        }
      ~ vpc_id                          = "vpc-058a9495b9e9c878f" -> (known after apply) # forces replacement
    }

  # aws_subnet.public_subnet[1] must be replaced
-/+ resource "aws_subnet" "public_subnet" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:478433196210:subnet/subnet-03aed552f6d65ed5d" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2b"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
      ~ cidr_block                      = "10.0.4.0/24" -> "10.0.5.0/24" # forces replacement
      ~ id                              = "subnet-03aed552f6d65ed5d" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = true
      ~ owner_id                        = "478433196210" -> (known after apply)
        tags                            = {
            "Name" = "Public Subnet 4"
        }
      ~ vpc_id                          = "vpc-058a9495b9e9c878f" -> (known after apply) # forces replacement
    }

  # aws_vpc.devopsacademy-iac must be replaced
-/+ resource "aws_vpc" "devopsacademy-iac" {
      ~ arn                              = "arn:aws:ec2:ap-southeast-2:478433196210:vpc/vpc-058a9495b9e9c878f" -> (known after apply)
        assign_generated_ipv6_cidr_block = false
      ~ cidr_block                       = "10.0.0.0/16" -> "10.1.0.0/16" # forces replacement
      ~ default_network_acl_id           = "acl-09c54a0c86f372825" -> (known after apply)
      ~ default_route_table_id           = "rtb-0ee4e19a13a3e679c" -> (known after apply)
      ~ default_security_group_id        = "sg-0b08f5fb539aac99b" -> (known after apply)
      ~ dhcp_options_id                  = "dopt-9dc3e8fa" -> (known after apply)
      ~ enable_classiclink               = false -> (known after apply)
      ~ enable_classiclink_dns_support   = false -> (known after apply)
        enable_dns_hostnames             = true
        enable_dns_support               = true
      ~ id                               = "vpc-058a9495b9e9c878f" -> (known after apply)
        instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      ~ main_route_table_id              = "rtb-0ee4e19a13a3e679c" -> (known after apply)
      ~ owner_id                         = "478433196210" -> (known after apply)
        tags                             = {
            "Name" = "devopsacademy-iac"
        }
    }

Plan: 9 to add, 1 to change, 9 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

---

Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/205c822cbdcd0fd791608eed129941bbee16ce5f/classes/04class/exercises/c04-iac03/README.md)
