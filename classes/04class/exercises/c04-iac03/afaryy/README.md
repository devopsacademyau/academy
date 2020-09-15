# C04-IAC03

- Why changing the VPC CIDR led to replacing multiple resources?

> After changing VPC CIDR and then subnets CIDR, relative resources invoving changed CIDR will be destroyed and recreated and also other resources associated with these resources will be replaced except internet_gateway which will be updated vcp_id. 


## Terraform plan output

```sh
## changes:
changed project_name -> changing tags.name of relative resources including subnets names
changed vpc cidr 
changed subnets cidr
## output here
[yvonne@centos8 afaryy]$ terraform plan -var-file=./main.tfvars
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

aws_eip.nat: Refreshing state... [id=eipalloc-01f1353e276656d03]
aws_vpc.main: Refreshing state... [id=vpc-0fb067e2ade8cfba2]
aws_subnet.main-private["private_subnet_a"]: Refreshing state... [id=subnet-064e2c16d6e3de2ae]
aws_subnet.main-private["private_subnet_b"]: Refreshing state... [id=subnet-00d783a5ead2f1141]
aws_subnet.main-public["public_subnet_a"]: Refreshing state... [id=subnet-09e10ba58173fefdf]
aws_internet_gateway.main-gw: Refreshing state... [id=igw-01c66a7618f0ce314]
aws_subnet.main-public["public_subnet_b"]: Refreshing state... [id=subnet-0ea9733684650213d]
aws_route_table.main-public: Refreshing state... [id=rtb-0ab5b106d98ad448f]
aws_nat_gateway.nat-gw: Refreshing state... [id=nat-0faf8def74cf041be]
aws_route_table.main-private: Refreshing state... [id=rtb-0db5edb1e4d40a5db]
aws_route_table_association.main-public["public_subnet_a"]: Refreshing state... [id=rtbassoc-0b204b7d12c369289]
aws_route_table_association.main-public["public_subnet_b"]: Refreshing state... [id=rtbassoc-0184e3219bf006038]
aws_route_table_association.main-private["private_subnet_a"]: Refreshing state... [id=rtbassoc-0abe6b62f770bb77b]
aws_route_table_association.main-private["private_subnet_b"]: Refreshing state... [id=rtbassoc-072f2d6d58d84b527]

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_internet_gateway.main-gw will be updated in-place
  ~ resource "aws_internet_gateway" "main-gw" {
        arn      = "arn:aws:ec2:ap-southeast-2:421117346104:internet-gateway/igw-01c66a7618f0ce314"
        id       = "igw-01c66a7618f0ce314"
        owner_id = "421117346104"
      ~ tags     = {
          ~ "Name" = "da-c04-iac02-gw" -> "da-c04-iac03-gw"
        }
      ~ vpc_id   = "vpc-0fb067e2ade8cfba2" -> (known after apply)
    }

  # aws_nat_gateway.nat-gw must be replaced
-/+ resource "aws_nat_gateway" "nat-gw" {
        allocation_id        = "eipalloc-01f1353e276656d03"
      ~ id                   = "nat-0faf8def74cf041be" -> (known after apply)
      ~ network_interface_id = "eni-078dc1457358b22e9" -> (known after apply)
      ~ private_ip           = "10.0.11.102" -> (known after apply)
      ~ public_ip            = "54.79.75.48" -> (known after apply)
      ~ subnet_id            = "subnet-064e2c16d6e3de2ae" -> (known after apply) # forces replacement
      ~ tags                 = {
          ~ "Name" = "da-c04-iac02-nat-gw" -> "da-c04-iac03-nat-gw"
        }
    }

  # aws_route_table.main-private must be replaced
-/+ resource "aws_route_table" "main-private" {
      ~ id               = "rtb-0db5edb1e4d40a5db" -> (known after apply)
      ~ owner_id         = "421117346104" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      ~ route            = [
          - {
              - cidr_block                = "0.0.0.0/0"
              - egress_only_gateway_id    = ""
              - gateway_id                = ""
              - instance_id               = ""
              - ipv6_cidr_block           = ""
              - local_gateway_id          = ""
              - nat_gateway_id            = "nat-0faf8def74cf041be"
              - network_interface_id      = ""
              - transit_gateway_id        = ""
              - vpc_peering_connection_id = ""
            },
            {
                cidr_block                = "0.0.0.0/0"
                egress_only_gateway_id    = ""
                gateway_id                = ""
                instance_id               = ""
                ipv6_cidr_block           = ""
                local_gateway_id          = ""
                nat_gateway_id            = (known after apply)
                network_interface_id      = ""
                transit_gateway_id        = ""
                vpc_peering_connection_id = ""
            },
        ]
      ~ tags             = {
          ~ "Name" = "da-c04-iac02-rt-private" -> "da-c04-iac03-rt-private"
        }
      ~ vpc_id           = "vpc-0fb067e2ade8cfba2" -> (known after apply) # forces replacement
    }

  # aws_route_table.main-public must be replaced
-/+ resource "aws_route_table" "main-public" {
      ~ id               = "rtb-0ab5b106d98ad448f" -> (known after apply)
      ~ owner_id         = "421117346104" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
        route            = [
            {
                cidr_block                = "0.0.0.0/0"
                egress_only_gateway_id    = ""
                gateway_id                = "igw-01c66a7618f0ce314"
                instance_id               = ""
                ipv6_cidr_block           = ""
                local_gateway_id          = ""
                nat_gateway_id            = ""
                network_interface_id      = ""
                transit_gateway_id        = ""
                vpc_peering_connection_id = ""
            },
        ]
      ~ tags             = {
          ~ "Name" = "da-c04-iac02-rt-public" -> "da-c04-iac03-rt-public"
        }
      ~ vpc_id           = "vpc-0fb067e2ade8cfba2" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.main-private["private_subnet_a"] must be replaced
-/+ resource "aws_route_table_association" "main-private" {
      ~ id             = "rtbassoc-0abe6b62f770bb77b" -> (known after apply)
      ~ route_table_id = "rtb-0db5edb1e4d40a5db" -> (known after apply)
      ~ subnet_id      = "subnet-064e2c16d6e3de2ae" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.main-private["private_subnet_b"] must be replaced
-/+ resource "aws_route_table_association" "main-private" {
      ~ id             = "rtbassoc-072f2d6d58d84b527" -> (known after apply)
      ~ route_table_id = "rtb-0db5edb1e4d40a5db" -> (known after apply)
      ~ subnet_id      = "subnet-00d783a5ead2f1141" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.main-public["public_subnet_a"] must be replaced
-/+ resource "aws_route_table_association" "main-public" {
      ~ id             = "rtbassoc-0b204b7d12c369289" -> (known after apply)
      ~ route_table_id = "rtb-0ab5b106d98ad448f" -> (known after apply)
      ~ subnet_id      = "subnet-09e10ba58173fefdf" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.main-public["public_subnet_b"] must be replaced
-/+ resource "aws_route_table_association" "main-public" {
      ~ id             = "rtbassoc-0184e3219bf006038" -> (known after apply)
      ~ route_table_id = "rtb-0ab5b106d98ad448f" -> (known after apply)
      ~ subnet_id      = "subnet-0ea9733684650213d" -> (known after apply) # forces replacement
    }

  # aws_subnet.main-private["private_subnet_a"] must be replaced
-/+ resource "aws_subnet" "main-private" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:421117346104:subnet/subnet-064e2c16d6e3de2ae" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az3" -> (known after apply)
      ~ cidr_block                      = "10.0.11.0/24" -> "10.18.11.0/24" # forces replacement
      ~ id                              = "subnet-064e2c16d6e3de2ae" -> (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = true
      ~ owner_id                        = "421117346104" -> (known after apply)
      ~ tags                            = {
          ~ "Name" = "da-c04-iac02-private_subnet_a" -> "da-c04-iac03-private_subnet_a"
        }
      ~ vpc_id                          = "vpc-0fb067e2ade8cfba2" -> (known after apply) # forces replacement
    }

  # aws_subnet.main-private["private_subnet_b"] must be replaced
-/+ resource "aws_subnet" "main-private" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:421117346104:subnet/subnet-00d783a5ead2f1141" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2b"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
      ~ cidr_block                      = "10.0.22.0/24" -> "10.18.22.0/24" # forces replacement
      ~ id                              = "subnet-00d783a5ead2f1141" -> (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = true
      ~ owner_id                        = "421117346104" -> (known after apply)
      ~ tags                            = {
          ~ "Name" = "da-c04-iac02-private_subnet_b" -> "da-c04-iac03-private_subnet_b"
        }
      ~ vpc_id                          = "vpc-0fb067e2ade8cfba2" -> (known after apply) # forces replacement
    }

  # aws_subnet.main-public["public_subnet_a"] must be replaced
-/+ resource "aws_subnet" "main-public" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:421117346104:subnet/subnet-09e10ba58173fefdf" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az3" -> (known after apply)
      ~ cidr_block                      = "10.0.1.0/24" -> "10.18.1.0/24" # forces replacement
      ~ id                              = "subnet-09e10ba58173fefdf" -> (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = true
      ~ owner_id                        = "421117346104" -> (known after apply)
      ~ tags                            = {
          ~ "Name" = "da-c04-iac02-public_subnet_a" -> "da-c04-iac03-public_subnet_a"
        }
      ~ vpc_id                          = "vpc-0fb067e2ade8cfba2" -> (known after apply) # forces replacement
    }

  # aws_subnet.main-public["public_subnet_b"] must be replaced
-/+ resource "aws_subnet" "main-public" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:421117346104:subnet/subnet-0ea9733684650213d" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2b"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
      ~ cidr_block                      = "10.0.2.0/24" -> "10.18.2.0/24" # forces replacement
      ~ id                              = "subnet-0ea9733684650213d" -> (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = true
      ~ owner_id                        = "421117346104" -> (known after apply)
      ~ tags                            = {
          ~ "Name" = "da-c04-iac02-public_subnet_b" -> "da-c04-iac03-public_subnet_b"
        }
      ~ vpc_id                          = "vpc-0fb067e2ade8cfba2" -> (known after apply) # forces replacement
    }

  # aws_vpc.main must be replaced
-/+ resource "aws_vpc" "main" {
      ~ arn                              = "arn:aws:ec2:ap-southeast-2:421117346104:vpc/vpc-0fb067e2ade8cfba2" -> (known after apply)
        assign_generated_ipv6_cidr_block = false
      ~ cidr_block                       = "10.0.0.0/16" -> "10.18.0.0/16" # forces replacement
      ~ default_network_acl_id           = "acl-0ee8f5dda39c57a7e" -> (known after apply)
      ~ default_route_table_id           = "rtb-032e4ac93453209e6" -> (known after apply)
      ~ default_security_group_id        = "sg-0dd7105782410fc3f" -> (known after apply)
      ~ dhcp_options_id                  = "dopt-5b144a3c" -> (known after apply)
        enable_classiclink               = false
      ~ enable_classiclink_dns_support   = false -> (known after apply)
        enable_dns_hostnames             = true
        enable_dns_support               = true
      ~ id                               = "vpc-0fb067e2ade8cfba2" -> (known after apply)
        instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      ~ main_route_table_id              = "rtb-032e4ac93453209e6" -> (known after apply)
      ~ owner_id                         = "421117346104" -> (known after apply)
      ~ tags                             = {
          ~ "Name" = "da-c04-iac02-vpc" -> "da-c04-iac03-vpc"
        }
    }

Plan: 12 to add, 1 to change, 12 to destroy.

Changes to Outputs:
  ~ private_subnets = {
      - subnet-00d783a5ead2f1141 = {
          - availability_zone = "ap-southeast-2b"
          - cidr_block        = "10.0.22.0/24"
          - name              = "da-c04-iac02-private_subnet_b"
        }
      - subnet-064e2c16d6e3de2ae = {
          - availability_zone = "ap-southeast-2a"
          - cidr_block        = "10.0.11.0/24"
          - name              = "da-c04-iac02-private_subnet_a"
        }
    } -> (known after apply)
  ~ public_subnets  = {
      - subnet-09e10ba58173fefdf = {
          - availability_zone = "ap-southeast-2a"
          - cidr_block        = "10.0.1.0/24"
          - name              = "da-c04-iac02-public_subnet_a"
        }
      - subnet-0ea9733684650213d = {
          - availability_zone = "ap-southeast-2b"
          - cidr_block        = "10.0.2.0/24"
          - name              = "da-c04-iac02-public_subnet_b"
        }
    } -> (known after apply)
  ~ vpc_cidr        = "10.0.0.0/16" -> "10.18.0.0/16"

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.


```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/7c4bce633a38e1c65066fdb6544df45cd1dc06ee/classes/04class/exercises/c04-iac03/README.md)
