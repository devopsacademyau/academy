# C04-IAC03

- Why changing the VPC CIDR led to replacing multiple resources?

Most other resources are dependent on the VPC resource. When the VPC CIDR was changed, it forced replacement of the VPC, meaning all other resources also had to be replaced. 


## Terraform plan output

```sh
➜  chisholm-ray terraform plan -var-file=main.tfvars
aws_vpc.main: Refreshing state... [id=vpc-069c6bf31e7b4c70f]
aws_internet_gateway.public: Refreshing state... [id=igw-0fb258b246c4e0a94]
aws_subnet.public_1: Refreshing state... [id=subnet-046bb845dd11104f3]
aws_subnet.public_2: Refreshing state... [id=subnet-009431a8ce8da0cb4]
aws_subnet.private_1: Refreshing state... [id=subnet-02594fc3ac477d860]
aws_subnet.private_2: Refreshing state... [id=subnet-0919af307337dc191]
aws_route_table.private: Refreshing state... [id=rtb-004a9e44e066ef6e8]
aws_route_table.public: Refreshing state... [id=rtb-01275e23bf458e030]
aws_route_table_association.public_2: Refreshing state... [id=rtbassoc-0375eda111e11d47a]
aws_route_table_association.public_1: Refreshing state... [id=rtbassoc-0b2354eeb97d389fa]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply":

  # aws_internet_gateway.public has changed
  ~ resource "aws_internet_gateway" "public" {
        id       = "igw-0fb258b246c4e0a94"
      + tags     = {}
        # (4 unchanged attributes hidden)
    }

  # aws_route_table.private has changed
  ~ resource "aws_route_table" "private" {
      + arn              = "arn:aws:ec2:ap-southeast-2:152848913167:route-table/rtb-004a9e44e066ef6e8"
        id               = "rtb-004a9e44e066ef6e8"
      + owner_id         = "152848913167"
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
              - nat_gateway_id             = ""
              - network_interface_id       = ""
              - transit_gateway_id         = ""
              - vpc_endpoint_id            = ""
              - vpc_peering_connection_id  = ""
            },
        ]
        tags             = {
            "Name" = "CCR-Private-routeTable"
            "Type" = "Private"
        }
        # (3 unchanged attributes hidden)
    }


Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes, the following plan may include actions to undo or respond to these changes.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_internet_gateway.public will be updated in-place
  ~ resource "aws_internet_gateway" "public" {
        id       = "igw-0fb258b246c4e0a94"
        tags     = {}
      ~ vpc_id   = "vpc-069c6bf31e7b4c70f" -> (known after apply)
        # (3 unchanged attributes hidden)
    }

  # aws_route_table.private is tainted, so must be replaced
-/+ resource "aws_route_table" "private" {
      ~ arn              = "arn:aws:ec2:ap-southeast-2:152848913167:route-table/rtb-004a9e44e066ef6e8" -> (known after apply)
      ~ id               = "rtb-004a9e44e066ef6e8" -> (known after apply)
      ~ owner_id         = "152848913167" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
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
              + nat_gateway_id             = ""
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
        ]
        tags             = {
            "Name" = "CCR-Private-routeTable"
            "Type" = "Private"
        }
      ~ vpc_id           = "vpc-069c6bf31e7b4c70f" -> (known after apply)
        # (1 unchanged attribute hidden)
    }

  # aws_route_table.public must be replaced
-/+ resource "aws_route_table" "public" {
      ~ arn              = "arn:aws:ec2:ap-southeast-2:152848913167:route-table/rtb-01275e23bf458e030" -> (known after apply)
      ~ id               = "rtb-01275e23bf458e030" -> (known after apply)
      ~ owner_id         = "152848913167" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
        tags             = {
            "Name" = "CCR-Public-ALL-routeTable"
            "Type" = "Public"
        }
      ~ vpc_id           = "vpc-069c6bf31e7b4c70f" -> (known after apply) # forces replacement
        # (2 unchanged attributes hidden)
    }

  # aws_route_table_association.private_1 will be created
  + resource "aws_route_table_association" "private_1" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.private_2 will be created
  + resource "aws_route_table_association" "private_2" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.public_1 must be replaced
-/+ resource "aws_route_table_association" "public_1" {
      ~ id             = "rtbassoc-0b2354eeb97d389fa" -> (known after apply)
      ~ route_table_id = "rtb-01275e23bf458e030" -> (known after apply)
      ~ subnet_id      = "subnet-046bb845dd11104f3" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public_2 must be replaced
-/+ resource "aws_route_table_association" "public_2" {
      ~ id             = "rtbassoc-0375eda111e11d47a" -> (known after apply)
      ~ route_table_id = "rtb-01275e23bf458e030" -> (known after apply)
      ~ subnet_id      = "subnet-009431a8ce8da0cb4" -> (known after apply) # forces replacement
    }

  # aws_subnet.private_1 must be replaced
-/+ resource "aws_subnet" "private_1" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-02594fc3ac477d860" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az3" -> (known after apply)
      ~ id                                             = "subnet-02594fc3ac477d860" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "subnet_1_priv-ccr"
            "Type" = "Private"
        }
      ~ vpc_id                                         = "vpc-069c6bf31e7b4c70f" -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # aws_subnet.private_2 must be replaced
-/+ resource "aws_subnet" "private_2" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-0919af307337dc191" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az1" -> (known after apply)
      ~ id                                             = "subnet-0919af307337dc191" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "subnet_1_priv-ccr"
            "Type" = "Private"
        }
      ~ vpc_id                                         = "vpc-069c6bf31e7b4c70f" -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # aws_subnet.public_1 must be replaced
-/+ resource "aws_subnet" "public_1" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-046bb845dd11104f3" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az3" -> (known after apply)
      ~ id                                             = "subnet-046bb845dd11104f3" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "subnet_1_pub-ccr"
            "Type" = "Private"
        }
      ~ vpc_id                                         = "vpc-069c6bf31e7b4c70f" -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # aws_subnet.public_2 must be replaced
-/+ resource "aws_subnet" "public_2" {
      ~ arn                                            = "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-009431a8ce8da0cb4" -> (known after apply)
      ~ availability_zone_id                           = "apse2-az1" -> (known after apply)
      ~ id                                             = "subnet-009431a8ce8da0cb4" -> (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      - map_customer_owned_ip_on_launch                = false -> null
      ~ owner_id                                       = "152848913167" -> (known after apply)
      ~ private_dns_hostname_type_on_launch            = "ip-name" -> (known after apply)
        tags                                           = {
            "Name" = "subnet_1_pub-ccr"
            "Type" = "Private"
        }
      ~ vpc_id                                         = "vpc-069c6bf31e7b4c70f" -> (known after apply) # forces replacement
        # (9 unchanged attributes hidden)
    }

  # aws_vpc.main must be replaced
-/+ resource "aws_vpc" "main" {
      ~ arn                                  = "arn:aws:ec2:ap-southeast-2:152848913167:vpc/vpc-069c6bf31e7b4c70f" -> (known after apply)
      - assign_generated_ipv6_cidr_block     = false -> null
      ~ cidr_block                           = "10.0.0.0/16" -> "10.1.0.0/16" # forces replacement
      ~ default_network_acl_id               = "acl-0ad07bd78ee8b1612" -> (known after apply)
      ~ default_route_table_id               = "rtb-09b94fc089694bde0" -> (known after apply)
      ~ default_security_group_id            = "sg-090214c194112200d" -> (known after apply)
      ~ dhcp_options_id                      = "dopt-3f26dd58" -> (known after apply)
      ~ enable_classiclink                   = false -> (known after apply)
      ~ enable_classiclink_dns_support       = false -> (known after apply)
      ~ enable_dns_hostnames                 = false -> (known after apply)
      ~ id                                   = "vpc-069c6bf31e7b4c70f" -> (known after apply)
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      - ipv6_netmask_length                  = 0 -> null
      ~ main_route_table_id                  = "rtb-09b94fc089694bde0" -> (known after apply)
      ~ owner_id                             = "152848913167" -> (known after apply)
        tags                                 = {
            "Name" = "devopsacademy-iac-ccr"
        }
        # (3 unchanged attributes hidden)
    }

Plan: 11 to add, 1 to change, 9 to destroy.

Changes to Outputs:
  ~ ccr_vpc_cidr = "10.0.0.0/16" -> "10.1.0.0/16"

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/7c4bce633a38e1c65066fdb6544df45cd1dc06ee/classes/04class/exercises/c04-iac03/README.md)
