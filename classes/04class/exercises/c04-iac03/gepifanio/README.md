# C04-IAC03

## Terraform plan output

terraform plan -var-file=./main.tfvars -out test.txt
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

aws_eip.lb: Refreshing state... [id=eipalloc-0322faf34f2133cc7]
aws_vpc.vpc_iac: Refreshing state... [id=vpc-00a3251ed3fde2470]
aws_subnet.subnet_1_private: Refreshing state... [id=subnet-0abb0a1b662de30ca]
aws_subnet.subnet_2_private: Refreshing state... [id=subnet-049e335b60b1f543b]
aws_internet_gateway.igw: Refreshing state... [id=igw-021f1cb6e1623ace6]
aws_subnet.subnet_3_public: Refreshing state... [id=subnet-0edbe629d1f3ddc9c]
aws_subnet.subnet_4_public: Refreshing state... [id=subnet-02369fc0e8cb274e6]
aws_route_table.route_table_public: Refreshing state... [id=rtb-0d31e670db937dca5]
aws_nat_gateway.ngw: Refreshing state... [id=nat-06b650370c2b8ce18]
aws_route_table_association.public-a: Refreshing state... [id=rtbassoc-0e794a0f9cf8587bd]
aws_route_table_association.public-b: Refreshing state... [id=rtbassoc-0d7367759e2d09208]
aws_route_table.route_table_private: Refreshing state... [id=rtb-08f8e7f209330cdfe]
aws_route_table_association.private-a: Refreshing state... [id=rtbassoc-03c088cbc3f5b3489]
aws_route_table_association.private-b: Refreshing state... [id=rtbassoc-0a2755e8a40bdce2f]

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_internet_gateway.igw will be updated in-place
  ~ resource "aws_internet_gateway" "igw" {
        arn      = "arn:aws:ec2:ap-southeast-2:873547843801:internet-gateway/igw-021f1cb6e1623ace6"
        id       = "igw-021f1cb6e1623ace6"
        owner_id = "873547843801"
        tags     = {
            "Name" = "igw-iac"
        }
      ~ vpc_id   = "vpc-00a3251ed3fde2470" -> (known after apply)
    }

  # aws_nat_gateway.ngw must be replaced
-/+ resource "aws_nat_gateway" "ngw" {
        allocation_id        = "eipalloc-0322faf34f2133cc7"
      ~ id                   = "nat-06b650370c2b8ce18" -> (known after apply)
      ~ network_interface_id = "eni-03add605cd02ba997" -> (known after apply)
      ~ private_ip           = "10.0.5.127" -> (known after apply)
      ~ public_ip            = "13.236.218.148" -> (known after apply)
      ~ subnet_id            = "subnet-0abb0a1b662de30ca" -> (known after apply) # forces replacement
        tags                 = {
            "Name" = "ngw-iac"
        }
    }

  # aws_route_table.route_table_private must be replaced
-/+ resource "aws_route_table" "route_table_private" {
      ~ id               = "rtb-08f8e7f209330cdfe" -> (known after apply)
      ~ owner_id         = "873547843801" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      ~ route            = [
          - {
              - cidr_block                = "0.0.0.0/0"
              - egress_only_gateway_id    = ""
              - gateway_id                = ""
              - instance_id               = ""
              - ipv6_cidr_block           = ""
              - nat_gateway_id            = "nat-06b650370c2b8ce18"
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
                nat_gateway_id            = (known after apply)
                network_interface_id      = ""
                transit_gateway_id        = ""
                vpc_peering_connection_id = ""
            },
        ]
        tags             = {
            "Name" = "rt_iac_private"
        }
      ~ vpc_id           = "vpc-00a3251ed3fde2470" -> (known after apply) # forces replacement
    }

  # aws_route_table.route_table_public must be replaced
