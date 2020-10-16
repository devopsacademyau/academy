# C04-IAC03

## Terraform plan output

```bash
terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

aws_eip.eip-nat: Refreshing state... [id=eipalloc-0e0d7161f1f552233]
aws_vpc.devopsacademy-iac: Refreshing state... [id=vpc-0560b6d4a11d01a60]
aws_internet_gateway.c04-iac-igw: Refreshing state... [id=igw-0976694fe6b185fc1]
aws_subnet.private-subnet[0]: Refreshing state... [id=subnet-01a8bbf3512056e33]
aws_subnet.public-subnet[0]: Refreshing state... [id=subnet-016265861f756d2e2]
aws_subnet.public-subnet[1]: Refreshing state... [id=subnet-090a2e7a5f7c5f53d]
aws_subnet.private-subnet[1]: Refreshing state... [id=subnet-01d3bdbb4ab996413]
aws_route_table.devopsacademy-iac-rt: Refreshing state... [id=rtb-0d2030a8e7427dee6]
aws_nat_gateway.nat-1[0]: Refreshing state... [id=nat-03ede095ad9185316]
aws_route_table_association.public[0]: Refreshing state... [id=rtbassoc-0c3fab0fd5519801d]
aws_route_table_association.public[1]: Refreshing state... [id=rtbassoc-003baa4f3f28feb91]
aws_route_table.devopsacademy-iac-rt-private[0]: Refreshing state... [id=rtb-0419d93e8356348a8]
aws_route_table_association.private[1]: Refreshing state... [id=rtbassoc-04a3b40f0b23503c0]
aws_route_table_association.private[0]: Refreshing state... [id=rtbassoc-09c85511b5903eb69]

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
        arn      = "arn:aws:ec2:ap-southeast-2:478433196210:internet-gateway/igw-0976694fe6b185fc1"
        id       = "igw-0976694fe6b185fc1"
        owner_id = "478433196210"
        tags     = {
            "Name" = "c04-iac-igw"
        }
      ~ vpc_id   = "vpc-0560b6d4a11d01a60" -> (known after apply)
    }

  # aws_nat_gateway.nat-1[0] must be replaced
-/+ resource "aws_nat_gateway" "nat-1" {
        allocation_id        = "eipalloc-0e0d7161f1f552233"
      ~ id                   = "nat-03ede095ad9185316" -> (known after apply)
      ~ network_interface_id = "eni-0a373a892f630f880" -> (known after apply)
      ~ private_ip           = "10.0.3.89" -> (known after apply)
      ~ public_ip            = "52.64.212.83" -> (known after apply)
      ~ subnet_id            = "subnet-016265861f756d2e2" -> (known after apply) # forces replacement
        tags                 = {
            "Name" = "c04-gw-NAT"
        }
    }

  # aws_route_table.devopsacademy-iac-rt must be replaced
-/+ resource "aws_route_table" "devopsacademy-iac-rt" {
      ~ id               = "rtb-0d2030a8e7427dee6" -> (known after apply)
      ~ owner_id         = "478433196210" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
        route            = [
            {
                cidr_block                = "0.0.0.0/0"
                egress_only_gateway_id    = ""
                gateway_id                = "igw-0976694fe6b185fc1"
                instance_id               = ""
                ipv6_cidr_block           = ""
                nat_gateway_id            = ""
                network_interface_id      = ""
                transit_gateway_id        = ""
                vpc_peering_connection_id = ""
            },
        ]
        tags             = {
            "Name" = "DevOpsAcademy IAC Route Table"
        }
      ~ vpc_id           = "vpc-0560b6d4a11d01a60" -> (known after apply) # forces replacement
    }

  # aws_route_table.devopsacademy-iac-rt-private[0] must be replaced
-/+ resource "aws_route_table" "devopsacademy-iac-rt-private" {
      ~ id               = "rtb-0419d93e8356348a8" -> (known after apply)
      ~ owner_id         = "478433196210" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      ~ route            = [
          - {
              - cidr_block                = "0.0.0.0/0"
              - egress_only_gateway_id    = ""
              - gateway_id                = ""
              - instance_id               = ""
              - ipv6_cidr_block           = ""
              - nat_gateway_id            = "nat-03ede095ad9185316"
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
            "Name" = "DevOpsAcademy IAC Private Route Table"
        }
      ~ vpc_id           = "vpc-0560b6d4a11d01a60" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private[0] must be replaced
-/+ resource "aws_route_table_association" "private" {
      ~ id             = "rtbassoc-09c85511b5903eb69" -> (known after apply)
      ~ route_table_id = "rtb-0419d93e8356348a8" -> (known after apply)
      ~ subnet_id      = "subnet-01a8bbf3512056e33" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private[1] must be replaced
-/+ resource "aws_route_table_association" "private" {
      ~ id             = "rtbassoc-04a3b40f0b23503c0" -> (known after apply)
      ~ route_table_id = "rtb-0419d93e8356348a8" -> (known after apply)
      ~ subnet_id      = "subnet-01d3bdbb4ab996413" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public[0] must be replaced
-/+ resource "aws_route_table_association" "public" {
      ~ id             = "rtbassoc-0c3fab0fd5519801d" -> (known after apply)
      ~ route_table_id = "rtb-0d2030a8e7427dee6" -> (known after apply)
      ~ subnet_id      = "subnet-016265861f756d2e2" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public[1] must be replaced
-/+ resource "aws_route_table_association" "public" {
      ~ id             = "rtbassoc-003baa4f3f28feb91" -> (known after apply)
      ~ route_table_id = "rtb-0d2030a8e7427dee6" -> (known after apply)
      ~ subnet_id      = "subnet-090a2e7a5f7c5f53d" -> (known after apply) # forces replacement
    }

  # aws_subnet.private-subnet[0] must be replaced
-/+ resource "aws_subnet" "private-subnet" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:478433196210:subnet/subnet-01a8bbf3512056e33" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az3" -> (known after apply)
        cidr_block                      = "10.0.1.0/24"
      ~ id                              = "subnet-01a8bbf3512056e33" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "478433196210" -> (known after apply)
        tags                            = {
            "Name" = "Private Subnet 1"
        }
      ~ vpc_id                          = "vpc-0560b6d4a11d01a60" -> (known after apply) # forces replacement
    }

  # aws_subnet.private-subnet[1] must be replaced
-/+ resource "aws_subnet" "private-subnet" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:478433196210:subnet/subnet-01d3bdbb4ab996413" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2b"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
        cidr_block                      = "10.0.2.0/24"
      ~ id                              = "subnet-01d3bdbb4ab996413" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "478433196210" -> (known after apply)
        tags                            = {
            "Name" = "Private Subnet 2"
        }
      ~ vpc_id                          = "vpc-0560b6d4a11d01a60" -> (known after apply) # forces replacement
    }

  # aws_subnet.public-subnet[0] must be replaced
-/+ resource "aws_subnet" "public-subnet" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:478433196210:subnet/subnet-016265861f756d2e2" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az3" -> (known after apply)
      ~ cidr_block                      = "10.0.3.0/24" -> "10.0.5.0/24" # forces replacement
      ~ id                              = "subnet-016265861f756d2e2" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = true
      ~ owner_id                        = "478433196210" -> (known after apply)
        tags                            = {
            "Name" = "Public Subnet 3"
        }
      ~ vpc_id                          = "vpc-0560b6d4a11d01a60" -> (known after apply) # forces replacement
    }

  # aws_subnet.public-subnet[1] must be replaced
-/+ resource "aws_subnet" "public-subnet" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:478433196210:subnet/subnet-090a2e7a5f7c5f53d" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2b"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
        cidr_block                      = "10.0.4.0/24"
      ~ id                              = "subnet-090a2e7a5f7c5f53d" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = true
      ~ owner_id                        = "478433196210" -> (known after apply)
      ~ tags                            = {
          ~ "Name" = "Public Subnet 4" -> "Public Subnet 4 iac03"
        }
      ~ vpc_id                          = "vpc-0560b6d4a11d01a60" -> (known after apply) # forces replacement
    }

  # aws_vpc.devopsacademy-iac must be replaced
-/+ resource "aws_vpc" "devopsacademy-iac" {
      ~ arn                              = "arn:aws:ec2:ap-southeast-2:478433196210:vpc/vpc-0560b6d4a11d01a60" -> (known after apply)
        assign_generated_ipv6_cidr_block = false
      ~ cidr_block                       = "10.0.0.0/16" -> "10.1.0.0/16" # forces replacement
      ~ default_network_acl_id           = "acl-007fd10ae72db52ec" -> (known after apply)
      ~ default_route_table_id           = "rtb-0c7fd9a885ad956eb" -> (known after apply)
      ~ default_security_group_id        = "sg-022e9c94540250a55" -> (known after apply)
      ~ dhcp_options_id                  = "dopt-9dc3e8fa" -> (known after apply)
      ~ enable_classiclink               = false -> (known after apply)
      ~ enable_classiclink_dns_support   = false -> (known after apply)
        enable_dns_hostnames             = true
        enable_dns_support               = true
      ~ id                               = "vpc-0560b6d4a11d01a60" -> (known after apply)
        instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      ~ main_route_table_id              = "rtb-0c7fd9a885ad956eb" -> (known after apply)
      ~ owner_id                         = "478433196210" -> (known after apply)
        tags                             = {
            "Name" = "devopsacademy-iac"
        }
    }

Plan: 12 to add, 1 to change, 12 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

---

Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/205c822cbdcd0fd791608eed129941bbee16ce5f/classes/04class/exercises/c04-iac03/README.md)
