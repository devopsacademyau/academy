# C04-IAC03

- Why changing the VPC CIDR led to replacing multiple resources?

> Changing the VPC CIDR will affect the networking components within your environment such as subnets. New subnets must be created with CIDR ranges that fit within the VPC CIDR range. VPCs and Subnets are immutable resources. 


## Terraform plan output

```sh
aws_eip.ngw-eip: Refreshing state... [id=eipalloc-02ef509c9aa93f154]
aws_vpc.vpc: Refreshing state... [id=vpc-044dc15ae82681a36]
aws_internet_gateway.igw: Refreshing state... [id=igw-01eaa5f9347775296]
aws_subnet.subnets["subnet_01"]: Refreshing state... [id=subnet-0798541dd087895cd]
aws_subnet.subnets["subnet_03"]: Refreshing state... [id=subnet-0c1da435c0f0e75b6]
aws_subnet.subnets["subnet_02"]: Refreshing state... [id=subnet-03758eaaf901e3556]
aws_subnet.subnets["subnet_04"]: Refreshing state... [id=subnet-0e0667e24c7e865e7]
aws_nat_gateway.ngw: Refreshing state... [id=nat-0c237a4abfc718bcf]
aws_route_table.route_table_igw: Refreshing state... [id=rtb-0155c7dc7a87e8e68]
aws_route_table.route_table_ngw: Refreshing state... [id=rtb-03e939c7611e4416f]
aws_route_table_association.public_route_assoc_public_subnet_01: Refreshing state... [id=rtbassoc-0a9091c6f32b3a31e]
aws_route_table_association.public_route_assoc_public_subnet_02: Refreshing state... [id=rtbassoc-014231cf5d7d4c018]
aws_route_table_association.private_route_assoc_private_subnet04: Refreshing state... [id=rtbassoc-0f84d8156142bb87f]
aws_route_table_association.private_route_assoc_private_subnet_03: Refreshing state... [id=rtbassoc-096bbfa938464297c]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the
last "terraform apply":

  # aws_route_table.route_table_ngw has changed
  ~ resource "aws_route_table" "route_table_ngw" {
        id               = "rtb-03e939c7611e4416f"
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
              + nat_gateway_id             = "nat-0c237a4abfc718bcf"
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
              - gateway_id                 = "nat-0c237a4abfc718bcf"
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
            "Exercise" = "c04-iac02"
            "Name"     = "Route table for the ngw"
            "Student"  = "Vishaal Pal"
        }
        # (5 unchanged attributes hidden)
    }


Unless you have made equivalent changes to your configuration, or ignored the
relevant attributes using ignore_changes, the following plan may include
actions to undo or respond to these changes.

─────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_internet_gateway.igw will be updated in-place
  ~ resource "aws_internet_gateway" "igw" {
        id       = "igw-01eaa5f9347775296"
      ~ tags     = {
          - "Exercise" = "c04-iac02"
          - "Name"     = "Internet gateway associated with - vpc-044dc15ae82681a36"
          - "Student"  = "Vishaal Pal"
        } -> (known after apply)
      ~ tags_all = {
          - "Exercise" = "c04-iac02"
          - "Name"     = "Internet gateway associated with - vpc-044dc15ae82681a36"
          - "Student"  = "Vishaal Pal"
        } -> (known after apply)
      ~ vpc_id   = "vpc-044dc15ae82681a36" -> (known after apply)
        # (2 unchanged attributes hidden)
    }

  # aws_nat_gateway.ngw must be replaced
-/+ resource "aws_nat_gateway" "ngw" {
      ~ id                   = "nat-0c237a4abfc718bcf" -> (known after apply)
      ~ network_interface_id = "eni-07093f3f4d6e1bbe0" -> (known after apply)
      ~ private_ip           = "10.0.1.208" -> (known after apply)
      ~ public_ip            = "54.253.8.78" -> (known after apply)
      ~ subnet_id            = "subnet-0798541dd087895cd" -> (known after apply) # forces replacement
      ~ tags                 = {
          - "Exercise" = "c04-iac02"
          - "Name"     = "NAT gateway residing in subnet-0798541dd087895cd"
          - "Student"  = "Vishaal Pal"
        } -> (known after apply)
      ~ tags_all             = {
          - "Exercise" = "c04-iac02"
          - "Name"     = "NAT gateway residing in subnet-0798541dd087895cd"
          - "Student"  = "Vishaal Pal"
        } -> (known after apply)
        # (2 unchanged attributes hidden)
    }

  # aws_route_table.route_table_igw must be replaced
-/+ resource "aws_route_table" "route_table_igw" {
      ~ arn              = "arn:aws:ec2:ap-southeast-2:969496245957:route-table/rtb-0155c7dc7a87e8e68" -> (known after apply)
      ~ id               = "rtb-0155c7dc7a87e8e68" -> (known after apply)
      ~ owner_id         = "969496245957" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
        tags             = {
            "Exercise" = "c04-iac02"
            "Name"     = "Route table for the igw"
            "Student"  = "Vishaal Pal"
        }
      ~ vpc_id           = "vpc-044dc15ae82681a36" -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # aws_route_table.route_table_ngw must be replaced
-/+ resource "aws_route_table" "route_table_ngw" {
      ~ arn              = "arn:aws:ec2:ap-southeast-2:969496245957:route-table/rtb-03e939c7611e4416f" -> (known after apply)
      ~ id               = "rtb-03e939c7611e4416f" -> (known after apply)
      ~ owner_id         = "969496245957" -> (known after apply)
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
              - nat_gateway_id             = "nat-0c237a4abfc718bcf"
              - network_interface_id       = ""
              - transit_gateway_id         = ""
              - vpc_endpoint_id            = ""
              - vpc_peering_connection_id  = ""
            },
            # (1 unchanged element hidden)
        ]
        tags             = {
            "Exercise" = "c04-iac02"
            "Name"     = "Route table for the ngw"
            "Student"  = "Vishaal Pal"
        }
      ~ vpc_id           = "vpc-044dc15ae82681a36" -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # aws_route_table_association.private_route_assoc_private_subnet04 must be replaced
-/+ resource "aws_route_table_association" "private_route_assoc_private_subnet04" {
      ~ id             = "rtbassoc-0f84d8156142bb87f" -> (known after apply)
      ~ route_table_id = "rtb-03e939c7611e4416f" -> (known after apply)
      ~ subnet_id      = "subnet-0e0667e24c7e865e7" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private_route_assoc_private_subnet_03 must be replaced
-/+ resource "aws_route_table_association" "private_route_assoc_private_subnet_03" {
      ~ id             = "rtbassoc-096bbfa938464297c" -> (known after apply)
      ~ route_table_id = "rtb-03e939c7611e4416f" -> (known after apply)
      ~ subnet_id      = "subnet-0c1da435c0f0e75b6" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public_route_assoc_public_subnet_01 must be replaced
-/+ resource "aws_route_table_association" "public_route_assoc_public_subnet_01" {
      ~ id             = "rtbassoc-0a9091c6f32b3a31e" -> (known after apply)
      ~ route_table_id = "rtb-0155c7dc7a87e8e68" -> (known after apply)
      ~ subnet_id      = "subnet-0798541dd087895cd" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public_route_assoc_public_subnet_02 must be replaced
-/+ resource "aws_route_table_association" "public_route_assoc_public_subnet_02" {
      ~ id             = "rtbassoc-014231cf5d7d4c018" -> (known after apply)
      ~ route_table_id = "rtb-0155c7dc7a87e8e68" -> (known after apply)
      ~ subnet_id      = "subnet-03758eaaf901e3556" -> (known after apply) # forces replacement
    }

  # aws_subnet.subnets["subnet_01"] must be replaced
-/+ resource "aws_subnet" "subnets" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:969496245957:subnet/subnet-0798541dd087895cd" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az1" -> (known after apply)
      ~ cidr_block                                     = "10.0.1.0/24" -> "10.0.100.0/24" # forces replacement
      ~ id                                             = "subnet-0798541dd087895cd" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "969496245957" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
      ~ tags                                           = {
          ~ "Name"     = "public_subnet_01" -> "public_subnet_100"
            # (2 unchanged elements hidden)
        }
      ~ tags_all                                       = {
          ~ "Name"     = "public_subnet_01" -> "public_subnet_100"
            # (2 unchanged elements hidden)
        }
      ~ vpc_id                                         = "vpc-044dc15ae82681a36" -> (known after apply) # forces replacement
        # (7 unchanged attributes hidden)
    }

  # aws_subnet.subnets["subnet_02"] must be replaced
-/+ resource "aws_subnet" "subnets" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:969496245957:subnet/subnet-03758eaaf901e3556" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az3" -> (known after apply)
      ~ id                                             = "subnet-03758eaaf901e3556" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "969496245957" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Exercise" = "c04-iac02"
            "Name"     = "public_subnet_02"
            "Student"  = "Vishaal Pal"
        }
      ~ vpc_id                                         = "vpc-044dc15ae82681a36" -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # aws_subnet.subnets["subnet_03"] must be replaced
-/+ resource "aws_subnet" "subnets" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:969496245957:subnet/subnet-0c1da435c0f0e75b6" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az1" -> (known after apply)
      ~ id                                             = "subnet-0c1da435c0f0e75b6" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "969496245957" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Exercise" = "c04-iac02"
            "Name"     = "private_subnet_01"
            "Student"  = "Vishaal Pal"
        }
      ~ vpc_id                                         = "vpc-044dc15ae82681a36" -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # aws_subnet.subnets["subnet_04"] must be replaced
-/+ resource "aws_subnet" "subnets" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:969496245957:subnet/subnet-0e0667e24c7e865e7" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az3" -> (known after apply)
      ~ id                                             = "subnet-0e0667e24c7e865e7" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "969496245957" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Exercise" = "c04-iac02"
            "Name"     = "private_subnet_02"
            "Student"  = "Vishaal Pal"
        }
      ~ vpc_id                                         = "vpc-044dc15ae82681a36" -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # aws_vpc.vpc must be replaced
-/+ resource "aws_vpc" "vpc" {
      ~ arn                                  = "arn:aws:ec2:ap-southeast-2:969496245957:vpc/vpc-044dc15ae82681a36" -> (known after apply)
      - assign_generated_ipv6_cidr_block     = false -> null
      ~ cidr_block                           = "10.0.0.0/16" -> "10.0.0.0/20" # forces replacement
      ~ default_network_acl_id               = "acl-002a1c5e2c83d03d6" -> (known after apply)
      ~ default_route_table_id               = "rtb-099d33c7a1c8e5bd4" -> (known after apply)
      ~ default_security_group_id            = "sg-09282a6049ce9228c" -> (known after apply)
      ~ dhcp_options_id                      = "dopt-0af63f5f36d56d830" -> (known after apply)
      ~ enable_classiclink                   = false -> (known after apply)
      ~ enable_classiclink_dns_support       = false -> (known after apply)
      ~ enable_dns_hostnames                 = false -> (known after apply)
      ~ id                                   = "vpc-044dc15ae82681a36" -> (known after apply)
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      - ipv6_netmask_length                  = 0 -> null
      ~ main_route_table_id                  = "rtb-099d33c7a1c8e5bd4" -> (known after apply)
      ~ owner_id                             = "969496245957" -> (known after apply)
        tags                                 = {
            "Exercise" = "c04-iac02"
            "Name"     = "devopsacademy-iac"
            "Student"  = "Vishaal Pal"
        }
        # (3 unchanged attributes hidden)
    }

Plan: 12 to add, 1 to change, 12 to destroy.

Changes to Outputs:
  ~ subnet_cidrs = {
      ~ subnet_01 = "10.0.1.0/24" -> "10.0.100.0/24"
        # (3 unchanged elements hidden)
    }
  ~ subnet_ids   = {
      ~ subnet_01 = "subnet-0798541dd087895cd" -> (known after apply)
      ~ subnet_02 = "subnet-03758eaaf901e3556" -> (known after apply)
      ~ subnet_03 = "subnet-0c1da435c0f0e75b6" -> (known after apply)
      ~ subnet_04 = "subnet-0e0667e24c7e865e7" -> (known after apply)
    }
  ~ subnet_names = {
      ~ subnet_01 = "public_subnet_01" -> "public_subnet_100"
        # (3 unchanged elements hidden)
    }
  ~ vpc_id       = "10.0.0.0/16" -> "10.0.0.0/20"

─────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/7c4bce633a38e1c65066fdb6544df45cd1dc06ee/classes/04class/exercises/c04-iac03/README.md)

