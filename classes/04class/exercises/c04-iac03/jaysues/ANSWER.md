# C04-IAC03

- Why changing the VPC CIDR led to replacing multiple resources?

As you have changed the VPC CIDR the subnets which rely on the VPC will be destroyed if the VPC CIDR changes. Terraform will replace the VPC with the updated configuration instead. This will also reflect in the Statefile


## Terraform plan output

```sh
➜  jaysues git:(jaysues/c04-iac02) ✗ terraform plan
aws_eip.devopsacademy_nat_gateway: Refreshing state... [id=eipalloc-0ab38b7479251a6ce]
aws_vpc.devopsacademy_iac: Refreshing state... [id=vpc-06e89224d1c8c9866]
aws_internet_gateway.devopsacademy_igw: Refreshing state... [id=igw-05f4ec85126dd144a]
aws_subnet.pub_a: Refreshing state... [id=subnet-082ec5d648ca133c7]
aws_subnet.priv_a: Refreshing state... [id=subnet-0c9b3d26bf4a0648d]
aws_subnet.priv_b: Refreshing state... [id=subnet-0b964ff5db0750501]
aws_subnet.pub_b: Refreshing state... [id=subnet-082a2df315aca884b]
aws_route_table.devopsacademy_route_table: Refreshing state... [id=rtb-0c02da0cd63d85170]
aws_nat_gateway.devopsacademy_nat_gateway: Refreshing state... [id=nat-02dde7e81c9c40f71]
aws_route_table_association.priv_a: Refreshing state... [id=rtbassoc-08c1d383f3350ba7d]
aws_route_table_association.pub_b: Refreshing state... [id=rtbassoc-074ea61b6b52b32f9]
aws_route_table_association.priv_b: Refreshing state... [id=rtbassoc-0305950fff2507bdb]
aws_route_table_association.pub_a: Refreshing state... [id=rtbassoc-08a5496489dd2dc90]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply":

  # aws_eip.devopsacademy_nat_gateway has changed
  ~ resource "aws_eip" "devopsacademy_nat_gateway" {
      + association_id       = "eipassoc-0eca6a48df658e80f"
        id                   = "eipalloc-0ab38b7479251a6ce"
      + network_interface    = "eni-02a84dbb9d748f560"
      + private_dns          = "ip-10-0-40-148.ap-southeast-2.compute.internal"
      + private_ip           = "10.0.40.148"
      + tags                 = {}
        # (8 unchanged attributes hidden)
    }


Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes, the following plan may include actions to undo or respond to these changes.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_internet_gateway.devopsacademy_igw will be updated in-place
  ~ resource "aws_internet_gateway" "devopsacademy_igw" {
        id       = "igw-05f4ec85126dd144a"
        tags     = {
            "Name" = "devopsacademy-igw"
        }
      ~ vpc_id   = "vpc-06e89224d1c8c9866" -> (known after apply)
        # (3 unchanged attributes hidden)
    }

  # aws_nat_gateway.devopsacademy_nat_gateway must be replaced
-/+ resource "aws_nat_gateway" "devopsacademy_nat_gateway" {
      ~ id                   = "nat-02dde7e81c9c40f71" -> (known after apply)
      ~ network_interface_id = "eni-02a84dbb9d748f560" -> (known after apply)
      ~ private_ip           = "10.0.40.148" -> (known after apply)
      ~ public_ip            = "3.24.235.153" -> (known after apply)
      ~ subnet_id            = "subnet-082ec5d648ca133c7" -> (known after apply) # forces replacement
        tags                 = {
            "Name" = "devopsacademy-natgw"
        }
        # (3 unchanged attributes hidden)
    }

  # aws_route_table.devopsacademy_route_table must be replaced
-/+ resource "aws_route_table" "devopsacademy_route_table" {
      ~ arn              = "arn:aws:ec2:ap-southeast-2:738343455957:route-table/rtb-0c02da0cd63d85170" -> (known after apply)
      ~ id               = "rtb-0c02da0cd63d85170" -> (known after apply)
      ~ owner_id         = "738343455957" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
        tags             = {
            "Name" = "devopsacademy-rtb"
        }
      ~ vpc_id           = "vpc-06e89224d1c8c9866" -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # aws_route_table_association.priv_a must be replaced
-/+ resource "aws_route_table_association" "priv_a" {
      ~ id             = "rtbassoc-08c1d383f3350ba7d" -> (known after apply)
      ~ route_table_id = "rtb-0c02da0cd63d85170" -> (known after apply)
      ~ subnet_id      = "subnet-0c9b3d26bf4a0648d" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.priv_b must be replaced
-/+ resource "aws_route_table_association" "priv_b" {
      ~ id             = "rtbassoc-0305950fff2507bdb" -> (known after apply)
      ~ route_table_id = "rtb-0c02da0cd63d85170" -> (known after apply)
      ~ subnet_id      = "subnet-0b964ff5db0750501" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.pub_a must be replaced
-/+ resource "aws_route_table_association" "pub_a" {
      ~ id             = "rtbassoc-08a5496489dd2dc90" -> (known after apply)
      ~ route_table_id = "rtb-0c02da0cd63d85170" -> (known after apply)
      ~ subnet_id      = "subnet-082ec5d648ca133c7" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.pub_b must be replaced
-/+ resource "aws_route_table_association" "pub_b" {
      ~ id             = "rtbassoc-074ea61b6b52b32f9" -> (known after apply)
      ~ route_table_id = "rtb-0c02da0cd63d85170" -> (known after apply)
      ~ subnet_id      = "subnet-082a2df315aca884b" -> (known after apply) # forces replacement
    }

  # aws_subnet.priv_a must be replaced
-/+ resource "aws_subnet" "priv_a" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:738343455957:subnet/subnet-0c9b3d26bf4a0648d" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az1" -> (known after apply)
      ~ id                                             = "subnet-0c9b3d26bf4a0648d" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "738343455957" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "devopsacademy-iac-priv-subnet-a"
        }
      ~ vpc_id                                         = "vpc-06e89224d1c8c9866" -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # aws_subnet.priv_b must be replaced
-/+ resource "aws_subnet" "priv_b" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:738343455957:subnet/subnet-0b964ff5db0750501" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az2" -> (known after apply)
      ~ id                                             = "subnet-0b964ff5db0750501" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "738343455957" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "devopsacademy-iac-priv-subnet-b"
        }
      ~ vpc_id                                         = "vpc-06e89224d1c8c9866" -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # aws_subnet.pub_a must be replaced
-/+ resource "aws_subnet" "pub_a" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:738343455957:subnet/subnet-082ec5d648ca133c7" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az1" -> (known after apply)
      ~ cidr_block                                     = "10.0.40.0/24" -> "10.0.50.0/24" # forces replacement
      ~ id                                             = "subnet-082ec5d648ca133c7" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "738343455957" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "devopsacademy-iac-pub-subnet-a"
        }
      ~ vpc_id                                         = "vpc-06e89224d1c8c9866" -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # aws_subnet.pub_b must be replaced
-/+ resource "aws_subnet" "pub_b" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:738343455957:subnet/subnet-082a2df315aca884b" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az2" -> (known after apply)
      ~ id                                             = "subnet-082a2df315aca884b" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "738343455957" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
      ~ tags                                           = {
          ~ "Name" = "devopsacademy-iac-pub-subnet-b" -> "devopsacademy-iac-pub-subnet-b-the-second"
        }
      ~ tags_all                                       = {
          ~ "Name" = "devopsacademy-iac-pub-subnet-b" -> "devopsacademy-iac-pub-subnet-b-the-second"
        }
      ~ vpc_id                                         = "vpc-06e89224d1c8c9866" -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # aws_vpc.devopsacademy_iac must be replaced
-/+ resource "aws_vpc" "devopsacademy_iac" {
      ~ arn                                  = "arn:aws:ec2:ap-southeast-2:738343455957:vpc/vpc-06e89224d1c8c9866" -> (known after apply)
      - assign_generated_ipv6_cidr_block     = false -> null
      ~ cidr_block                           = "10.0.0.0/16" -> "10.1.0.0/16" # forces replacement
      ~ default_network_acl_id               = "acl-01ed47c50b86971b4" -> (known after apply)
      ~ default_route_table_id               = "rtb-0f74a681fae6e8a2f" -> (known after apply)
      ~ default_security_group_id            = "sg-0ab131eac727be395" -> (known after apply)
      ~ dhcp_options_id                      = "dopt-0be60e4e9b4b91096" -> (known after apply)
      ~ enable_classiclink                   = false -> (known after apply)
      ~ enable_classiclink_dns_support       = false -> (known after apply)
      ~ enable_dns_hostnames                 = false -> (known after apply)
      ~ id                                   = "vpc-06e89224d1c8c9866" -> (known after apply)
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      - ipv6_netmask_length                  = 0 -> null
      ~ main_route_table_id                  = "rtb-0f74a681fae6e8a2f" -> (known after apply)
      ~ owner_id                             = "738343455957" -> (known after apply)
        tags                                 = {
            "Name" = "devopsacademy-vpc"
        }
        # (3 unchanged attributes hidden)
    }

Plan: 11 to add, 1 to change, 11 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/7c4bce633a38e1c65066fdb6544df45cd1dc06ee/classes/04class/exercises/c04-iac03/README.md)
