# C04-IAC03

- Why changing the VPC CIDR led to replacing multiple resources?

> It's not possible to change or modify the IP address range of an existing virtual private cloud (VPC) or subnet as per AWS. This meaning the VPC and subnets underneath need to be destroyed and recreated with new CIDRs. - https://aws.amazon.com/premiumsupport/knowledge-center/vpc-ip-address-range/#:~:text=Short%20description,secondary%20CIDR%20to%20your%20VPC.

## Terraform plan output

```sh
data.aws_availability_zones.available: Reading...
aws_eip.natgw_a: Refreshing state... [id=eipalloc-0530ffeb0d66b846e]
aws_vpc.vpc: Refreshing state... [id=vpc-015a08afcd8fe2dc7]
data.aws_availability_zones.available: Read complete after 0s [id=us-west-2]
aws_internet_gateway.igw: Refreshing state... [id=igw-0b3c8975861afd0bf]
aws_subnet.subnet_public_a: Refreshing state... [id=subnet-09746371e44213cc5]
aws_subnet.subnet_private_b: Refreshing state... [id=subnet-063162fed5ffff0f2]
aws_subnet.subnet_public_b: Refreshing state... [id=subnet-0498c394cdf5116b1]
aws_subnet.subnet_private_a: Refreshing state... [id=subnet-0f6654b91558c6227]
aws_route_table.route_table_public: Refreshing state... [id=rtb-06b0dacba1ab09188]
aws_nat_gateway.gw_a: Refreshing state... [id=nat-049c09c41e8aa2fb5]
aws_route_table_association.route_public_b: Refreshing state... [id=rtbassoc-07300bab8daa6bcb6]
aws_route_table_association.route_public_a: Refreshing state... [id=rtbassoc-0c6224a090424dcbe]
aws_route_table.route_table_private: Refreshing state... [id=rtb-050eb3b30b090b178]
aws_route_table_association.route_private_a: Refreshing state... [id=rtbassoc-0da198d1a38d978f8]
aws_route_table_association.route_private_b: Refreshing state... [id=rtbassoc-0eceece0f88b09122]

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_internet_gateway.igw will be updated in-place
  ~ resource "aws_internet_gateway" "igw" {
        id       = "igw-0b3c8975861afd0bf"
        tags     = {
            "Name" = "williamda-IGW"
        }
      ~ vpc_id   = "vpc-015a08afcd8fe2dc7" -> (known after apply)
        # (3 unchanged attributes hidden)
    }

  # aws_nat_gateway.gw_a must be replaced
-/+ resource "aws_nat_gateway" "gw_a" {
      ~ id                   = "nat-049c09c41e8aa2fb5" -> (known after apply)
      ~ network_interface_id = "eni-0079b5dc7269f237d" -> (known after apply)
      ~ private_ip           = "10.0.100.190" -> (known after apply)
      ~ public_ip            = "54.213.67.156" -> (known after apply)
      ~ subnet_id            = "subnet-09746371e44213cc5" -> (known after apply) # forces replacement
        tags                 = {
            "Name" = "NATGW-A"
        }
        # (3 unchanged attributes hidden)
    }

  # aws_route_table.route_table_private must be replaced
-/+ resource "aws_route_table" "route_table_private" {
      ~ arn              = "arn:aws:ec2:us-west-2:152848913167:route-table/rtb-050eb3b30b090b178" -> (known after apply)
      ~ id               = "rtb-050eb3b30b090b178" -> (known after apply)
      ~ owner_id         = "152848913167" -> (known after apply)
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
              - nat_gateway_id             = "nat-049c09c41e8aa2fb5"
              - network_interface_id       = ""
              - transit_gateway_id         = ""
              - vpc_endpoint_id            = ""
              - vpc_peering_connection_id  = ""
            },
            # (1 unchanged element hidden)
        ]
        tags             = {
            "Name" = "PrivateRoutingTable"
        }
      ~ vpc_id           = "vpc-015a08afcd8fe2dc7" -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # aws_route_table.route_table_public must be replaced
-/+ resource "aws_route_table" "route_table_public" {
      ~ arn              = "arn:aws:ec2:us-west-2:152848913167:route-table/rtb-06b0dacba1ab09188" -> (known after apply)
      ~ id               = "rtb-06b0dacba1ab09188" -> (known after apply)
      ~ owner_id         = "152848913167" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
        tags             = {
            "Name" = "PublicRoutingTable"
        }
      ~ vpc_id           = "vpc-015a08afcd8fe2dc7" -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # aws_route_table_association.route_private_a must be replaced
-/+ resource "aws_route_table_association" "route_private_a" {
      ~ id             = "rtbassoc-0da198d1a38d978f8" -> (known after apply)
      ~ route_table_id = "rtb-050eb3b30b090b178" -> (known after apply)
      ~ subnet_id      = "subnet-0f6654b91558c6227" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.route_private_b must be replaced
-/+ resource "aws_route_table_association" "route_private_b" {
      ~ id             = "rtbassoc-0eceece0f88b09122" -> (known after apply)
      ~ route_table_id = "rtb-050eb3b30b090b178" -> (known after apply)
      ~ subnet_id      = "subnet-063162fed5ffff0f2" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.route_public_a must be replaced
-/+ resource "aws_route_table_association" "route_public_a" {
      ~ id             = "rtbassoc-0c6224a090424dcbe" -> (known after apply)
      ~ route_table_id = "rtb-06b0dacba1ab09188" -> (known after apply)
      ~ subnet_id      = "subnet-09746371e44213cc5" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.route_public_b must be replaced
-/+ resource "aws_route_table_association" "route_public_b" {
      ~ id             = "rtbassoc-07300bab8daa6bcb6" -> (known after apply)
      ~ route_table_id = "rtb-06b0dacba1ab09188" -> (known after apply)
      ~ subnet_id      = "subnet-0498c394cdf5116b1" -> (known after apply) # forces replacement
    }

  # aws_subnet.subnet_private_a must be replaced
-/+ resource "aws_subnet" "subnet_private_a" {
      ~ arn                                            = "arn:aws:ec2:us-west-2:152848913167:subnet/subnet-0f6654b91558c6227" -> (known after apply)
      ~ availability_zone_id                           = "usw2-az2" -> (known after apply)
      ~ cidr_block                                     = "10.0.10.0/24" -> "10.0.30.0/24" # forces replacement
      ~ id                                             = "subnet-0f6654b91558c6227" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "private-a"
        }
      ~ vpc_id                                         = "vpc-015a08afcd8fe2dc7" -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # aws_subnet.subnet_private_b must be replaced
-/+ resource "aws_subnet" "subnet_private_b" {
      ~ arn                                            = "arn:aws:ec2:us-west-2:152848913167:subnet/subnet-063162fed5ffff0f2" -> (known after apply)
      ~ availability_zone_id                           = "usw2-az1" -> (known after apply)
      ~ id                                             = "subnet-063162fed5ffff0f2" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
      ~ tags                                           = {
          ~ "Name" = "private-b" -> "private-c"
        }
      ~ tags_all                                       = {
          ~ "Name" = "private-b" -> "private-c"
        }
      ~ vpc_id                                         = "vpc-015a08afcd8fe2dc7" -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # aws_subnet.subnet_public_a must be replaced
-/+ resource "aws_subnet" "subnet_public_a" {
      ~ arn                                            = "arn:aws:ec2:us-west-2:152848913167:subnet/subnet-09746371e44213cc5" -> (known after apply)
      ~ availability_zone_id                           = "usw2-az2" -> (known after apply)
      ~ id                                             = "subnet-09746371e44213cc5" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "public-a"
        }
      ~ vpc_id                                         = "vpc-015a08afcd8fe2dc7" -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # aws_subnet.subnet_public_b must be replaced
-/+ resource "aws_subnet" "subnet_public_b" {
      ~ arn                                            = "arn:aws:ec2:us-west-2:152848913167:subnet/subnet-0498c394cdf5116b1" -> (known after apply)
      ~ availability_zone_id                           = "usw2-az1" -> (known after apply)
      ~ id                                             = "subnet-0498c394cdf5116b1" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "public-b"
        }
      ~ vpc_id                                         = "vpc-015a08afcd8fe2dc7" -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # aws_vpc.vpc must be replaced
-/+ resource "aws_vpc" "vpc" {
      ~ arn                                  = "arn:aws:ec2:us-west-2:152848913167:vpc/vpc-015a08afcd8fe2dc7" -> (known after apply)
      - assign_generated_ipv6_cidr_block     = false -> null
      ~ cidr_block                           = "10.0.0.0/16" -> "10.10.0.0/16" # forces replacement
      ~ default_network_acl_id               = "acl-07fcd99358b46f71f" -> (known after apply)
      ~ default_route_table_id               = "rtb-0aa04de7fa0cd3582" -> (known after apply)
      ~ default_security_group_id            = "sg-0cfac71ece39f73f1" -> (known after apply)
      ~ dhcp_options_id                      = "dopt-de620da7" -> (known after apply)
      ~ enable_classiclink                   = false -> (known after apply)
      ~ enable_classiclink_dns_support       = false -> (known after apply)
      ~ enable_dns_hostnames                 = false -> (known after apply)
      ~ id                                   = "vpc-015a08afcd8fe2dc7" -> (known after apply)
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      - ipv6_netmask_length                  = 0 -> null
      ~ main_route_table_id                  = "rtb-0aa04de7fa0cd3582" -> (known after apply)
      ~ owner_id                             = "152848913167" -> (known after apply)
        tags                                 = {
            "Name" = "williamDA"
        }
        # (3 unchanged attributes hidden)
    }

Plan: 12 to add, 1 to change, 12 to destroy.

Changes to Outputs:
  ~ vpc_cidr    = "10.0.0.0/16" -> "10.10.0.0/16"
  ~ vpc_subnets = [
      - "10.0.10.0/24",
      + "10.0.30.0/24",
        "10.0.100.0/24",
        # (2 unchanged elements hidden)
    ]

─────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
```

***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/7c4bce633a38e1c65066fdb6544df45cd1dc06ee/classes/04class/exercises/c04-iac03/README.md)