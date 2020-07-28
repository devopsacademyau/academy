# C04-IAC03

## Terraform plan output


➜  mfreitassm git:(mfreitassm/c04-iac02) ✗ terraform plan -var-file="main.tfvars" 

Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

aws_vpc.devops_vpc: Refreshing state... [id=vpc-0564ae33cc973498a]
aws_eip.devops_ngw_ip: Refreshing state... [id=eipalloc-04302f2d9e2b1b983]
aws_subnet.private[1]: Refreshing state... [id=subnet-0ac3cb982af8cc5d0]
aws_route_table.public_rtb: Refreshing state... [id=rtb-03d5be624eacbf84a]
aws_route_table.private_rtb: Refreshing state... [id=rtb-07198385d9c964e52]
aws_subnet.public[0]: Refreshing state... [id=subnet-034e39d88c7b6032f]
aws_internet_gateway.devops_igw: Refreshing state... [id=igw-0464c6f766a006ef4]
aws_subnet.private[0]: Refreshing state... [id=subnet-08d23fc12f93ceb03]
aws_subnet.public[1]: Refreshing state... [id=subnet-0127c59e15677ec8f]
aws_route.public_rtb_igw: Refreshing state... [id=r-rtb-03d5be624eacbf84a1080289494]
aws_route_table_association.private_rtb_association[0]: Refreshing state... [id=rtbassoc-0b9ecab93c67f893e]
aws_route_table_association.private_rtb_association[1]: Refreshing state... [id=rtbassoc-0ea3c1f47da3a0d0a]
aws_nat_gateway.devops_ngw: Refreshing state... [id=nat-0be1105c6403df4bc]
aws_route_table_association.public_rtb_association[1]: Refreshing state... [id=rtbassoc-0551b6ab989163752]
aws_route_table_association.public_rtb_association[0]: Refreshing state... [id=rtbassoc-00721ea6a8c22cc59]
aws_route.private_rtb_ngw: Refreshing state... [id=r-rtb-07198385d9c964e521080289494]

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_internet_gateway.devops_igw will be updated in-place
  ~ resource "aws_internet_gateway" "devops_igw" {
        arn      = "arn:aws:ec2:ap-southeast-2:490308117505:internet-gateway/igw-0464c6f766a006ef4"
        id       = "igw-0464c6f766a006ef4"
        owner_id = "490308117505"
        tags     = {
            "Name" = "devops-igw"
        }
      ~ vpc_id   = "vpc-0564ae33cc973498a" -> (known after apply)
    }

  # aws_nat_gateway.devops_ngw must be replaced
-/+ resource "aws_nat_gateway" "devops_ngw" {
        allocation_id        = "eipalloc-04302f2d9e2b1b983"
      ~ id                   = "nat-0be1105c6403df4bc" -> (known after apply)
      ~ network_interface_id = "eni-0d43349476db9076e" -> (known after apply)
      ~ private_ip           = "10.0.0.47" -> (known after apply)
      ~ public_ip            = "54.206.137.187" -> (known after apply)
      ~ subnet_id            = "subnet-08d23fc12f93ceb03" -> (known after apply) # forces replacement
        tags                 = {
            "Name" = "devops-ngw"
        }
    }

  # aws_route.private_rtb_ngw must be replaced
-/+ resource "aws_route" "private_rtb_ngw" {
        destination_cidr_block     = "0.0.0.0/0"
      + destination_prefix_list_id = (known after apply)
      + egress_only_gateway_id     = (known after apply)
      + gateway_id                 = (known after apply)
      ~ id                         = "r-rtb-07198385d9c964e521080289494" -> (known after apply)
      + instance_id                = (known after apply)
      + instance_owner_id          = (known after apply)
      ~ nat_gateway_id             = "nat-0be1105c6403df4bc" -> (known after apply)
      + network_interface_id       = (known after apply)
      ~ origin                     = "CreateRoute" -> (known after apply)
      ~ route_table_id             = "rtb-07198385d9c964e52" -> (known after apply) # forces replacement
      ~ state                      = "active" -> (known after apply)
    }

  # aws_route.public_rtb_igw must be replaced
