# C04-IAC03

- Why changing the VPC CIDR led to replacing multiple resources?

> It is not possible to change the VPC cidr block or subnet cidr block without recreating them. So Terrafrom will calculate all the resources that need to be destroyed and recreated to update with these new variables. 


## Terraform plan output

```sh
ravi.senevirathne@contino.io@Ravis-MacBook-Pro ravisenevirathne % terraform plan -var-file="main.tfvars"
aws_eip.this: Refreshing state... [id=eipalloc-07925241d0b2e0392]
aws_vpc.this: Refreshing state... [id=vpc-0979324bf76584b95]
aws_subnet.private_2: Refreshing state... [id=subnet-02154dc47c416ec02]
aws_subnet.private_1: Refreshing state... [id=subnet-0e28abd3d5d56b3b5]
aws_internet_gateway.this: Refreshing state... [id=igw-0e195ac9db1b54d0d]
aws_subnet.public_1: Refreshing state... [id=subnet-063442862c0f1a29e]
aws_subnet.public_2: Refreshing state... [id=subnet-0bda17fce18bea196]
aws_route_table.public: Refreshing state... [id=rtb-055651e01ff8ffb50]
aws_nat_gateway.this: Refreshing state... [id=nat-02092cbe0c9993ac1]
aws_route_table.private: Refreshing state... [id=rtb-0bdbedca0944e5200]
aws_route_table_association.public_1: Refreshing state... [id=rtbassoc-055a5f33376c8f4e1]
aws_route_table_association.public_2: Refreshing state... [id=rtbassoc-001bfd65c27827010]
aws_route_table_association.private_2: Refreshing state... [id=rtbassoc-0b0f9faaca0936608]
aws_route_table_association.private_1: Refreshing state... [id=rtbassoc-0b5f4e17df9f5d960]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply":

  # aws_eip.this has changed
  ~ resource "aws_eip" "this" {
      + association_id       = "eipassoc-0d4d53e374a012be5"
        id                   = "eipalloc-07925241d0b2e0392"
      + network_interface    = "eni-03bae42e0d41ac957"
      + private_dns          = "ip-10-0-1-234.us-east-2.compute.internal"
      + private_ip           = "10.0.1.234"
      + tags                 = {}
        # (8 unchanged attributes hidden)
    }

  # aws_route_table.private has changed
  ~ resource "aws_route_table" "private" {
        id               = "rtb-0bdbedca0944e5200"
      ~ route            = [
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = "0.0.0.0/0"
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = ""
              + instance_id                = ""
              + ipv6_cidr_block            = ""
              + local_gateway_id           = ""
              + nat_gateway_id             = "nat-02092cbe0c9993ac1"
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
          - {
              - carrier_gateway_id         = ""
              - cidr_block                 = "0.0.0.0/0"
              - destination_prefix_list_id = ""
              - egress_only_gateway_id     = ""
              - gateway_id                 = "nat-02092cbe0c9993ac1"
              - instance_id                = ""
              - ipv6_cidr_block            = ""
              - local_gateway_id           = ""
              - nat_gateway_id             = ""
              - network_interface_id       = ""
              - transit_gateway_id         = ""
              - vpc_endpoint_id            = ""
              - vpc_peering_connection_id  = ""
            },
        ]
        tags             = {
            "Name" = "rt-private"
        }
        # (5 unchanged attributes hidden)
    }


Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes, the following plan may include actions
to undo or respond to these changes.

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_internet_gateway.this will be updated in-place
  ~ resource "aws_internet_gateway" "this" {
        id       = "igw-0e195ac9db1b54d0d"
        tags     = {
            "Name" = "igw"
        }
      ~ vpc_id   = "vpc-0979324bf76584b95" -> (known after apply)
        # (3 unchanged attributes hidden)
    }

  # aws_nat_gateway.this must be replaced
-/+ resource "aws_nat_gateway" "this" {
      ~ id                   = "nat-02092cbe0c9993ac1" -> (known after apply)
      ~ network_interface_id = "eni-03bae42e0d41ac957" -> (known after apply)
      ~ private_ip           = "10.0.1.234" -> (known after apply)
      ~ public_ip            = "18.189.240.184" -> (known after apply)
      ~ subnet_id            = "subnet-063442862c0f1a29e" -> (known after apply) # forces replacement
        tags                 = {
            "Name" = "nat"
        }
        # (3 unchanged attributes hidden)
    }

  # aws_route_table.private must be replaced
-/+ resource "aws_route_table" "private" {
      ~ arn              = "arn:aws:ec2:us-east-2:152848913167:route-table/rtb-0bdbedca0944e5200" -> (known after apply)
      ~ id               = "rtb-0bdbedca0944e5200" -> (known after apply)
      ~ owner_id         = "152848913167" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      ~ route            = [
          - {
              - carrier_gateway_id         = ""
              - cidr_block                 = "0.0.0.0/0"
              - destination_prefix_list_id = ""
              - egress_only_gateway_id     = ""
              - gateway_id                 = ""
              - instance_id                = ""
              - ipv6_cidr_block            = ""
              - local_gateway_id           = ""
              - nat_gateway_id             = "nat-02092cbe0c9993ac1"
              - network_interface_id       = ""
              - transit_gateway_id         = ""
              - vpc_endpoint_id            = ""
              - vpc_peering_connection_id  = ""
            },
            # (1 unchanged element hidden)
        ]
        tags             = {
            "Name" = "rt-private"
        }
      ~ vpc_id           = "vpc-0979324bf76584b95" -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # aws_route_table.public must be replaced
-/+ resource "aws_route_table" "public" {
      ~ arn              = "arn:aws:ec2:us-east-2:152848913167:route-table/rtb-055651e01ff8ffb50" -> (known after apply)
      ~ id               = "rtb-055651e01ff8ffb50" -> (known after apply)
      ~ owner_id         = "152848913167" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
        tags             = {
            "Name" = "rt-public"
        }
      ~ vpc_id           = "vpc-0979324bf76584b95" -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # aws_route_table_association.private_1 must be replaced
-/+ resource "aws_route_table_association" "private_1" {
      ~ id             = "rtbassoc-0b5f4e17df9f5d960" -> (known after apply)
      ~ route_table_id = "rtb-0bdbedca0944e5200" -> (known after apply)
      ~ subnet_id      = "subnet-0e28abd3d5d56b3b5" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private_2 must be replaced
-/+ resource "aws_route_table_association" "private_2" {
      ~ id             = "rtbassoc-0b0f9faaca0936608" -> (known after apply)
      ~ route_table_id = "rtb-0bdbedca0944e5200" -> (known after apply)
      ~ subnet_id      = "subnet-02154dc47c416ec02" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public_1 must be replaced
-/+ resource "aws_route_table_association" "public_1" {
      ~ id             = "rtbassoc-055a5f33376c8f4e1" -> (known after apply)
      ~ route_table_id = "rtb-055651e01ff8ffb50" -> (known after apply)
      ~ subnet_id      = "subnet-063442862c0f1a29e" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public_2 must be replaced
-/+ resource "aws_route_table_association" "public_2" {
      ~ id             = "rtbassoc-001bfd65c27827010" -> (known after apply)
      ~ route_table_id = "rtb-055651e01ff8ffb50" -> (known after apply)
      ~ subnet_id      = "subnet-0bda17fce18bea196" -> (known after apply) # forces replacement
    }

  # aws_subnet.private_1 must be replaced
-/+ resource "aws_subnet" "private_1" {
      ~ arn                                            = "arn:aws:ec2:us-east-2:152848913167:subnet/subnet-0e28abd3d5d56b3b5" -> (known after apply)
      ~ availability_zone                              = "us-east-2a" -> (known after apply)
      ~ availability_zone_id                           = "use2-az1" -> (known after apply)
      ~ id                                             = "subnet-0e28abd3d5d56b3b5" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "private_subnet_1"
        }
      ~ vpc_id                                         = "vpc-0979324bf76584b95" -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # aws_subnet.private_2 must be replaced
-/+ resource "aws_subnet" "private_2" {
      ~ arn                                            = "arn:aws:ec2:us-east-2:152848913167:subnet/subnet-02154dc47c416ec02" -> (known after apply)
      ~ availability_zone                              = "us-east-2c" -> (known after apply)
      ~ availability_zone_id                           = "use2-az3" -> (known after apply)
      ~ id                                             = "subnet-02154dc47c416ec02" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "private_subnet_2"
        }
      ~ vpc_id                                         = "vpc-0979324bf76584b95" -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # aws_subnet.public_1 must be replaced
-/+ resource "aws_subnet" "public_1" {
      ~ arn                                            = "arn:aws:ec2:us-east-2:152848913167:subnet/subnet-063442862c0f1a29e" -> (known after apply)
      ~ availability_zone                              = "us-east-2c" -> (known after apply)
      ~ availability_zone_id                           = "use2-az3" -> (known after apply)
      ~ cidr_block                                     = "10.0.1.0/24" -> "10.0.100.0/24" # forces replacement
      ~ id                                             = "subnet-063442862c0f1a29e" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "public_subnet_1"
        }
      ~ vpc_id                                         = "vpc-0979324bf76584b95" -> (known after apply) # forces replacement
        # (7 unchanged attributes hidden)
    }

  # aws_subnet.public_2 must be replaced
-/+ resource "aws_subnet" "public_2" {
      ~ arn                                            = "arn:aws:ec2:us-east-2:152848913167:subnet/subnet-0bda17fce18bea196" -> (known after apply)
      ~ availability_zone                              = "us-east-2a" -> (known after apply)
      ~ availability_zone_id                           = "use2-az1" -> (known after apply)
      ~ id                                             = "subnet-0bda17fce18bea196" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
      ~ tags                                           = {
          ~ "Name" = "public_subnet_2" -> "public_subnet_2_NEW"
        }
      ~ tags_all                                       = {
          ~ "Name" = "public_subnet_2" -> "public_subnet_2_NEW"
        }
      ~ vpc_id                                         = "vpc-0979324bf76584b95" -> (known after apply) # forces replacement
        # (7 unchanged attributes hidden)
    }

  # aws_vpc.this must be replaced
-/+ resource "aws_vpc" "this" {
      ~ arn                                  = "arn:aws:ec2:us-east-2:152848913167:vpc/vpc-0979324bf76584b95" -> (known after apply)
      - assign_generated_ipv6_cidr_block     = false -> null
      ~ cidr_block                           = "10.0.0.0/16" -> "10.0.0.0/20" # forces replacement
      ~ default_network_acl_id               = "acl-07a6e19ea668ddcb9" -> (known after apply)
      ~ default_route_table_id               = "rtb-056f02a282bad4321" -> (known after apply)
      ~ default_security_group_id            = "sg-06f6595225ad50092" -> (known after apply)
      ~ dhcp_options_id                      = "dopt-824d24ea" -> (known after apply)
      ~ enable_classiclink                   = false -> (known after apply)
      ~ enable_classiclink_dns_support       = false -> (known after apply)
      ~ enable_dns_hostnames                 = false -> (known after apply)
      ~ id                                   = "vpc-0979324bf76584b95" -> (known after apply)
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      - ipv6_netmask_length                  = 0 -> null
      ~ main_route_table_id                  = "rtb-056f02a282bad4321" -> (known after apply)
      ~ owner_id                             = "152848913167" -> (known after apply)
        tags                                 = {
            "Name" = "devopsacademy-iac-vpc"
        }
        # (3 unchanged attributes hidden)
    }

Plan: 12 to add, 1 to change, 12 to destroy.

Changes to Outputs:
  ~ Public_Subnet_1_CIDR = "10.0.1.0/24" -> "10.0.100.0/24"
  ~ VPC_CIDR             = "10.0.0.0/16" -> "10.0.0.0/20"

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/7c4bce633a38e1c65066fdb6544df45cd1dc06ee/classes/04class/exercises/c04-iac03/README.md)
