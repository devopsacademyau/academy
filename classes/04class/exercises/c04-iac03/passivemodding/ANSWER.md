# C04-IAC03

- Why changing the VPC CIDR led to replacing multiple resources?

CIDR blocks for the VPC and subnets cannot be changed without recreating them. Terraform will destroy and recreate in order to apply the new values

> It's not possible to change or modify the IP address range of an existing virtual private cloud (VPC) or subnet.

Ref: https://aws.amazon.com/premiumsupport/knowledge-center/vpc-ip-address-range/

## Terraform plan output

```sh
terraform plan -var-file="main.tfvars"
aws_eip.ip: Refreshing state... [id=eipalloc-0a906287b4a07940f]
aws_vpc.main: Refreshing state... [id=vpc-0e5d5b892d8ab16de]
aws_internet_gateway.gateway: Refreshing state... [id=igw-0c93f53b89d386ac3]
aws_subnet.private2: Refreshing state... [id=subnet-0c9fe58100c9fcfdd]
aws_subnet.public2: Refreshing state... [id=subnet-0a91e274b964dae22]
aws_subnet.public1: Refreshing state... [id=subnet-05731637230297023]
aws_subnet.private1: Refreshing state... [id=subnet-0824a4ce299fe9552]
aws_route_table.private_routes: Refreshing state... [id=rtb-0e7f2773e26831118]
aws_route_table.public_routes: Refreshing state... [id=rtb-02e82d3d9db81c1e8]
aws_nat_gateway.nat: Refreshing state... [id=nat-066e8fb22bd2ef58a]
aws_route_table_association.private2: Refreshing state... [id=rtbassoc-05d63200f7e384e40]
aws_route_table_association.private1: Refreshing state... [id=rtbassoc-0cf8a5eb26c268cfb]
aws_route_table_association.public1: Refreshing state... [id=rtbassoc-0e77ce3b064a22893]
aws_route_table_association.public2: Refreshing state... [id=rtbassoc-0088748b12cff0742]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_eip.ip will be updated in-place
  ~ resource "aws_eip" "ip" {
        id                   = "eipalloc-0a906287b4a07940f"
        tags                 = {}
      ~ tags_all             = {
          + "Environment" = "Production"
          + "Owner"       = "Ops"
        }
        # (11 unchanged attributes hidden)
    }

  # aws_internet_gateway.gateway will be updated in-place
  ~ resource "aws_internet_gateway" "gateway" {
        id       = "igw-0c93f53b89d386ac3"
        tags     = {}
      ~ vpc_id   = "vpc-0e5d5b892d8ab16de" -> (known after apply)
        # (3 unchanged attributes hidden)
    }

  # aws_nat_gateway.nat must be replaced
-/+ resource "aws_nat_gateway" "nat" {
      ~ id                   = "nat-066e8fb22bd2ef58a" -> (known after apply)
      ~ network_interface_id = "eni-02c3595926ad3e050" -> (known after apply)
      ~ private_ip           = "10.0.1.228" -> (known after apply)
      ~ public_ip            = "108.128.8.35" -> (known after apply)
      ~ subnet_id            = "subnet-05731637230297023" -> (known after apply) # forces replacement
      - tags                 = {} -> null
        # (3 unchanged attributes hidden)
    }

  # aws_route_table.private_routes must be replaced
-/+ resource "aws_route_table" "private_routes" {
      ~ arn              = "arn:aws:ec2:eu-west-1:152848913167:route-table/rtb-0e7f2773e26831118" -> (known after apply)
      ~ id               = "rtb-0e7f2773e26831118" -> (known after apply)
      ~ owner_id         = "152848913167" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      - tags             = {} -> null
      ~ vpc_id           = "vpc-0e5d5b892d8ab16de" -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # aws_route_table.public_routes must be replaced
-/+ resource "aws_route_table" "public_routes" {
      ~ arn              = "arn:aws:ec2:eu-west-1:152848913167:route-table/rtb-02e82d3d9db81c1e8" -> (known after apply)
      ~ id               = "rtb-02e82d3d9db81c1e8" -> (known after apply)
      ~ owner_id         = "152848913167" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      - tags             = {} -> null
      ~ vpc_id           = "vpc-0e5d5b892d8ab16de" -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # aws_route_table_association.private1 must be replaced
-/+ resource "aws_route_table_association" "private1" {
      ~ id             = "rtbassoc-0cf8a5eb26c268cfb" -> (known after apply)
      ~ route_table_id = "rtb-0e7f2773e26831118" -> (known after apply)
      ~ subnet_id      = "subnet-0824a4ce299fe9552" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private2 must be replaced
-/+ resource "aws_route_table_association" "private2" {
      ~ id             = "rtbassoc-05d63200f7e384e40" -> (known after apply)
      ~ route_table_id = "rtb-0e7f2773e26831118" -> (known after apply)
      ~ subnet_id      = "subnet-0c9fe58100c9fcfdd" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public1 must be replaced
-/+ resource "aws_route_table_association" "public1" {
      ~ id             = "rtbassoc-0e77ce3b064a22893" -> (known after apply)
      ~ route_table_id = "rtb-02e82d3d9db81c1e8" -> (known after apply)
      ~ subnet_id      = "subnet-05731637230297023" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public2 must be replaced
-/+ resource "aws_route_table_association" "public2" {
      ~ id             = "rtbassoc-0088748b12cff0742" -> (known after apply)
      ~ route_table_id = "rtb-02e82d3d9db81c1e8" -> (known after apply)
      ~ subnet_id      = "subnet-0a91e274b964dae22" -> (known after apply) # forces replacement
    }

  # aws_subnet.private1 must be replaced
-/+ resource "aws_subnet" "private1" {
      ~ arn                                            = "arn:aws:ec2:eu-west-1:152848913167:subnet/subnet-0824a4ce299fe9552" -> (known after apply)
      ~ availability_zone                              = "eu-west-1b" -> (known after apply)
      ~ availability_zone_id                           = "euw1-az2" -> (known after apply)
      ~ id                                             = "subnet-0824a4ce299fe9552" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "subnet_private_1"
        }
      ~ vpc_id                                         = "vpc-0e5d5b892d8ab16de" -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # aws_subnet.private2 must be replaced
-/+ resource "aws_subnet" "private2" {
      ~ arn                                            = "arn:aws:ec2:eu-west-1:152848913167:subnet/subnet-0c9fe58100c9fcfdd" -> (known after apply)
      ~ availability_zone                              = "eu-west-1a" -> (known after apply)
      ~ availability_zone_id                           = "euw1-az1" -> (known after apply)
      ~ id                                             = "subnet-0c9fe58100c9fcfdd" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "subnet_private_2"
        }
      ~ vpc_id                                         = "vpc-0e5d5b892d8ab16de" -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # aws_subnet.public1 must be replaced
-/+ resource "aws_subnet" "public1" {
      ~ arn                                            = "arn:aws:ec2:eu-west-1:152848913167:subnet/subnet-05731637230297023" -> (known after apply)
      ~ availability_zone                              = "eu-west-1a" -> (known after apply)
      ~ availability_zone_id                           = "euw1-az1" -> (known after apply)
      ~ cidr_block                                     = "10.0.1.0/24" -> "10.1.1.0/24" # forces replacement
      ~ id                                             = "subnet-05731637230297023" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
      ~ tags                                           = {
          ~ "Name" = "subnet_public_1" -> "subnet_public_1_newname"
        }
      ~ tags_all                                       = {
          ~ "Name"        = "subnet_public_1" -> "subnet_public_1_newname"
            # (2 unchanged elements hidden)
        }
      ~ vpc_id                                         = "vpc-0e5d5b892d8ab16de" -> (known after apply) # forces replacement
        # (6 unchanged attributes hidden)
    }

  # aws_subnet.public2 must be replaced
-/+ resource "aws_subnet" "public2" {
      ~ arn                                            = "arn:aws:ec2:eu-west-1:152848913167:subnet/subnet-0a91e274b964dae22" -> (known after apply)
      ~ availability_zone                              = "eu-west-1a" -> (known after apply)
      ~ availability_zone_id                           = "euw1-az1" -> (known after apply)
      ~ id                                             = "subnet-0a91e274b964dae22" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "subnet_public_2"
        }
      ~ vpc_id                                         = "vpc-0e5d5b892d8ab16de" -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # aws_vpc.main must be replaced
-/+ resource "aws_vpc" "main" {
      ~ arn                                  = "arn:aws:ec2:eu-west-1:152848913167:vpc/vpc-0e5d5b892d8ab16de" -> (known after apply)
      - assign_generated_ipv6_cidr_block     = false -> null
      ~ cidr_block                           = "10.0.0.0/16" -> "10.1.0.0/16" # forces replacement
      ~ default_network_acl_id               = "acl-0a7f090c6924b9068" -> (known after apply)
      ~ default_route_table_id               = "rtb-06b9a73104c833ac1" -> (known after apply)
      ~ default_security_group_id            = "sg-06a7d02251fe96930" -> (known after apply)
      ~ dhcp_options_id                      = "dopt-4d01f32b" -> (known after apply)
      ~ enable_classiclink                   = false -> (known after apply)
      ~ enable_classiclink_dns_support       = false -> (known after apply)
      ~ enable_dns_hostnames                 = false -> (known after apply)
      ~ id                                   = "vpc-0e5d5b892d8ab16de" -> (known after apply)
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      - ipv6_netmask_length                  = 0 -> null
      ~ main_route_table_id                  = "rtb-06b9a73104c833ac1" -> (known after apply)
      ~ owner_id                             = "152848913167" -> (known after apply)
        tags                                 = {
            "Name" = "devopsacademy-iac"
        }
        # (3 unchanged attributes hidden)
    }

Plan: 12 to add, 2 to change, 12 to destroy.

Changes to Outputs:
  ~ subnet_public_1_cidr = "10.0.1.0/24" -> "10.1.1.0/24"
  ~ vpc_cidr             = "10.0.0.0/16" -> "10.1.0.0/16"

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── 

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
```

***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/7c4bce633a38e1c65066fdb6544df45cd1dc06ee/classes/04class/exercises/c04-iac03/README.md)
