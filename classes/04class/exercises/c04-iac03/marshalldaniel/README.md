# C04-IAC03

- Why changing the VPC CIDR led to replacing multiple resources?

> A subnet cannot have it's CIDR block modified, it must be deleted and then a new one created.


## Terraform plan output

```sh
aws_eip.natgw-eip-marshalldaniel: Refreshing state... [id=eipalloc-0d716c1493d88241a]
aws_vpc.devopsacademy-iac: Refreshing state... [id=vpc-0b769e163eb430b7e]
aws_internet_gateway.igw-marshalldaniel: Refreshing state... [id=igw-0c1b01f9fb6dc77ab]
aws_subnet.public-subnet01: Refreshing state... [id=subnet-09a11a6d4e6c06df1]
aws_subnet.private-subnet02: Refreshing state... [id=subnet-0f38ed6100c839a61]
aws_subnet.public-subnet02: Refreshing state... [id=subnet-06d216759bd0caf2c]
aws_subnet.private-subnet01: Refreshing state... [id=subnet-0b986cefe60adfced]
aws_route_table.public_rt: Refreshing state... [id=rtb-09cc4a68e5253b1bc]
aws_nat_gateway.natgw-marshalldaniel: Refreshing state... [id=nat-03b5000614ab0a9c2]
aws_route_table_association.b: Refreshing state... [id=rtbassoc-093c7c37003baf5e8]
aws_route_table_association.a: Refreshing state... [id=rtbassoc-0680c0c94adeefbd7]
aws_route_table.private_rt: Refreshing state... [id=rtb-0374dc91bca8ed3c0]
aws_route_table_association.c: Refreshing state... [id=rtbassoc-076a6d1656cd532e6]
aws_route_table_association.d: Refreshing state... [id=rtbassoc-076a6d1656cd532e6]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the
last "terraform apply":

  # aws_eip.natgw-eip-marshalldaniel has changed
  ~ resource "aws_eip" "natgw-eip-marshalldaniel" {
      + association_id       = "eipassoc-0f168c04f8df0d034"
        id                   = "eipalloc-0d716c1493d88241a"
      + network_interface    = "eni-04fdbecfb16381ee3"
      + private_dns          = "ip-10-0-0-254.ap-southeast-1.compute.internal"
      + private_ip           = "10.0.0.254"
      + tags                 = {}
        # (8 unchanged attributes hidden)
    }

  # aws_route_table.private_rt has changed
  ~ resource "aws_route_table" "private_rt" {
        id               = "rtb-0374dc91bca8ed3c0"
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
              + nat_gateway_id             = "nat-03b5000614ab0a9c2"
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
              - gateway_id                 = "nat-03b5000614ab0a9c2"
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
            "Name" = "private-rt"
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

  # aws_nat_gateway.natgw-marshalldaniel must be replaced
-/+ resource "aws_nat_gateway" "natgw-marshalldaniel" {
      ~ id                   = "nat-03b5000614ab0a9c2" -> (known after apply)
      ~ network_interface_id = "eni-04fdbecfb16381ee3" -> (known after apply)
      ~ private_ip           = "10.0.0.254" -> (known after apply)
      ~ public_ip            = "13.214.251.73" -> (known after apply)
      ~ subnet_id            = "subnet-09a11a6d4e6c06df1" -> (known after apply) # forces replacement
        tags                 = {
            "Name" = "natgw-marshalldaniel"
        }
        # (3 unchanged attributes hidden)
    }

  # aws_route_table.private_rt will be updated in-place
  ~ resource "aws_route_table" "private_rt" {
        id               = "rtb-0374dc91bca8ed3c0"
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
              - nat_gateway_id             = "nat-03b5000614ab0a9c2"
              - network_interface_id       = ""
              - transit_gateway_id         = ""
              - vpc_endpoint_id            = ""
              - vpc_peering_connection_id  = ""
            },
            # (1 unchanged element hidden)
        ]
        tags             = {
            "Name" = "private-rt"
        }
        # (5 unchanged attributes hidden)
    }

  # aws_route_table_association.a must be replaced
-/+ resource "aws_route_table_association" "a" {
      ~ id             = "rtbassoc-0680c0c94adeefbd7" -> (known after apply)
      ~ subnet_id      = "subnet-09a11a6d4e6c06df1" -> (known after apply) # forces replacement
        # (1 unchanged attribute hidden)
    }

  # aws_subnet.public-subnet01 must be replaced
-/+ resource "aws_subnet" "public-subnet01" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-1:152848913167:subnet/subnet-09a11a6d4e6c06df1" -> (known after apply)
      ~ availability_zone                              = "ap-southeast-1a" -> (known after apply)
      ~ availability_zone_id                           = "apse1-az1" -> (known after apply)
      ~ cidr_block                                     = "10.0.0.0/24" -> "10.0.4.0/24" # forces replacement
      ~ id                                             = "subnet-09a11a6d4e6c06df1" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "public-subnet-01"
        }
        # (8 unchanged attributes hidden)
    }

  # aws_subnet.public-subnet02 will be updated in-place
  ~ resource "aws_subnet" "public-subnet02" {
        id                                             = "subnet-06d216759bd0caf2c"
      ~ tags                                           = {
          ~ "Name" = "public-subnet-02" -> "public-subnet-02-other-name"
        }
      ~ tags_all                                       = {
          ~ "Name" = "public-subnet-02" -> "public-subnet-02-other-name"
        }
        # (14 unchanged attributes hidden)
    }

Plan: 3 to add, 2 to change, 3 to destroy.

Changes to Outputs:
  ~ public-subnet01_cidr = "10.0.0.0/24" -> "10.0.4.0/24"

─────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/7c4bce633a38e1c65066fdb6544df45cd1dc06ee/classes/04class/exercises/c04-iac03/README.md)