-/+ resource "aws_route" "public_rtb_igw" {
        destination_cidr_block     = "0.0.0.0/0"
      + destination_prefix_list_id = (known after apply)
      + egress_only_gateway_id     = (known after apply)
        gateway_id                 = "igw-0464c6f766a006ef4"
      ~ id                         = "r-rtb-03d5be624eacbf84a1080289494" -> (known after apply)
      + instance_id                = (known after apply)
      + instance_owner_id          = (known after apply)
      + nat_gateway_id             = (known after apply)
      + network_interface_id       = (known after apply)
      ~ origin                     = "CreateRoute" -> (known after apply)
      ~ route_table_id             = "rtb-03d5be624eacbf84a" -> (known after apply) # forces replacement
      ~ state                      = "active" -> (known after apply)
    }

  # aws_route_table.private_rtb must be replaced
-/+ resource "aws_route_table" "private_rtb" {
      ~ id               = "rtb-07198385d9c964e52" -> (known after apply)
      ~ owner_id         = "490308117505" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      ~ route            = [
          - {
              - cidr_block                = "0.0.0.0/0"
              - egress_only_gateway_id    = ""
              - gateway_id                = ""
              - instance_id               = ""
              - ipv6_cidr_block           = ""
              - nat_gateway_id            = "nat-0be1105c6403df4bc"
              - network_interface_id      = ""
              - transit_gateway_id        = ""
              - vpc_peering_connection_id = ""
            },
        ] -> (known after apply)
        tags             = {
            "Name" = "devops-rtb-ngw"
        }
      ~ vpc_id           = "vpc-0564ae33cc973498a" -> (known after apply) # forces replacement
    }

  # aws_route_table.public_rtb must be replaced
