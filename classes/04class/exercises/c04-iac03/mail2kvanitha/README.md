# C04-IAC03

## Terraform plan output
``` 
     $ terraform plan --var-file=main.tfvar
   Refreshing Terraform state in-memory prior to plan...
   The refreshed state will be used to calculate this plan, but will not be
   persisted to local or remote state storage.
   
   data.aws_availability_zones.az: Refreshing state...
   aws_eip.devopsacademy-iac-eip: Refreshing state... [id=eipalloc-0de09e5204bedb781]
   aws_vpc.devopsacademy-iac: Refreshing state... [id=vpc-07619bd9d2e53308b]
   aws_subnet.iac-public-1a: Refreshing state... [id=subnet-0147f92f0a2ad9b9e]
   aws_subnet.iac-private-1a: Refreshing state... [id=subnet-0eaff8533aa93a512]
   aws_subnet.iac-public-1b: Refreshing state... [id=subnet-056131a90db044cec]
   aws_internet_gateway.devopsacademy-iac-igw: Refreshing state... [id=igw-074993f7b1e87a389]
   aws_subnet.iac-private-1b: Refreshing state... [id=subnet-0ecb6753e395eb1cf]
   aws_route_table.iac-public-rt: Refreshing state... [id=rtb-0639a2e2fa95d954b]
   aws_nat_gateway.iac-nat-gateway: Refreshing state... [id=nat-02f5e76220e949f98]
   aws_main_route_table_association.iac-main-rtassoc: Refreshing state... [id=rtbassoc-0d0b10a6935d3b27b]
   aws_route_table_association.iac-pub1b-rtassoc: Refreshing state... [id=rtbassoc-045d8cd275917f262]
   aws_route_table_association.iac-pub1a-rtassoc: Refreshing state... [id=rtbassoc-0a666836de0a85fda]
   aws_route_table.iac-private-rt: Refreshing state... [id=rtb-0d3b8fa426ae3215b]
   aws_route_table_association.iac-prv1b-rtassoc: Refreshing state... [id=rtbassoc-04b34f858a02f15c6]
   aws_route_table_association.iac-prv1a-rtassoc: Refreshing state... [id=rtbassoc-05827f60d118ebc18]
   
   ------------------------------------------------------------------------
   
   An execution plan has been generated and is shown below.
   Resource actions are indicated with the following symbols:
     ~ update in-place
   -/+ destroy and then create replacement
   
   Terraform will perform the following actions:
   
     # aws_internet_gateway.devopsacademy-iac-igw will be updated in-place
     ~ resource "aws_internet_gateway" "devopsacademy-iac-igw" {
           arn      = "arn:aws:ec2:ap-southeast-2:823151257518:internet-gateway/igw-074993f7b1e87a389"
           id       = "igw-074993f7b1e87a389"
           owner_id = "823151257518"
           tags     = {
               "Name" = "devopsacademy-iac-igw"
           }
         ~ vpc_id   = "vpc-07619bd9d2e53308b" -> (known after apply)
       }
   
     # aws_main_route_table_association.iac-main-rtassoc will be updated in-place
     ~ resource "aws_main_route_table_association" "iac-main-rtassoc" {
           id                      = "rtbassoc-0d0b10a6935d3b27b"
           original_route_table_id = "rtb-0a76dbe02ced45c6c"
         ~ route_table_id          = "rtb-0639a2e2fa95d954b" -> (known after apply)
         ~ vpc_id                  = "vpc-07619bd9d2e53308b" -> (known after apply)
       }
   
     # aws_nat_gateway.iac-nat-gateway must be replaced
   -/+ resource "aws_nat_gateway" "iac-nat-gateway" {
           allocation_id        = "eipalloc-0de09e5204bedb781"
         ~ id                   = "nat-02f5e76220e949f98" -> (known after apply)
         ~ network_interface_id = "eni-0c722444c3f281b4d" -> (known after apply)
         ~ private_ip           = "10.0.11.224" -> (known after apply)
         ~ public_ip            = "3.105.64.219" -> (known after apply)
         ~ subnet_id            = "subnet-0147f92f0a2ad9b9e" -> (known after apply) # forces replacement
           tags                 = {
               "Name" = "iac-nat-gateway"
           }
       }
   
     # aws_route_table.iac-private-rt must be replaced
   -/+ resource "aws_route_table" "iac-private-rt" {
         ~ id               = "rtb-0d3b8fa426ae3215b" -> (known after apply)
         ~ owner_id         = "823151257518" -> (known after apply)
         ~ propagating_vgws = [] -> (known after apply)
         ~ route            = [
             - {
                 - cidr_block                = "0.0.0.0/0"
                 - egress_only_gateway_id    = ""
                 - gateway_id                = ""
                 - instance_id               = ""
                 - ipv6_cidr_block           = ""
                 - nat_gateway_id            = "nat-02f5e76220e949f98"
                 - network_interface_id      = ""
                 - transit_gateway_id        = ""
                 - vpc_peering_connection_id = ""
               },
               {
                   cidr_block                = "0.0.0.0/0"
                   egress_only_gateway_id    = ""
                   gateway_id                = (known after apply)
                   instance_id               = ""
                   ipv6_cidr_block           = ""
                   nat_gateway_id            = ""
                   network_interface_id      = ""
                   transit_gateway_id        = ""
                   vpc_peering_connection_id = ""
               },
           ]
           tags             = {
               "Name" = "iac-private-rt"
           }
         ~ vpc_id           = "vpc-07619bd9d2e53308b" -> (known after apply) # forces replacement
       }
   
     # aws_route_table.iac-public-rt must be replaced
   -/+ resource "aws_route_table" "iac-public-rt" {
         ~ id               = "rtb-0639a2e2fa95d954b" -> (known after apply)
         ~ owner_id         = "823151257518" -> (known after apply)
         ~ propagating_vgws = [] -> (known after apply)
           route            = [
               {
                   cidr_block                = "0.0.0.0/0"
                   egress_only_gateway_id    = ""
                   gateway_id                = "igw-074993f7b1e87a389"
                   instance_id               = ""
                   ipv6_cidr_block           = ""
                   nat_gateway_id            = ""
                   network_interface_id      = ""
                   transit_gateway_id        = ""
                   vpc_peering_connection_id = ""
               },
           ]
           tags             = {
               "Name" = "iac-public-rt"
           }
         ~ vpc_id           = "vpc-07619bd9d2e53308b" -> (known after apply) # forces replacement
       }
   
     # aws_route_table_association.iac-prv1a-rtassoc must be replaced
   -/+ resource "aws_route_table_association" "iac-prv1a-rtassoc" {
         ~ id             = "rtbassoc-05827f60d118ebc18" -> (known after apply)
         ~ route_table_id = "rtb-0d3b8fa426ae3215b" -> (known after apply)
         ~ subnet_id      = "subnet-0eaff8533aa93a512" -> (known after apply) # forces replacement
       }
   
     # aws_route_table_association.iac-prv1b-rtassoc must be replaced
   -/+ resource "aws_route_table_association" "iac-prv1b-rtassoc" {
         ~ id             = "rtbassoc-04b34f858a02f15c6" -> (known after apply)
         ~ route_table_id = "rtb-0d3b8fa426ae3215b" -> (known after apply)
         ~ subnet_id      = "subnet-0ecb6753e395eb1cf" -> (known after apply) # forces replacement
       }
   
     # aws_route_table_association.iac-pub1a-rtassoc must be replaced
   -/+ resource "aws_route_table_association" "iac-pub1a-rtassoc" {
         ~ id             = "rtbassoc-0a666836de0a85fda" -> (known after apply)
         ~ route_table_id = "rtb-0639a2e2fa95d954b" -> (known after apply)
         ~ subnet_id      = "subnet-0147f92f0a2ad9b9e" -> (known after apply) # forces replacement
       }
   
     # aws_route_table_association.iac-pub1b-rtassoc must be replaced
   -/+ resource "aws_route_table_association" "iac-pub1b-rtassoc" {
         ~ id             = "rtbassoc-045d8cd275917f262" -> (known after apply)
         ~ route_table_id = "rtb-0639a2e2fa95d954b" -> (known after apply)
         ~ subnet_id      = "subnet-056131a90db044cec" -> (known after apply) # forces replacement
       }
   
     # aws_subnet.iac-private-1a must be replaced
   -/+ resource "aws_subnet" "iac-private-1a" {
         ~ arn                             = "arn:aws:ec2:ap-southeast-2:823151257518:subnet/subnet-0eaff8533aa93a512" -> (known after apply)
           assign_ipv6_address_on_creation = false
           availability_zone               = "ap-southeast-2a"
         ~ availability_zone_id            = "apse2-az1" -> (known after apply)
           cidr_block                      = "10.0.21.0/24"
         ~ id                              = "subnet-0eaff8533aa93a512" -> (known after apply)
         + ipv6_cidr_block                 = (known after apply)
         + ipv6_cidr_block_association_id  = (known after apply)
           map_public_ip_on_launch         = true
         ~ owner_id                        = "823151257518" -> (known after apply)
         ~ tags                            = {
             ~ "Name" = "iac-private-1b" -> "private-subnet-1a-iac"
           }
         ~ vpc_id                          = "vpc-07619bd9d2e53308b" -> (known after apply) # forces replacement
       }
   
     # aws_subnet.iac-private-1b must be replaced
   -/+ resource "aws_subnet" "iac-private-1b" {
         ~ arn                             = "arn:aws:ec2:ap-southeast-2:823151257518:subnet/subnet-0ecb6753e395eb1cf" -> (known after apply)
           assign_ipv6_address_on_creation = false
           availability_zone               = "ap-southeast-2b"
         ~ availability_zone_id            = "apse2-az3" -> (known after apply)
           cidr_block                      = "10.0.22.0/24"
         ~ id                              = "subnet-0ecb6753e395eb1cf" -> (known after apply)
         + ipv6_cidr_block                 = (known after apply)
         + ipv6_cidr_block_association_id  = (known after apply)
           map_public_ip_on_launch         = true
         ~ owner_id                        = "823151257518" -> (known after apply)
         ~ tags                            = {
             ~ "Name" = "iac-private-1b" -> "private-subnet-1a-iac"
           }
         ~ vpc_id                          = "vpc-07619bd9d2e53308b" -> (known after apply) # forces replacement
       }
   
     # aws_subnet.iac-public-1a must be replaced
   -/+ resource "aws_subnet" "iac-public-1a" {
         ~ arn                             = "arn:aws:ec2:ap-southeast-2:823151257518:subnet/subnet-0147f92f0a2ad9b9e" -> (known after apply)
           assign_ipv6_address_on_creation = false
           availability_zone               = "ap-southeast-2a"
         ~ availability_zone_id            = "apse2-az1" -> (known after apply)
         ~ cidr_block                      = "10.0.11.0/24" -> "10.0.19.0/24" # forces replacement
         ~ id                              = "subnet-0147f92f0a2ad9b9e" -> (known after apply)
         + ipv6_cidr_block                 = (known after apply)
         + ipv6_cidr_block_association_id  = (known after apply)
           map_public_ip_on_launch         = true
         ~ owner_id                        = "823151257518" -> (known after apply)
           tags                            = {
               "Name" = "iac-public-1a"
           }
         ~ vpc_id                          = "vpc-07619bd9d2e53308b" -> (known after apply) # forces replacement
       }
   
     # aws_subnet.iac-public-1b must be replaced
   -/+ resource "aws_subnet" "iac-public-1b" {
         ~ arn                             = "arn:aws:ec2:ap-southeast-2:823151257518:subnet/subnet-056131a90db044cec" -> (known after apply)
           assign_ipv6_address_on_creation = false
           availability_zone               = "ap-southeast-2b"
         ~ availability_zone_id            = "apse2-az3" -> (known after apply)
           cidr_block                      = "10.0.12.0/24"
         ~ id                              = "subnet-056131a90db044cec" -> (known after apply)
         + ipv6_cidr_block                 = (known after apply)
         + ipv6_cidr_block_association_id  = (known after apply)
           map_public_ip_on_launch         = true
         ~ owner_id                        = "823151257518" -> (known after apply)
           tags                            = {
               "Name" = "iac-public-1b"
           }
         ~ vpc_id                          = "vpc-07619bd9d2e53308b" -> (known after apply) # forces replacement
       }
   
     # aws_vpc.devopsacademy-iac must be replaced
   -/+ resource "aws_vpc" "devopsacademy-iac" {
         ~ arn                              = "arn:aws:ec2:ap-southeast-2:823151257518:vpc/vpc-07619bd9d2e53308b" -> (known after apply)
           assign_generated_ipv6_cidr_block = false
         ~ cidr_block                       = "10.0.0.0/16" -> "10.0.0.0/17" # forces replacement
         ~ default_network_acl_id           = "acl-03334594504ac64a0" -> (known after apply)
         ~ default_route_table_id           = "rtb-0639a2e2fa95d954b" -> (known after apply)
         ~ default_security_group_id        = "sg-03b5601f8a26243d2" -> (known after apply)
         ~ dhcp_options_id                  = "dopt-9d2a63fa" -> (known after apply)
         ~ enable_classiclink               = false -> (known after apply)
         ~ enable_classiclink_dns_support   = false -> (known after apply)
           enable_dns_hostnames             = true
           enable_dns_support               = true
         ~ id                               = "vpc-07619bd9d2e53308b" -> (known after apply)
           instance_tenancy                 = "default"
         + ipv6_association_id              = (known after apply)
         + ipv6_cidr_block                  = (known after apply)
         ~ main_route_table_id              = "rtb-0639a2e2fa95d954b" -> (known after apply)
         ~ owner_id                         = "823151257518" -> (known after apply)
           tags                             = {
               "Name" = "devopsacademy-iac"
           }
       }
   
   Plan: 12 to add, 2 to change, 12 to destroy.
   
   ------------------------------------------------------------------------
   
   Note: You didn't specify an "-out" parameter to save this plan, so Terraform
   can't guarantee that exactly these actions will be performed if
   "terraform apply" is subsequently run.
   
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/205c822cbdcd0fd791608eed129941bbee16ce5f/classes/04class/exercises/c04-iac03/README.md)
