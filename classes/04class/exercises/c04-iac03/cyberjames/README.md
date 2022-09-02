# C04-IAC03

- Why changing the VPC CIDR led to replacing multiple resources?

> According from the AWS Documentation, it's not possible to change or modify VPC CIDR of an existing VPC or subnet. Instead, you can do one of the following.

Option 1 - Create a new VPC with your preferred VPC CIDR block and migrate the resources from your old VPC to the new VPC.

Option 2 - Add an additional VPC CIDR block as secondary CIDR to your VPC.

For more information, see the link at https://aws.amazon.com/premiumsupport/knowledge-center/vpc-ip-address-range/.

## Terraform plan output

```
## output here

> terraform plan -var-file=main.tfvars -var="vpc_cidr=10.23.0.0/16" -var="subnet_pub_1_cidr=10.23.2.0/24" -var="subnet_pub_2_name=public02"
aws_eip.nat_gw_eip: Refreshing state... [id=eipalloc-0bb894066801cf982]
aws_vpc.vpc: Refreshing state... [id=vpc-0010e2df29c9f793a]
aws_internet_gateway.internet_gateway: Refreshing state... [id=igw-07107e01c12c9e17b]
aws_subnet.public_2: Refreshing state... [id=subnet-067fa733f65897bc9]
aws_subnet.public_1: Refreshing state... [id=subnet-0e7d328c257dbb36f]
aws_subnet.private_1: Refreshing state... [id=subnet-055d8935d33e541bc]
aws_subnet.private_2: Refreshing state... [id=subnet-0e071309fcf26925c]
aws_route_table.internet_gateway_rt: Refreshing state... [id=rtb-098214c19ebfe604c]
aws_nat_gateway.nat_gw: Refreshing state... [id=nat-097b56768a880bd02]
aws_route_table_association.internet_gateway_rta_2: Refreshing state... [id=rtbassoc-05885da2a1b344417]
aws_route_table_association.internet_gateway_rta_1: Refreshing state... [id=rtbassoc-051a7efa457cb8791]
aws_route_table.nat_gateway_rt: Refreshing state... [id=rtb-0b57442d0daacaebc]
aws_route_table_association.nat-gw-prv-1: Refreshing state... [id=rtbassoc-0d84970292c7f7be7]
aws_route_table_association.nat-gw-prv-2: Refreshing state... [id=rtbassoc-02514e40d69f333e7]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_internet_gateway.internet_gateway will be updated in-place
  ~ resource "aws_internet_gateway" "internet_gateway" {
        id       = "igw-07107e01c12c9e17b"
        tags     = {
            "Name" = "igw-c01-iac02"
        }
      ~ vpc_id   = "vpc-0010e2df29c9f793a" -> (known after apply)
        # (3 unchanged attributes hidden)
    }

  # aws_nat_gateway.nat_gw must be replaced
-/+ resource "aws_nat_gateway" "nat_gw" {
      ~ id                   = "nat-097b56768a880bd02" -> (known after apply)
      ~ network_interface_id = "eni-0a7e4a473b7718f80" -> (known after apply)
      ~ private_ip           = "10.0.22.208" -> (known after apply)
      ~ public_ip            = "67.202.26.110" -> (known after apply)
      ~ subnet_id            = "subnet-055d8935d33e541bc" -> (known after apply) # forces replacement
        tags                 = {
            "Name" = "natgw-c01-iac02"
        }
        # (3 unchanged attributes hidden)
    }

  # aws_route_table.internet_gateway_rt must be replaced
-/+ resource "aws_route_table" "internet_gateway_rt" {
      ~ arn              = "arn:aws:ec2:us-east-1:152848913167:route-table/rtb-098214c19ebfe604c" -> (known after apply)
      ~ id               = "rtb-098214c19ebfe604c" -> (known after apply)
      ~ owner_id         = "152848913167" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
        tags             = {
            "Name" = "public-c01-iac02"
        }
      ~ vpc_id           = "vpc-0010e2df29c9f793a" -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # aws_route_table.nat_gateway_rt must be replaced
-/+ resource "aws_route_table" "nat_gateway_rt" {
      ~ arn              = "arn:aws:ec2:us-east-1:152848913167:route-table/rtb-0b57442d0daacaebc" -> (known after apply)
      ~ id               = "rtb-0b57442d0daacaebc" -> (known after apply)
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
              - nat_gateway_id             = "nat-097b56768a880bd02"
              - network_interface_id       = ""
              - transit_gateway_id         = ""
              - vpc_endpoint_id            = ""
              - vpc_peering_connection_id  = ""
            },
            # (1 unchanged element hidden)
        ]
        tags             = {
            "Name" = "private-c01-iac02"
        }
      ~ vpc_id           = "vpc-0010e2df29c9f793a" -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # aws_route_table_association.internet_gateway_rta_1 must be replaced
-/+ resource "aws_route_table_association" "internet_gateway_rta_1" {
      ~ id             = "rtbassoc-051a7efa457cb8791" -> (known after apply)
      ~ route_table_id = "rtb-098214c19ebfe604c" -> (known after apply)
      ~ subnet_id      = "subnet-0e7d328c257dbb36f" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.internet_gateway_rta_2 must be replaced
-/+ resource "aws_route_table_association" "internet_gateway_rta_2" {
      ~ id             = "rtbassoc-05885da2a1b344417" -> (known after apply)
      ~ route_table_id = "rtb-098214c19ebfe604c" -> (known after apply)
      ~ subnet_id      = "subnet-067fa733f65897bc9" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.nat-gw-prv-1 must be replaced
-/+ resource "aws_route_table_association" "nat-gw-prv-1" {
      ~ id             = "rtbassoc-0d84970292c7f7be7" -> (known after apply)
      ~ route_table_id = "rtb-0b57442d0daacaebc" -> (known after apply)
      ~ subnet_id      = "subnet-055d8935d33e541bc" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.nat-gw-prv-2 must be replaced
-/+ resource "aws_route_table_association" "nat-gw-prv-2" {
      ~ id             = "rtbassoc-02514e40d69f333e7" -> (known after apply)
      ~ route_table_id = "rtb-0b57442d0daacaebc" -> (known after apply)
      ~ subnet_id      = "subnet-0e071309fcf26925c" -> (known after apply) # forces replacement
    }

  # aws_subnet.private_1 must be replaced
-/+ resource "aws_subnet" "private_1" {
      ~ arn                                            = "arn:aws:ec2:us-east-1:152848913167:subnet/subnet-055d8935d33e541bc" -> (known after apply)
      ~ availability_zone                              = "us-east-1c" -> (known after apply)
      ~ availability_zone_id                           = "use1-az1" -> (known after apply)
      ~ id                                             = "subnet-055d8935d33e541bc" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "private1"
        }
      ~ vpc_id                                         = "vpc-0010e2df29c9f793a" -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # aws_subnet.private_2 must be replaced
-/+ resource "aws_subnet" "private_2" {
      ~ arn                                            = "arn:aws:ec2:us-east-1:152848913167:subnet/subnet-0e071309fcf26925c" -> (known after apply)
      ~ availability_zone                              = "us-east-1a" -> (known after apply)
      ~ availability_zone_id                           = "use1-az4" -> (known after apply)
      ~ id                                             = "subnet-0e071309fcf26925c" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "private2"
        }
      ~ vpc_id                                         = "vpc-0010e2df29c9f793a" -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # aws_subnet.public_1 must be replaced
-/+ resource "aws_subnet" "public_1" {
      ~ arn                                            = "arn:aws:ec2:us-east-1:152848913167:subnet/subnet-0e7d328c257dbb36f" -> (known after apply)
      ~ availability_zone                              = "us-east-1c" -> (known after apply)
      ~ availability_zone_id                           = "use1-az1" -> (known after apply)
      ~ cidr_block                                     = "10.0.2.0/24" -> "10.23.2.0/24" # forces replacement
      ~ id                                             = "subnet-0e7d328c257dbb36f" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "public1"
        }
      ~ vpc_id                                         = "vpc-0010e2df29c9f793a" -> (known after apply) # forces replacement
        # (7 unchanged attributes hidden)
    }

  # aws_subnet.public_2 must be replaced
-/+ resource "aws_subnet" "public_2" {
      ~ arn                                            = "arn:aws:ec2:us-east-1:152848913167:subnet/subnet-067fa733f65897bc9" -> (known after apply)
      ~ availability_zone                              = "us-east-1c" -> (known after apply)
      ~ availability_zone_id                           = "use1-az1" -> (known after apply)
      ~ id                                             = "subnet-067fa733f65897bc9" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
      ~ tags                                           = {
          ~ "Name" = "public2" -> "public02"
        }
      ~ tags_all                                       = {
          ~ "Name" = "public2" -> "public02"
        }
      ~ vpc_id                                         = "vpc-0010e2df29c9f793a" -> (known after apply) # forces replacement
        # (7 unchanged attributes hidden)
    }

  # aws_vpc.vpc must be replaced
-/+ resource "aws_vpc" "vpc" {
      ~ arn                                  = "arn:aws:ec2:us-east-1:152848913167:vpc/vpc-0010e2df29c9f793a" -> (known after apply)
      - assign_generated_ipv6_cidr_block     = false -> null
      ~ cidr_block                           = "10.0.0.0/16" -> "10.23.0.0/16" # forces replacement
      ~ default_network_acl_id               = "acl-0d3092476f5e3344b" -> (known after apply)
      ~ default_route_table_id               = "rtb-0ef4e2e181b5eecb4" -> (known after apply)
      ~ default_security_group_id            = "sg-06768f5e734716962" -> (known after apply)
      ~ dhcp_options_id                      = "dopt-15a88b6d" -> (known after apply)
      ~ enable_classiclink                   = false -> (known after apply)
      ~ enable_classiclink_dns_support       = false -> (known after apply)
      ~ enable_dns_hostnames                 = false -> (known after apply)
      ~ id                                   = "vpc-0010e2df29c9f793a" -> (known after apply)
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      - ipv6_netmask_length                  = 0 -> null
      ~ main_route_table_id                  = "rtb-0ef4e2e181b5eecb4" -> (known after apply)
      ~ owner_id                             = "152848913167" -> (known after apply)
        tags                                 = {
            "Name" = "devopsacademy-iac"
        }
        # (3 unchanged attributes hidden)
    }

Plan: 12 to add, 1 to change, 12 to destroy.

Changes to Outputs:
  ~ Public_1_Subnet_CIDR = "10.0.2.0/24" -> "10.23.2.0/24"
  ~ VPC_CIDR             = "10.0.0.0/16" -> "10.23.0.0/16"

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/7c4bce633a38e1c65066fdb6544df45cd1dc06ee/classes/04class/exercises/c04-iac03/README.md)