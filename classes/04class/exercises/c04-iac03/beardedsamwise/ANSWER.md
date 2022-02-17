# C04-IAC03

- Why changing the VPC CIDR led to replacing multiple resources?

> Based on AWS documentation it's not possible to modify the IP address range of an existing virtual private cloud (VPC) or subnet. You must delete the VPC or subnet, and then create a new VPC or subnet with your preferred CIDR block. Due to this, Terraform will tear down the existing VPC and rebuild it if the VPC CIDR changes. 

## Terraform plan output

```
$ terraform plan -var-file=main.tfvars
aws_eip.eip: Refreshing state... [id=eipalloc-019f57b99eeca31d3]
aws_vpc.main: Refreshing state... [id=vpc-0f5f70c61bc2b089a]
aws_subnet.private1: Refreshing state... [id=subnet-0d18e1484ebf0a020]
aws_subnet.public2: Refreshing state... [id=subnet-04707586fc5a9d354]
aws_subnet.private2: Refreshing state... [id=subnet-0038bb78cd5f2355a]
aws_internet_gateway.gw: Refreshing state... [id=igw-0b83fcb73c8a9b4d5]
aws_subnet.public1: Refreshing state... [id=subnet-0df798d1ac9aa86b4]
aws_route_table.public: Refreshing state... [id=rtb-06b26a0d418866164]
aws_nat_gateway.gw: Refreshing state... [id=nat-0b15570e95727d6ba]
aws_route_table_association.public2: Refreshing state... [id=rtbassoc-0ff942498be1a7b6d]
aws_route_table.private: Refreshing state... [id=rtb-0775885a68543a983]
aws_route_table_association.public1: Refreshing state... [id=rtbassoc-035b201e8161ea141]
aws_route_table_association.private1: Refreshing state... [id=rtbassoc-04e499a9fadf6d0eb]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply":

  # aws_eip.eip has changed
  ~ resource "aws_eip" "eip" {
      + association_id       = "eipassoc-0dffe0b5fe58136b2"
        id                   = "eipalloc-019f57b99eeca31d3"
      + network_interface    = "eni-0fa1d6c9f383387a4"
      + private_dns          = "ip-10-0-0-67.ap-southeast-2.compute.internal"
      + private_ip           = "10.0.0.67"
      + tags                 = {}
        # (8 unchanged attributes hidden)
    }

  # aws_route_table.private has changed
  ~ resource "aws_route_table" "private" {
        id               = "rtb-0775885a68543a983"
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
              + nat_gateway_id             = "nat-0b15570e95727d6ba"
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
              - gateway_id                 = "nat-0b15570e95727d6ba"
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
            "Name" = "c04-iac02-private"
        }
        # (5 unchanged attributes hidden)
    }


Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes, the following plan may include actions
to undo or respond to these changes.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_internet_gateway.gw will be updated in-place
  ~ resource "aws_internet_gateway" "gw" {
        id       = "igw-0b83fcb73c8a9b4d5"
        tags     = {
            "Name" = "c04-iac02"
        }
      ~ vpc_id   = "vpc-0f5f70c61bc2b089a" -> (known after apply)
        # (3 unchanged attributes hidden)
    }

  # aws_nat_gateway.gw must be replaced
-/+ resource "aws_nat_gateway" "gw" {
      ~ id                   = "nat-0b15570e95727d6ba" -> (known after apply)
      ~ network_interface_id = "eni-0fa1d6c9f383387a4" -> (known after apply)
      ~ private_ip           = "10.0.0.67" -> (known after apply)
      ~ public_ip            = "13.238.81.14" -> (known after apply)
      ~ subnet_id            = "subnet-0d18e1484ebf0a020" -> (known after apply) # forces replacement
        tags                 = {
            "Name" = "c04-iac02"
        }
        # (3 unchanged attributes hidden)
    }

  # aws_route_table.private must be replaced
-/+ resource "aws_route_table" "private" {
      ~ arn              = "arn:aws:ec2:ap-southeast-2:639247960747:route-table/rtb-0775885a68543a983" -> (known after apply)
      ~ id               = "rtb-0775885a68543a983" -> (known after apply)
      ~ owner_id         = "639247960747" -> (known after apply)
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
              - nat_gateway_id             = "nat-0b15570e95727d6ba"
              - network_interface_id       = ""
              - transit_gateway_id         = ""
              - vpc_endpoint_id            = ""
              - vpc_peering_connection_id  = ""
            },
            # (1 unchanged element hidden)
        ]
        tags             = {
            "Name" = "c04-iac02-private"
        }
      ~ vpc_id           = "vpc-0f5f70c61bc2b089a" -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # aws_route_table.public must be replaced
-/+ resource "aws_route_table" "public" {
      ~ arn              = "arn:aws:ec2:ap-southeast-2:639247960747:route-table/rtb-06b26a0d418866164" -> (known after apply)
      ~ id               = "rtb-06b26a0d418866164" -> (known after apply)
      ~ owner_id         = "639247960747" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
        tags             = {
            "Name" = "c04-iac02-public"
        }
      ~ vpc_id           = "vpc-0f5f70c61bc2b089a" -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # aws_route_table_association.private1 must be replaced
-/+ resource "aws_route_table_association" "private1" {
      ~ id             = "rtbassoc-04e499a9fadf6d0eb" -> (known after apply)
      ~ route_table_id = "rtb-0775885a68543a983" -> (known after apply)
      ~ subnet_id      = "subnet-0d18e1484ebf0a020" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public1 must be replaced
-/+ resource "aws_route_table_association" "public1" {
      ~ id             = "rtbassoc-035b201e8161ea141" -> (known after apply)
      ~ route_table_id = "rtb-06b26a0d418866164" -> (known after apply)
      ~ subnet_id      = "subnet-0df798d1ac9aa86b4" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public2 must be replaced
-/+ resource "aws_route_table_association" "public2" {
      ~ id             = "rtbassoc-0ff942498be1a7b6d" -> (known after apply)
      ~ route_table_id = "rtb-06b26a0d418866164" -> (known after apply)
      ~ subnet_id      = "subnet-04707586fc5a9d354" -> (known after apply) # forces replacement
    }

  # aws_subnet.private1 must be replaced
-/+ resource "aws_subnet" "private1" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:639247960747:subnet/subnet-0d18e1484ebf0a020" -> (known after apply)
      ~ availability_zone                              = "ap-southeast-2c" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az2" -> (known after apply)
      ~ cidr_block                                     = "10.0.0.0/24" -> "10.1.0.0/24" # forces replacement
      ~ id                                             = "subnet-0d18e1484ebf0a020" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "639247960747" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "c04-iac02-private1"
        }
      ~ vpc_id                                         = "vpc-0f5f70c61bc2b089a" -> (known after apply) # forces replacement
        # (7 unchanged attributes hidden)
    }

  # aws_subnet.private2 must be replaced
-/+ resource "aws_subnet" "private2" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:639247960747:subnet/subnet-0038bb78cd5f2355a" -> (known after apply)
      ~ availability_zone                              = "ap-southeast-2b" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az1" -> (known after apply)
      ~ id                                             = "subnet-0038bb78cd5f2355a" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "639247960747" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
      ~ tags                                           = {
          ~ "Name" = "c04-iac02-private2" -> "c04-iac02-private222"
        }
      ~ tags_all                                       = {
          ~ "Name" = "c04-iac02-private2" -> "c04-iac02-private222"
        }
      ~ vpc_id                                         = "vpc-0f5f70c61bc2b089a" -> (known after apply) # forces replacement
        # (7 unchanged attributes hidden)
    }

  # aws_subnet.public1 must be replaced
-/+ resource "aws_subnet" "public1" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:639247960747:subnet/subnet-0df798d1ac9aa86b4" -> (known after apply)
      ~ availability_zone                              = "ap-southeast-2c" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az2" -> (known after apply)
      ~ id                                             = "subnet-0df798d1ac9aa86b4" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "639247960747" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "c04-iac02-public1"
        }
      ~ vpc_id                                         = "vpc-0f5f70c61bc2b089a" -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # aws_subnet.public2 must be replaced
-/+ resource "aws_subnet" "public2" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:639247960747:subnet/subnet-04707586fc5a9d354" -> (known after apply)
      ~ availability_zone                              = "ap-southeast-2b" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az1" -> (known after apply)
      ~ id                                             = "subnet-04707586fc5a9d354" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "639247960747" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "c04-iac02-public2"
        }
      ~ vpc_id                                         = "vpc-0f5f70c61bc2b089a" -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # aws_vpc.main must be replaced
-/+ resource "aws_vpc" "main" {
      ~ arn                                  = "arn:aws:ec2:ap-southeast-2:639247960747:vpc/vpc-0f5f70c61bc2b089a" -> (known after apply)
      - assign_generated_ipv6_cidr_block     = false -> null
      ~ cidr_block                           = "10.0.0.0/16" -> "10.1.0.0/16" # forces replacement
      ~ default_network_acl_id               = "acl-0d352836bfa711a78" -> (known after apply)
      ~ default_route_table_id               = "rtb-0baadafef496fe50e" -> (known after apply)
      ~ default_security_group_id            = "sg-0787c22ec61c83282" -> (known after apply)
      ~ dhcp_options_id                      = "dopt-554a393c" -> (known after apply)
      ~ enable_classiclink                   = false -> (known after apply)
      ~ enable_classiclink_dns_support       = false -> (known after apply)
      ~ enable_dns_hostnames                 = false -> (known after apply)
      ~ id                                   = "vpc-0f5f70c61bc2b089a" -> (known after apply)
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      - ipv6_netmask_length                  = 0 -> null
      ~ main_route_table_id                  = "rtb-0baadafef496fe50e" -> (known after apply)
      ~ owner_id                             = "639247960747" -> (known after apply)
        tags                                 = {
            "Name" = "c04-iac02"
        }
        # (3 unchanged attributes hidden)
    }

Plan: 11 to add, 1 to change, 11 to destroy.

Changes to Outputs:
  ~ private_subnet1 = "10.0.0.0/24" -> "10.1.0.0/24"
  ~ vpc_cidr        = "10.0.0.0/16" -> "10.1.0.0/16"

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/7c4bce633a38e1c65066fdb6544df45cd1dc06ee/classes/04class/exercises/c04-iac03/README.md)