-/+ resource "aws_route_table" "public_rtb" {
      ~ id               = "rtb-03d5be624eacbf84a" -> (known after apply)
      ~ owner_id         = "490308117505" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      ~ route            = [
          - {
              - cidr_block                = "0.0.0.0/0"
              - egress_only_gateway_id    = ""
              - gateway_id                = "igw-0464c6f766a006ef4"
              - instance_id               = ""
              - ipv6_cidr_block           = ""
              - nat_gateway_id            = ""
              - network_interface_id      = ""
              - transit_gateway_id        = ""
              - vpc_peering_connection_id = ""
            },
        ] -> (known after apply)
        tags             = {
            "Name" = "devops-rtb-igw"
        }
      ~ vpc_id           = "vpc-0564ae33cc973498a" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private_rtb_association[0] must be replaced
-/+ resource "aws_route_table_association" "private_rtb_association" {
      ~ id             = "rtbassoc-0b9ecab93c67f893e" -> (known after apply)
      ~ route_table_id = "rtb-07198385d9c964e52" -> (known after apply)
      ~ subnet_id      = "subnet-08d23fc12f93ceb03" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private_rtb_association[1] must be replaced
-/+ resource "aws_route_table_association" "private_rtb_association" {
      ~ id             = "rtbassoc-0ea3c1f47da3a0d0a" -> (known after apply)
      ~ route_table_id = "rtb-07198385d9c964e52" -> (known after apply)
      ~ subnet_id      = "subnet-0ac3cb982af8cc5d0" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public_rtb_association[0] must be replaced
-/+ resource "aws_route_table_association" "public_rtb_association" {
      ~ id             = "rtbassoc-00721ea6a8c22cc59" -> (known after apply)
      ~ route_table_id = "rtb-03d5be624eacbf84a" -> (known after apply)
      ~ subnet_id      = "subnet-034e39d88c7b6032f" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public_rtb_association[1] must be replaced
-/+ resource "aws_route_table_association" "public_rtb_association" {
      ~ id             = "rtbassoc-0551b6ab989163752" -> (known after apply)
      ~ route_table_id = "rtb-03d5be624eacbf84a" -> (known after apply)
      ~ subnet_id      = "subnet-0127c59e15677ec8f" -> (known after apply) # forces replacement
    }

  # aws_subnet.private[0] must be replaced
-/+ resource "aws_subnet" "private" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:490308117505:subnet/subnet-08d23fc12f93ceb03" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az3" -> (known after apply)
      ~ cidr_block                      = "10.0.0.0/24" -> "10.0.0.0/20" # forces replacement
      ~ id                              = "subnet-08d23fc12f93ceb03" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "490308117505" -> (known after apply)
        tags                            = {
            "Name" = "private-a"
        }
      ~ vpc_id                          = "vpc-0564ae33cc973498a" -> (known after apply) # forces replacement
    }

  # aws_subnet.private[1] must be replaced
-/+ resource "aws_subnet" "private" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:490308117505:subnet/subnet-0ac3cb982af8cc5d0" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2b"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
        cidr_block                      = "10.0.10.0/24"
      ~ id                              = "subnet-0ac3cb982af8cc5d0" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "490308117505" -> (known after apply)
      ~ tags                            = {
          ~ "Name" = "private-b" -> "private-c"
        }
      ~ vpc_id                          = "vpc-0564ae33cc973498a" -> (known after apply) # forces replacement
    }

  # aws_subnet.public[0] must be replaced
-/+ resource "aws_subnet" "public" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:490308117505:subnet/subnet-034e39d88c7b6032f" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az3" -> (known after apply)
        cidr_block                      = "10.0.1.0/24"
      ~ id                              = "subnet-034e39d88c7b6032f" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = true
      ~ owner_id                        = "490308117505" -> (known after apply)
        tags                            = {
            "Name" = "public-a"
        }
      ~ vpc_id                          = "vpc-0564ae33cc973498a" -> (known after apply) # forces replacement
    }

  # aws_subnet.public[1] must be replaced
-/+ resource "aws_subnet" "public" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:490308117505:subnet/subnet-0127c59e15677ec8f" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2b"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
        cidr_block                      = "10.0.11.0/24"
      ~ id                              = "subnet-0127c59e15677ec8f" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = true
      ~ owner_id                        = "490308117505" -> (known after apply)
        tags                            = {
            "Name" = "public-b"
        }
      ~ vpc_id                          = "vpc-0564ae33cc973498a" -> (known after apply) # forces replacement
    }

  # aws_vpc.devops_vpc must be replaced
-/+ resource "aws_vpc" "devops_vpc" {
      ~ arn                              = "arn:aws:ec2:ap-southeast-2:490308117505:vpc/vpc-0564ae33cc973498a" -> (known after apply)
        assign_generated_ipv6_cidr_block = false
      ~ cidr_block                       = "10.0.0.0/16" -> "10.0.0.0/18" # forces replacement
      ~ default_network_acl_id           = "acl-08de6b728a4c56181" -> (known after apply)
      ~ default_route_table_id           = "rtb-0a80728acb10e5eea" -> (known after apply)
      ~ default_security_group_id        = "sg-070b8af3ae4c1a33b" -> (known after apply)
      ~ dhcp_options_id                  = "dopt-ab5f74cc" -> (known after apply)
      ~ enable_classiclink               = false -> (known after apply)
      ~ enable_classiclink_dns_support   = false -> (known after apply)
        enable_dns_hostnames             = true
        enable_dns_support               = true
      ~ id                               = "vpc-0564ae33cc973498a" -> (known after apply)
        instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      ~ main_route_table_id              = "rtb-0a80728acb10e5eea" -> (known after apply)
      ~ owner_id                         = "490308117505" -> (known after apply)
        tags                             = {
            "Name" = "devopsacademy-iac"
        }
    }

Plan: 14 to add, 1 to change, 14 to destroy.

------------------------------------------------------------------------
***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/205c822cbdcd0fd791608eed129941bbee16ce5f/classes/04class/exercises/c04-iac03/README.md)