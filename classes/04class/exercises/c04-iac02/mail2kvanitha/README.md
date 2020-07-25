# C04-IAC02

## Terraform code 
- [_backend.tf](_backend.tf)
- [_provider.tf](_provider.tf)
- [vpc.tf](vpc.tf)
- [output.tf](output.tf)
- [variables.tf](variables.tf)
- [main.tfvars](main.tfvars)

## Command Execution Output
- [output.txt](output.txt)

```
  $ terraform apply --var-file=main.tfvar
  data.aws_availability_zones.az: Refreshing state...
  
  An execution plan has been generated and is shown below.
  Resource actions are indicated with the following symbols:
    + create
  
  Terraform will perform the following actions:
  
    # aws_eip.devopsacademy-iac-eip will be created
    + resource "aws_eip" "devopsacademy-iac-eip" {
        + allocation_id     = (known after apply)
        + association_id    = (known after apply)
        + customer_owned_ip = (known after apply)
        + domain            = (known after apply)
        + id                = (known after apply)
        + instance          = (known after apply)
        + network_interface = (known after apply)
        + private_dns       = (known after apply)
        + private_ip        = (known after apply)
        + public_dns        = (known after apply)
        + public_ip         = (known after apply)
        + public_ipv4_pool  = (known after apply)
        + vpc               = true
      }
  
    # aws_internet_gateway.devopsacademy-iac-igw will be created
    + resource "aws_internet_gateway" "devopsacademy-iac-igw" {
        + arn      = (known after apply)
        + id       = (known after apply)
        + owner_id = (known after apply)
        + tags     = {
            + "Name" = "devopsacademy-iac-igw"
          }
        + vpc_id   = (known after apply)
      }
  
    # aws_main_route_table_association.iac-main-rtassoc will be created
    + resource "aws_main_route_table_association" "iac-main-rtassoc" {
        + id                      = (known after apply)
        + original_route_table_id = (known after apply)
        + route_table_id          = (known after apply)
        + vpc_id                  = (known after apply)
      }
  
    # aws_nat_gateway.iac-nat-gateway will be created
    + resource "aws_nat_gateway" "iac-nat-gateway" {
        + allocation_id        = (known after apply)
        + id                   = (known after apply)
        + network_interface_id = (known after apply)
        + private_ip           = (known after apply)
        + public_ip            = (known after apply)
        + subnet_id            = (known after apply)
        + tags                 = {
            + "Name" = "iac-nat-gateway"
          }
      }
  
    # aws_route_table.iac-private-rt will be created
    + resource "aws_route_table" "iac-private-rt" {
        + id               = (known after apply)
        + owner_id         = (known after apply)
        + propagating_vgws = (known after apply)
        + route            = [
            + {
                + cidr_block                = "0.0.0.0/0"
                + egress_only_gateway_id    = ""
                + gateway_id                = (known after apply)
                + instance_id               = ""
                + ipv6_cidr_block           = ""
                + nat_gateway_id            = ""
                + network_interface_id      = ""
                + transit_gateway_id        = ""
                + vpc_peering_connection_id = ""
              },
          ]
        + tags             = {
            + "Name" = "iac-private-rt"
          }
        + vpc_id           = (known after apply)
      }
  
    # aws_route_table.iac-public-rt will be created
    + resource "aws_route_table" "iac-public-rt" {
        + id               = (known after apply)
        + owner_id         = (known after apply)
        + propagating_vgws = (known after apply)
        + route            = [
            + {
                + cidr_block                = "0.0.0.0/0"
                + egress_only_gateway_id    = ""
                + gateway_id                = (known after apply)
                + instance_id               = ""
                + ipv6_cidr_block           = ""
                + nat_gateway_id            = ""
                + network_interface_id      = ""
                + transit_gateway_id        = ""
                + vpc_peering_connection_id = ""
              },
          ]
        + tags             = {
            + "Name" = "iac-public-rt"
          }
        + vpc_id           = (known after apply)
      }
  
    # aws_route_table_association.iac-prv1a-rtassoc will be created
    + resource "aws_route_table_association" "iac-prv1a-rtassoc" {
        + id             = (known after apply)
        + route_table_id = (known after apply)
        + subnet_id      = (known after apply)
      }
  
    # aws_route_table_association.iac-prv1b-rtassoc will be created
    + resource "aws_route_table_association" "iac-prv1b-rtassoc" {
        + id             = (known after apply)
        + route_table_id = (known after apply)
        + subnet_id      = (known after apply)
      }
  
    # aws_route_table_association.iac-pub1a-rtassoc will be created
    + resource "aws_route_table_association" "iac-pub1a-rtassoc" {
        + id             = (known after apply)
        + route_table_id = (known after apply)
        + subnet_id      = (known after apply)
      }
  
    # aws_route_table_association.iac-pub1b-rtassoc will be created
    + resource "aws_route_table_association" "iac-pub1b-rtassoc" {
        + id             = (known after apply)
        + route_table_id = (known after apply)
        + subnet_id      = (known after apply)
      }
  
    # aws_subnet.iac-private-1a will be created
    + resource "aws_subnet" "iac-private-1a" {
        + arn                             = (known after apply)
        + assign_ipv6_address_on_creation = false
        + availability_zone               = "ap-southeast-2a"
        + availability_zone_id            = (known after apply)
        + cidr_block                      = "10.0.201.0/24"
        + id                              = (known after apply)
        + ipv6_cidr_block                 = (known after apply)
        + ipv6_cidr_block_association_id  = (known after apply)
        + map_public_ip_on_launch         = true
        + owner_id                        = (known after apply)
        + tags                            = {
            + "Name" = "iac-private-1a"
          }
        + vpc_id                          = (known after apply)
      }
  
    # aws_subnet.iac-private-1b will be created
    + resource "aws_subnet" "iac-private-1b" {
        + arn                             = (known after apply)
        + assign_ipv6_address_on_creation = false
        + availability_zone               = "ap-southeast-2b"
        + availability_zone_id            = (known after apply)
        + cidr_block                      = "10.0.202.0/24"
        + id                              = (known after apply)
        + ipv6_cidr_block                 = (known after apply)
        + ipv6_cidr_block_association_id  = (known after apply)
        + map_public_ip_on_launch         = true
        + owner_id                        = (known after apply)
        + tags                            = {
            + "Name" = "iac-private-1b"
          }
        + vpc_id                          = (known after apply)
      }
  
    # aws_subnet.iac-public-1a will be created
    + resource "aws_subnet" "iac-public-1a" {
        + arn                             = (known after apply)
        + assign_ipv6_address_on_creation = false
        + availability_zone               = "ap-southeast-2a"
        + availability_zone_id            = (known after apply)
        + cidr_block                      = "10.0.101.0/24"
        + id                              = (known after apply)
        + ipv6_cidr_block                 = (known after apply)
        + ipv6_cidr_block_association_id  = (known after apply)
        + map_public_ip_on_launch         = true
        + owner_id                        = (known after apply)
        + tags                            = {
            + "Name" = "iac-public-1a"
          }
        + vpc_id                          = (known after apply)
      }
  
    # aws_subnet.iac-public-1b will be created
    + resource "aws_subnet" "iac-public-1b" {
        + arn                             = (known after apply)
        + assign_ipv6_address_on_creation = false
        + availability_zone               = "ap-southeast-2b"
        + availability_zone_id            = (known after apply)
        + cidr_block                      = "10.0.102.0/24"
        + id                              = (known after apply)
        + ipv6_cidr_block                 = (known after apply)
        + ipv6_cidr_block_association_id  = (known after apply)
        + map_public_ip_on_launch         = true
        + owner_id                        = (known after apply)
        + tags                            = {
            + "Name" = "iac-public-1b"
          }
        + vpc_id                          = (known after apply)
      }
  
    # aws_vpc.devopsacademy-iac will be created
    + resource "aws_vpc" "devopsacademy-iac" {
        + arn                              = (known after apply)
        + assign_generated_ipv6_cidr_block = false
        + cidr_block                       = "10.0.0.0/16"
        + default_network_acl_id           = (known after apply)
        + default_route_table_id           = (known after apply)
        + default_security_group_id        = (known after apply)
        + dhcp_options_id                  = (known after apply)
        + enable_classiclink               = (known after apply)
        + enable_classiclink_dns_support   = (known after apply)
        + enable_dns_hostnames             = true
        + enable_dns_support               = true
        + id                               = (known after apply)
        + instance_tenancy                 = "default"
        + ipv6_association_id              = (known after apply)
        + ipv6_cidr_block                  = (known after apply)
        + main_route_table_id              = (known after apply)
        + owner_id                         = (known after apply)
        + tags                             = {
            + "Name" = "devopsacademy-iac"
          }
      }
  
  Plan: 15 to add, 0 to change, 0 to destroy.
  
  Do you want to perform these actions?
    Terraform will perform the actions described above.
    Only 'yes' will be accepted to approve.
  
    Enter a value: yes
  
  aws_eip.devopsacademy-iac-eip: Creating...
  aws_vpc.devopsacademy-iac: Creating...
  aws_eip.devopsacademy-iac-eip: Creation complete after 1s [id=eipalloc-0370028e2fa410f3d]
  aws_vpc.devopsacademy-iac: Creation complete after 3s [id=vpc-015f788066f85c871]
  aws_subnet.iac-private-1a: Creating...
  aws_subnet.iac-public-1b: Creating...
  aws_subnet.iac-public-1a: Creating...
  aws_subnet.iac-private-1b: Creating...
  aws_internet_gateway.devopsacademy-iac-igw: Creating...
  aws_internet_gateway.devopsacademy-iac-igw: Creation complete after 1s [id=igw-0b023820232ccf69b]
  aws_route_table.iac-public-rt: Creating...
  aws_subnet.iac-public-1b: Creation complete after 2s [id=subnet-0ed6437d6b6f12f6b]
  aws_subnet.iac-private-1b: Creation complete after 2s [id=subnet-07b1b363d7a0a4620]
  aws_subnet.iac-public-1a: Creation complete after 2s [id=subnet-021acba3fe0413d28]
  aws_nat_gateway.iac-nat-gateway: Creating...
  aws_subnet.iac-private-1a: Creation complete after 2s [id=subnet-09d87bf2c540cba4d]
  aws_route_table.iac-public-rt: Creation complete after 1s [id=rtb-0c545b24e0d898ddd]
  aws_route_table_association.iac-pub1b-rtassoc: Creating...
  aws_main_route_table_association.iac-main-rtassoc: Creating...
  aws_route_table_association.iac-pub1a-rtassoc: Creating...
  aws_route_table_association.iac-pub1a-rtassoc: Creation complete after 1s [id=rtbassoc-0ef3ac1810f0fe2e2]
  aws_route_table_association.iac-pub1b-rtassoc: Creation complete after 1s [id=rtbassoc-07d88a55478daa78c]
  aws_main_route_table_association.iac-main-rtassoc: Creation complete after 1s [id=rtbassoc-078dfc883891b2679]
  aws_nat_gateway.iac-nat-gateway: Still creating... [10s elapsed]
  aws_nat_gateway.iac-nat-gateway: Still creating... [20s elapsed]
  aws_nat_gateway.iac-nat-gateway: Still creating... [30s elapsed]
  aws_nat_gateway.iac-nat-gateway: Still creating... [40s elapsed]
  aws_nat_gateway.iac-nat-gateway: Still creating... [50s elapsed]
  aws_nat_gateway.iac-nat-gateway: Still creating... [1m0s elapsed]
  aws_nat_gateway.iac-nat-gateway: Still creating... [1m10s elapsed]
  aws_nat_gateway.iac-nat-gateway: Still creating... [1m20s elapsed]
  aws_nat_gateway.iac-nat-gateway: Still creating... [1m30s elapsed]
  aws_nat_gateway.iac-nat-gateway: Still creating... [1m40s elapsed]
  aws_nat_gateway.iac-nat-gateway: Creation complete after 1m47s [id=nat-061997c0e39cb1e3d]
  aws_route_table.iac-private-rt: Creating...
  aws_route_table.iac-private-rt: Creation complete after 1s [id=rtb-08185d1f230b88d0c]
  aws_route_table_association.iac-prv1a-rtassoc: Creating...
  aws_route_table_association.iac-prv1b-rtassoc: Creating...
  aws_route_table_association.iac-prv1a-rtassoc: Creation complete after 0s [id=rtbassoc-00dbfe3dbafafcc32]
  aws_route_table_association.iac-prv1b-rtassoc: Creation complete after 0s [id=rtbassoc-002a3ca68ba4a5f59]
  
  Apply complete! Resources: 15 added, 0 changed, 0 destroyed.
  
  The state of your infrastructure has been saved to the path
  below. This state is required to modify and destroy your
  infrastructure, so keep it safe. To inspect the complete state
  use the `terraform show` command.
  
  State path: /Users/vanithak/class04/terraform.tfstate

```  
  Outputs:

```  
  aws_internet_gateway = igw-0b023820232ccf69b
  aws_nat_gateway = nat-061997c0e39cb1e3d
  aws_vpc = 10.0.0.0/16
  private-subnet-1a-cidr = 10.0.201.0/24
  private-subnet-1a-name = iac-private-1a
  private-subnet-1b-cidr = 10.0.202.0/24
  private-subnet-1b-name = iac-private-1b
  public-subnet-1a-cidr = 10.0.101.0/24
  public-subnet-1a-name = iac-public-1a
  public-subnet-1b-cidr = 10.0.102.0/24
  public-subnet-1b-name = iac-public-1b

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c04-iac02](chttps://github.com/devopsacademyau/academy/blob/c41e824fb2a2c55e3a30b2371a87e3a7551b6741/classes/04class/exercises/c04-iac02/README.md)