-/+ resource "aws_route_table" "route_table_public" {
      ~ id               = "rtb-0d31e670db937dca5" -> (known after apply)
      ~ owner_id         = "873547843801" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
        route            = [
            {
                cidr_block                = "0.0.0.0/0"
                egress_only_gateway_id    = ""
                gateway_id                = "igw-021f1cb6e1623ace6"
                instance_id               = ""
                ipv6_cidr_block           = ""
                nat_gateway_id            = ""
                network_interface_id      = ""
                transit_gateway_id        = ""
                vpc_peering_connection_id = ""
            },
        ]
        tags             = {
            "Name" = "rt_iac_public"
        }
      ~ vpc_id           = "vpc-00a3251ed3fde2470" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private-a must be replaced
-/+ resource "aws_route_table_association" "private-a" {
      ~ id             = "rtbassoc-03c088cbc3f5b3489" -> (known after apply)
      ~ route_table_id = "rtb-08f8e7f209330cdfe" -> (known after apply)
      ~ subnet_id      = "subnet-0abb0a1b662de30ca" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private-b must be replaced
-/+ resource "aws_route_table_association" "private-b" {
      ~ id             = "rtbassoc-0a2755e8a40bdce2f" -> (known after apply)
      ~ route_table_id = "rtb-08f8e7f209330cdfe" -> (known after apply)
      ~ subnet_id      = "subnet-049e335b60b1f543b" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public-a must be replaced
-/+ resource "aws_route_table_association" "public-a" {
      ~ id             = "rtbassoc-0e794a0f9cf8587bd" -> (known after apply)
      ~ route_table_id = "rtb-0d31e670db937dca5" -> (known after apply)
      ~ subnet_id      = "subnet-0edbe629d1f3ddc9c" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public-b must be replaced
-/+ resource "aws_route_table_association" "public-b" {
      ~ id             = "rtbassoc-0d7367759e2d09208" -> (known after apply)
      ~ route_table_id = "rtb-0d31e670db937dca5" -> (known after apply)
      ~ subnet_id      = "subnet-02369fc0e8cb274e6" -> (known after apply) # forces replacement
    }

  # aws_subnet.subnet_1_private must be replaced
-/+ resource "aws_subnet" "subnet_1_private" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:873547843801:subnet/subnet-0abb0a1b662de30ca" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az3" -> (known after apply)
      ~ cidr_block                      = "10.0.0.0/19" -> "10.0.10.0/19" # forces replacement
      ~ id                              = "subnet-0abb0a1b662de30ca" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "873547843801" -> (known after apply)
      ~ tags                            = {
          ~ "Name" = "private-a" -> "modified-private-a"
        }
      ~ vpc_id                          = "vpc-00a3251ed3fde2470" -> (known after apply) # forces replacement
    }

  # aws_subnet.subnet_2_private must be replaced
-/+ resource "aws_subnet" "subnet_2_private" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:873547843801:subnet/subnet-049e335b60b1f543b" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2b"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
        cidr_block                      = "10.0.32.0/19"
      ~ id                              = "subnet-049e335b60b1f543b" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "873547843801" -> (known after apply)
        tags                            = {
            "Name" = "private-b"
        }
      ~ vpc_id                          = "vpc-00a3251ed3fde2470" -> (known after apply) # forces replacement
    }

  # aws_subnet.subnet_3_public must be replaced
-/+ resource "aws_subnet" "subnet_3_public" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:873547843801:subnet/subnet-0edbe629d1f3ddc9c" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az3" -> (known after apply)
        cidr_block                      = "10.0.64.0/18"
      ~ id                              = "subnet-0edbe629d1f3ddc9c" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "873547843801" -> (known after apply)
        tags                            = {
            "Name" = "public-a"
        }
      ~ vpc_id                          = "vpc-00a3251ed3fde2470" -> (known after apply) # forces replacement
    }

  # aws_subnet.subnet_4_public must be replaced
-/+ resource "aws_subnet" "subnet_4_public" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:873547843801:subnet/subnet-02369fc0e8cb274e6" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2b"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
        cidr_block                      = "10.0.128.0/18"
      ~ id                              = "subnet-02369fc0e8cb274e6" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "873547843801" -> (known after apply)
        tags                            = {
            "Name" = "public-b"
        }
      ~ vpc_id                          = "vpc-00a3251ed3fde2470" -> (known after apply) # forces replacement
    }

  # aws_vpc.vpc_iac must be replaced
-/+ resource "aws_vpc" "vpc_iac" {
      ~ arn                              = "arn:aws:ec2:ap-southeast-2:873547843801:vpc/vpc-00a3251ed3fde2470" -> (known after apply)
        assign_generated_ipv6_cidr_block = false
      ~ cidr_block                       = "10.0.0.0/16" -> "10.20.0.0/16" # forces replacement
      ~ default_network_acl_id           = "acl-0fb8a9ed9e409f6cd" -> (known after apply)
      ~ default_route_table_id           = "rtb-0128a70eb90aebecb" -> (known after apply)
      ~ default_security_group_id        = "sg-0ac47d7d518520780" -> (known after apply)
      ~ dhcp_options_id                  = "dopt-3f381258" -> (known after apply)
      ~ enable_classiclink               = false -> (known after apply)
      ~ enable_classiclink_dns_support   = false -> (known after apply)
      ~ enable_dns_hostnames             = false -> (known after apply)
        enable_dns_support               = true
      ~ id                               = "vpc-00a3251ed3fde2470" -> (known after apply)
        instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      ~ main_route_table_id              = "rtb-0128a70eb90aebecb" -> (known after apply)
      ~ owner_id                         = "873547843801" -> (known after apply)
        tags                             = {
            "Name" = "devopsacademy-iac"
        }
    }

Plan: 12 to add, 1 to change, 12 to destroy.

------------------------------------------------------------------------

This plan was saved to: test.txt

To perform exactly these actions, run the following command to apply:
    terraform apply "test.txt"


<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/205c822cbdcd0fd791608eed129941bbee16ce5f/classes/04class/exercises/c04-iac03/README.md)