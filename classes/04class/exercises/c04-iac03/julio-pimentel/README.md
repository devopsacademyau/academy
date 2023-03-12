# C04-IAC03

- Why changing the VPC CIDR led to replacing multiple resources?

> It modified the values from the current terraform state, therefore, Terraform prefers to replace those resources. 


## Terraform plan output

```sh
## output here

$ terraform plan -var-file "main.tfvars"
aws_vpc.devopsacademy_iac: Refreshing state... [id=vpc-01db44ee07eadbbd6]
aws_eip.c04_iac02_eip: Refreshing state... [id=eipalloc-06a7c966d124cba3b]
data.aws_availability_zones.az_available: Reading...
data.aws_availability_zones.az_available: Read complete after 0s [id=ap-southeast-2]
aws_subnet.c04_iac02_public_1: Refreshing state... [id=subnet-0ce4ccdbc4351eed5]
aws_subnet.c04_iac02_private_2: Refreshing state... [id=subnet-013d0f5a9b881aa08]
aws_subnet.c04_iac02_private_1: Refreshing state... [id=subnet-05591921795c19899]
aws_internet_gateway.c04_iac02_igw: Refreshing state... [id=igw-0283f15e031a9f152]
aws_subnet.c04_iac02_public_2: Refreshing state... [id=subnet-05bad57e1fb1f6604]
aws_route_table.c04_iac02_rt_public: Refreshing state... [id=rtb-01b57e1e900056930]
aws_nat_gateway.c04_iac02_ngw: Refreshing state... [id=nat-0d7e8bfd72b372f9d]
aws_route_table.c04_iac02_rt_private: Refreshing state... [id=rtb-0493ed9316e7b6643]
aws_route_table_association.c04_iac02_rt_assoc_public_2: Refreshing state... [id=rtbassoc-0bffb86f3ec25c182]
aws_route_table_association.c04_iac02_rt_assoc_public_1: Refreshing state... [id=rtbassoc-0ffb127f7d5e567ab]
aws_route_table_association.c04_iac02_rt_assoc_private_1: Refreshing state... [id=rtbassoc-03d08f5bc27e14886]
aws_route_table_association.c04_iac02_rt_assoc_private_2: Refreshing state... [id=rtbassoc-04566f9e140992541]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_internet_gateway.c04_iac02_igw will be updated in-place
  ~ resource "aws_internet_gateway" "c04_iac02_igw" {
        id       = "igw-0283f15e031a9f152"
        tags     = {
            "Name" = "c04-iac02-igw"
        }
      ~ vpc_id   = "vpc-01db44ee07eadbbd6" -> (known after apply)
        # (3 unchanged attributes hidden)
    }

  # aws_nat_gateway.c04_iac02_ngw must be replaced
-/+ resource "aws_nat_gateway" "c04_iac02_ngw" {
      ~ id                   = "nat-0d7e8bfd72b372f9d" -> (known after apply)
      ~ network_interface_id = "eni-0171333842d7af3cf" -> (known after apply)
      ~ private_ip           = "10.0.1.135" -> (known after apply)
      ~ public_ip            = "52.65.77.141" -> (known after apply)
      ~ subnet_id            = "subnet-0ce4ccdbc4351eed5" -> (known after apply) # forces replacement
        tags                 = {
            "Name" = "c04-iac02-ngw"
        }
        # (3 unchanged attributes hidden)
    }

  # aws_route_table.c04_iac02_rt_private must be replaced
-/+ resource "aws_route_table" "c04_iac02_rt_private" {
      ~ arn              = "arn:aws:ec2:ap-southeast-2:191273369808:route-table/rtb-0493ed9316e7b6643" -> (known after apply)
      ~ id               = "rtb-0493ed9316e7b6643" -> (known after apply)
      ~ owner_id         = "191273369808" -> (known after apply)
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
              - nat_gateway_id             = "nat-0d7e8bfd72b372f9d"
              - network_interface_id       = ""
              - transit_gateway_id         = ""
              - vpc_endpoint_id            = ""
              - vpc_peering_connection_id  = ""
            },
            # (1 unchanged element hidden)
        ]
        tags             = {
            "Name" = "c04-iac02-rt-private"
        }
      ~ vpc_id           = "vpc-01db44ee07eadbbd6" -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # aws_route_table.c04_iac02_rt_public must be replaced
-/+ resource "aws_route_table" "c04_iac02_rt_public" {
      ~ arn              = "arn:aws:ec2:ap-southeast-2:191273369808:route-table/rtb-01b57e1e900056930" -> (known after apply)
      ~ id               = "rtb-01b57e1e900056930" -> (known after apply)
      ~ owner_id         = "191273369808" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
        tags             = {
            "Name" = "c04-iac02-rt-public"
        }
      ~ vpc_id           = "vpc-01db44ee07eadbbd6" -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # aws_route_table_association.c04_iac02_rt_assoc_private_1 must be replaced
-/+ resource "aws_route_table_association" "c04_iac02_rt_assoc_private_1" {
      ~ id             = "rtbassoc-03d08f5bc27e14886" -> (known after apply)
      ~ route_table_id = "rtb-0493ed9316e7b6643" -> (known after apply)
      ~ subnet_id      = "subnet-05591921795c19899" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.c04_iac02_rt_assoc_private_2 must be replaced
-/+ resource "aws_route_table_association" "c04_iac02_rt_assoc_private_2" {
      ~ id             = "rtbassoc-04566f9e140992541" -> (known after apply)
      ~ route_table_id = "rtb-0493ed9316e7b6643" -> (known after apply)
      ~ subnet_id      = "subnet-013d0f5a9b881aa08" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.c04_iac02_rt_assoc_public_1 must be replaced
-/+ resource "aws_route_table_association" "c04_iac02_rt_assoc_public_1" {
      ~ id             = "rtbassoc-0ffb127f7d5e567ab" -> (known after apply)
      ~ route_table_id = "rtb-01b57e1e900056930" -> (known after apply)
      ~ subnet_id      = "subnet-0ce4ccdbc4351eed5" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.c04_iac02_rt_assoc_public_2 must be replaced
-/+ resource "aws_route_table_association" "c04_iac02_rt_assoc_public_2" {
      ~ id             = "rtbassoc-0bffb86f3ec25c182" -> (known after apply)
      ~ route_table_id = "rtb-01b57e1e900056930" -> (known after apply)
      ~ subnet_id      = "subnet-05bad57e1fb1f6604" -> (known after apply) # forces replacement
    }

  # aws_subnet.c04_iac02_private_1 must be replaced
-/+ resource "aws_subnet" "c04_iac02_private_1" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:191273369808:subnet/subnet-05591921795c19899" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az3" -> (known after apply)
      ~ cidr_block                                     = "10.0.3.0/24" -> "10.24.3.0/24" # forces replacement
      ~ id                                             = "subnet-05591921795c19899" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "191273369808" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "devopsacademy-iac-private-1"
        }
      ~ vpc_id                                         = "vpc-01db44ee07eadbbd6" -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # aws_subnet.c04_iac02_private_2 must be replaced
-/+ resource "aws_subnet" "c04_iac02_private_2" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:191273369808:subnet/subnet-013d0f5a9b881aa08" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az1" -> (known after apply)
      ~ id                                             = "subnet-013d0f5a9b881aa08" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "191273369808" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "10.0.4.0/24"
        }
      ~ vpc_id                                         = "vpc-01db44ee07eadbbd6" -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # aws_subnet.c04_iac02_public_1 must be replaced
-/+ resource "aws_subnet" "c04_iac02_public_1" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:191273369808:subnet/subnet-0ce4ccdbc4351eed5" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az3" -> (known after apply)
      ~ cidr_block                                     = "10.0.1.0/24" -> "10.24.1.0/24" # forces replacement
      ~ id                                             = "subnet-0ce4ccdbc4351eed5" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "191273369808" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "devopsacademy-iac-public-1"
        }
      ~ vpc_id                                         = "vpc-01db44ee07eadbbd6" -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # aws_subnet.c04_iac02_public_2 must be replaced
-/+ resource "aws_subnet" "c04_iac02_public_2" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:191273369808:subnet/subnet-05bad57e1fb1f6604" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az1" -> (known after apply)
      ~ id                                             = "subnet-05bad57e1fb1f6604" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "191273369808" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
      ~ tags                                           = {
          ~ "Name" = "devopsacademy-iac-public-2" -> "devopsacademy-iac-public-2b"
        }
      ~ tags_all                                       = {
          ~ "Name" = "devopsacademy-iac-public-2" -> "devopsacademy-iac-public-2b"
        }
      ~ vpc_id                                         = "vpc-01db44ee07eadbbd6" -> (known after apply) # forces replacement
        # (8 unchanged attributes hidden)
    }

  # aws_vpc.devopsacademy_iac must be replaced
-/+ resource "aws_vpc" "devopsacademy_iac" {
      ~ arn                                  = "arn:aws:ec2:ap-southeast-2:191273369808:vpc/vpc-01db44ee07eadbbd6" -> (known after apply)
      - assign_generated_ipv6_cidr_block     = false -> null
      ~ cidr_block                           = "10.0.0.0/16" -> "10.24.0.0/16" # forces replacement
      ~ default_network_acl_id               = "acl-046f3c7771e764774" -> (known after apply)
      ~ default_route_table_id               = "rtb-00da1c5a9b11d61e1" -> (known after apply)
      ~ default_security_group_id            = "sg-0c88a62a88e78d2ca" -> (known after apply)
      ~ dhcp_options_id                      = "dopt-0e9947a94e89fda25" -> (known after apply)
      ~ enable_classiclink                   = false -> (known after apply)
      ~ enable_classiclink_dns_support       = false -> (known after apply)
      ~ id                                   = "vpc-01db44ee07eadbbd6" -> (known after apply)
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      - ipv6_netmask_length                  = 0 -> null
      ~ main_route_table_id                  = "rtb-00da1c5a9b11d61e1" -> (known after apply)
      ~ owner_id                             = "191273369808" -> (known after apply)
        tags                                 = {
            "Name" = "devopsacademy-iac"
        }
        # (4 unchanged attributes hidden)
    }

Plan: 12 to add, 1 to change, 12 to destroy.

Changes to Outputs:
  ~ c04_iac02_subnets = {
      ~ private = [
          - "10.0.3.0/24",
          + "10.24.3.0/24",
            "10.0.4.0/24",
        ]
      ~ public  = [
          - "10.0.1.0/24",
          + "10.24.1.0/24",
            "10.0.2.0/24",
        ]
    }
  ~ c04_iac02_vpc     = "10.0.0.0/16" -> "10.24.0.0/16"
╷
│ Warning: Version constraints inside provider configuration blocks are deprecated
│ 
│   on _provider.tf line 2, in provider "aws":
│    2:   version = "~> 4.0"
│ 
│ Terraform 0.13 and earlier allowed provider version constraints inside the provider configuration block, but that is now deprecated and will be removed in a future version of Terraform. To silence this
│ warning, move the provider version constraint into the required_providers block.
╵

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
```

***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/7c4bce633a38e1c65066fdb6544df45cd1dc06ee/classes/04class/exercises/c04-iac03/README.md)
