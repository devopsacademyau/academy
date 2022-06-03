# C04-IAC03

- Why changing the VPC CIDR led to replacing multiple resources?
```
It is not possible to just change the CIDR block for a VPC. so it would have to be destroyed and recreated.

Many of the other resources rely on the VPC, so terriform calculates what needs to be replaced
```

## Terraform plan output

```sh
## output here
aws_vpc.vpc: Refreshing state... [id=vpc-0e46236e3b0e9fadc]
aws_subnet.public_1: Refreshing state... [id=subnet-0601d88fe3d9b3cfb]
aws_internet_gateway.inet_gw: Refreshing state... [id=igw-0eaa1c6053acfb251]
aws_route_table.public: Refreshing state... [id=rtb-03962232966bcbe62]
aws_route_table.private: Refreshing state... [id=rtb-0c954780783aa0aeb]
aws_subnet.public_2: Refreshing state... [id=subnet-03bb8c5cd0f57dbc7]
aws_subnet.private_2: Refreshing state... [id=subnet-07c613d31d0b22642]
aws_subnet.private_1: Refreshing state... [id=subnet-008f2d86eeac5af14]
aws_route_table_association.private_2: Refreshing state... [id=rtbassoc-05f01ce65f2ba1533]
aws_route_table_association.public_1: Refreshing state... [id=rtbassoc-02b99c12359f3f08e]
aws_route.public: Refreshing state... [id=r-rtb-03962232966bcbe621080289494]
aws_route_table_association.private_1: Refreshing state... [id=rtbassoc-07acd1187565ae8ca]
aws_nat_gateway.nat_gw: Refreshing state... [id=nat-0368bdf920e401c22]
aws_route_table_association.public_2: Refreshing state... [id=rtbassoc-0a526a9f2cf6cf814]
aws_route.private: Refreshing state... [id=r-rtb-0c954780783aa0aeb1080289494]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_internet_gateway.inet_gw will be updated in-place
  ~ resource "aws_internet_gateway" "inet_gw" {
        id       = "igw-0eaa1c6053acfb251"
        tags     = {}
      ~ vpc_id   = "vpc-0e46236e3b0e9fadc" -> (known after apply)
        # (3 unchanged attributes hidden)
    }

  # aws_nat_gateway.nat_gw must be replaced
-/+ resource "aws_nat_gateway" "nat_gw" {
      ~ id                   = "nat-0368bdf920e401c22" -> (known after apply)
      ~ network_interface_id = "eni-0c4ed604b33f5c8e0" -> (known after apply)
      ~ private_ip           = "10.0.1.75" -> (known after apply)
      + public_ip            = (known after apply)
      ~ subnet_id            = "subnet-008f2d86eeac5af14" -> (known after apply) # forces replacement
      - tags                 = {} -> null
      ~ tags_all             = {} -> (known after apply)
        # (1 unchanged attribute hidden)
    }

  # aws_route.private must be replaced
-/+ resource "aws_route" "private" {
      ~ id                     = "r-rtb-0c954780783aa0aeb1080289494" -> (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      ~ nat_gateway_id         = "nat-0368bdf920e401c22" -> (known after apply)
      + network_interface_id   = (known after apply)
      ~ origin                 = "CreateRoute" -> (known after apply)
      ~ route_table_id         = "rtb-0c954780783aa0aeb" -> (known after apply) # forces replacement
      ~ state                  = "active" -> (known after apply)
        # (1 unchanged attribute hidden)
    }

  # aws_route.public must be replaced
-/+ resource "aws_route" "public" {
      ~ id                     = "r-rtb-03962232966bcbe621080289494" -> (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + network_interface_id   = (known after apply)
      ~ origin                 = "CreateRoute" -> (known after apply)
      ~ route_table_id         = "rtb-03962232966bcbe62" -> (known after apply) # forces replacement
      ~ state                  = "active" -> (known after apply)
        # (2 unchanged attributes hidden)
    }

  # aws_route_table.private must be replaced
-/+ resource "aws_route_table" "private" {
      ~ arn              = "arn:aws:ec2:ap-southeast-2:246432855637:route-table/rtb-0c954780783aa0aeb" -> (known after apply)
      ~ id               = "rtb-0c954780783aa0aeb" -> (known after apply)
      ~ owner_id         = "246432855637" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      ~ route            = [
          - {
              - carrier_gateway_id         = ""
              - cidr_block                 = "0.0.0.0/0"
              - core_network_arn           = ""
              - destination_prefix_list_id = ""
              - egress_only_gateway_id     = ""
              - gateway_id                 = ""
              - instance_id                = ""
              - ipv6_cidr_block            = ""
              - local_gateway_id           = ""
              - nat_gateway_id             = "nat-0368bdf920e401c22"
              - network_interface_id       = ""
              - transit_gateway_id         = ""
              - vpc_endpoint_id            = ""
              - vpc_peering_connection_id  = ""
            },
        ] -> (known after apply)
      - tags             = {} -> null
      ~ tags_all         = {} -> (known after apply)
      ~ vpc_id           = "vpc-0e46236e3b0e9fadc" -> (known after apply) # forces replacement
    }

  # aws_route_table.public must be replaced
-/+ resource "aws_route_table" "public" {
      ~ arn              = "arn:aws:ec2:ap-southeast-2:246432855637:route-table/rtb-03962232966bcbe62" -> (known after apply)
      ~ id               = "rtb-03962232966bcbe62" -> (known after apply)
      ~ owner_id         = "246432855637" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      ~ route            = [
          - {
              - carrier_gateway_id         = ""
              - cidr_block                 = "0.0.0.0/0"
              - core_network_arn           = ""
              - destination_prefix_list_id = ""
              - egress_only_gateway_id     = ""
              - gateway_id                 = "igw-0eaa1c6053acfb251"
              - instance_id                = ""
              - ipv6_cidr_block            = ""
              - local_gateway_id           = ""
              - nat_gateway_id             = ""
              - network_interface_id       = ""
              - transit_gateway_id         = ""
              - vpc_endpoint_id            = ""
              - vpc_peering_connection_id  = ""
            },
        ] -> (known after apply)
      - tags             = {} -> null
      ~ tags_all         = {} -> (known after apply)
      ~ vpc_id           = "vpc-0e46236e3b0e9fadc" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private_1 must be replaced
-/+ resource "aws_route_table_association" "private_1" {
      ~ id             = "rtbassoc-07acd1187565ae8ca" -> (known after apply)
      ~ route_table_id = "rtb-0c954780783aa0aeb" -> (known after apply)
      ~ subnet_id      = "subnet-008f2d86eeac5af14" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private_2 must be replaced
-/+ resource "aws_route_table_association" "private_2" {
      ~ id             = "rtbassoc-05f01ce65f2ba1533" -> (known after apply)
      ~ route_table_id = "rtb-0c954780783aa0aeb" -> (known after apply)
      ~ subnet_id      = "subnet-07c613d31d0b22642" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public_1 must be replaced
-/+ resource "aws_route_table_association" "public_1" {
      ~ id             = "rtbassoc-02b99c12359f3f08e" -> (known after apply)
      ~ route_table_id = "rtb-03962232966bcbe62" -> (known after apply)
      ~ subnet_id      = "subnet-0601d88fe3d9b3cfb" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public_2 must be replaced
-/+ resource "aws_route_table_association" "public_2" {
      ~ id             = "rtbassoc-0a526a9f2cf6cf814" -> (known after apply)
      ~ route_table_id = "rtb-03962232966bcbe62" -> (known after apply)
      ~ subnet_id      = "subnet-03bb8c5cd0f57dbc7" -> (known after apply) # forces replacement
    }

  # aws_subnet.private_1 must be replaced
-/+ resource "aws_subnet" "private_1" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:246432855637:subnet/subnet-008f2d86eeac5af14" -> (known after apply)
      ~ availability_zone                              = "ap-southeast-2b" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az1" -> (known after apply)
      ~ cidr_block                                     = "10.0.1.0/24" -> "10.0.5.0/24" # forces replacement
      ~ id                                             = "subnet-008f2d86eeac5af14" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "246432855637" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "bcurrey_private_subnet_1"
        }
      ~ vpc_id                                         = "vpc-0e46236e3b0e9fadc" -> (known after apply) # forces replacement
        # (7 unchanged attributes hidden)
    }

  # aws_subnet.private_2 must be replaced
-/+ resource "aws_subnet" "private_2" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:246432855637:subnet/subnet-07c613d31d0b22642" -> (known after apply)
      ~ availability_zone                              = "ap-southeast-2b" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az1" -> (known after apply)
      ~ id                                             = "subnet-07c613d31d0b22642" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "246432855637" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "bcurrey_private_subnet_2"
        }
      ~ vpc_id                                         = "vpc-0e46236e3b0e9fadc" -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # aws_subnet.public_1 must be replaced
-/+ resource "aws_subnet" "public_1" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:246432855637:subnet/subnet-0601d88fe3d9b3cfb" -> (known after apply)
      ~ availability_zone                              = "ap-southeast-2b" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az1" -> (known after apply)
      ~ id                                             = "subnet-0601d88fe3d9b3cfb" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "246432855637" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
      ~ tags                                           = {
          ~ "Name" = "bcurrey_public_subnet_1" -> "bcurrey_public_subnet_1_hi"
        }
      ~ tags_all                                       = {
          ~ "Name" = "bcurrey_public_subnet_1" -> "bcurrey_public_subnet_1_hi"
        }
      ~ vpc_id                                         = "vpc-0e46236e3b0e9fadc" -> (known after apply) # forces replacement
        # (7 unchanged attributes hidden)
    }

  # aws_subnet.public_2 must be replaced
-/+ resource "aws_subnet" "public_2" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:246432855637:subnet/subnet-03bb8c5cd0f57dbc7" -> (known after apply)
      ~ availability_zone                              = "ap-southeast-2b" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az1" -> (known after apply)
      ~ id                                             = "subnet-03bb8c5cd0f57dbc7" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "246432855637" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "bcurrey_public_subnet_2"
        }
      ~ vpc_id                                         = "vpc-0e46236e3b0e9fadc" -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # aws_vpc.vpc must be replaced
-/+ resource "aws_vpc" "vpc" {
      ~ arn                                  = "arn:aws:ec2:ap-southeast-2:246432855637:vpc/vpc-0e46236e3b0e9fadc" -> (known after apply)
      - assign_generated_ipv6_cidr_block     = false -> null
      ~ cidr_block                           = "10.0.0.0/16" -> "10.1.0.0/16" # forces replacement
      ~ default_network_acl_id               = "acl-014f9edc56032093f" -> (known after apply)
      ~ default_route_table_id               = "rtb-029566591b304bc79" -> (known after apply)
      ~ default_security_group_id            = "sg-0dcbc319db6cffdad" -> (known after apply)
      ~ dhcp_options_id                      = "dopt-93e8b0f6" -> (known after apply)
      ~ enable_classiclink                   = false -> (known after apply)
      ~ enable_classiclink_dns_support       = false -> (known after apply)
      ~ enable_dns_hostnames                 = false -> (known after apply)
      ~ id                                   = "vpc-0e46236e3b0e9fadc" -> (known after apply)
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      - ipv6_netmask_length                  = 0 -> null
      ~ main_route_table_id                  = "rtb-029566591b304bc79" -> (known after apply)
      ~ owner_id                             = "246432855637" -> (known after apply)
        tags                                 = {
            "Name" = "devopsacademy-iac"
        }
        # (3 unchanged attributes hidden)
    }

Plan: 14 to add, 1 to change, 14 to destroy.

Changes to Outputs:
  ~ private_subnets = {
      ~ "priv_subnet_1" = {
          ~ cidr = "10.0.1.0/24" -> "10.0.5.0/24"
            name = "bcurrey_private_subnet_1"
        }
        # (1 unchanged element hidden)
    }
  ~ public_subnets  = {
      ~ "pub_subnet_1" = {
          ~ name = "bcurrey_public_subnet_1" -> "bcurrey_public_subnet_1_hi"
            # (1 unchanged element hidden)
        }
        # (1 unchanged element hidden)
    }
  ~ vpc_cidr        = "10.0.0.0/16" -> "10.1.0.0/16"



```

***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/7c4bce633a38e1c65066fdb6544df45cd1dc06ee/classes/04class/exercises/c04-iac03/README.md)
