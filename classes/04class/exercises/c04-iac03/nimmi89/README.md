# C04-IAC03

## Terraform plan output

```
$ terraform plan -var-file ./main.tfvars -var="vpcCIDRblock=172.16.0.0/16" 
 -var='public_subnet_cidr_blocks=["172.16.10.0/24","10.0.11.0/24"]'
 -var='public_subnet_names=["public-a","renamed-public-b"]' -out vpc_plan

  Refreshing Terraform state in-memory prior to plan...
  The refreshed state will be used to calculate this plan, but will not be
  persisted to local or remote state storage.

  aws_eip.nat: Refreshing state... [id=eipalloc-0a29bf41be2face63]
  aws_vpc.tf-vpc: Refreshing state... [id=vpc-04da1677333236d47]
  aws_route_table.private: Refreshing state... [id=rtb-03e446b1a1cecd412]
  aws_subnet.public[1]: Refreshing state... [id=subnet-0eec61824886b765e]
  aws_route_table.public: Refreshing state... [id=rtb-0663c706aa9484f9e]
  aws_internet_gateway.tf-igw: Refreshing state... [id=igw-09a7f5f6dcb9b0cb2]
  aws_subnet.private[1]: Refreshing state... [id=subnet-09d4035bb9105492a]
  aws_subnet.private[0]: Refreshing state... [id=subnet-0eb1fbfec9b7f107d]
  aws_subnet.public[0]: Refreshing state... [id=subnet-0ef1ccc2ebd09902b]
  aws_route.public: Refreshing state... [id=r-rtb-0663c706aa9484f9e1080289494]
  aws_route_table_association.private[1]: Refreshing state... [id=rtbassoc-0f39c2dd7c0f510c3]
  aws_route_table_association.public[1]: Refreshing state... [id=rtbassoc-003dc4e2db199dbcc]
  aws_nat_gateway.tf-ngw: Refreshing state... [id=nat-013049722248021fa]
  aws_route_table_association.public[0]: Refreshing state... [id=rtbassoc-03fecbf78678304a5]
  aws_route_table_association.private[0]: Refreshing state... [id=rtbassoc-0bbcbface9a504e5b]
  aws_route.private: Refreshing state... [id=r-rtb-03e446b1a1cecd4121080289494]

  --------------------------------------------------------------------------------

  An execution plan has been generated and is shown below. Resource actions are indicated with the following symbols: ~ update in-place -/+ destroy and then create replacement

  Terraform will perform the following actions:

  # aws_internet_gateway.tf-igw will be updated in-place

  ~ resource "aws_internet_gateway" "tf-igw" {
     arn = "arn:aws:ec2:ap-southeast-2:438549961569:internet-gateway/igw-09a7f5f6dcb9b0cb2" 
     id = "igw-09a7f5f6dcb9b0cb2" owner_id = "438549961569" 
     tags = { 
       "Name" = "devopsacademy-igw" 
       } 
     ~ vpc_id = "vpc-04da1677333236d47" -> (known after apply) 
    }

  # aws_nat_gateway.tf-ngw must be replaced

  -/+ resource "aws_nat_gateway" "tf-ngw" { 
    allocation_id = "eipalloc-0a29bf41be2face63" 
    ~ id = "nat-013049722248021fa" -> (known after apply) 
    ~ network_interface_id = "eni-09523cfc4898051d6" -> (known after apply) 
    ~ private_ip = "10.0.10.70" -> (known after apply) 
    ~ public_ip = "13.54.217.249" -> (known after apply) 
    ~ subnet_id = "subnet-0ef1ccc2ebd09902b" -> (known after apply) # forces replacement 
    tags = { 
      "Name" = "devopsacademy-ngw" 
      } 
    }

  # aws_route.private must be replaced

  -/+ resource "aws_route" "private" { 
  - destination_cidr_block = "0.0.0.0/0"
  - destination_prefix_list_id = (known after apply)
  - egress_only_gateway_id = (known after apply)
  - gateway_id = (known after apply) 
  ~ id = "r-rtb-03e446b1a1cecd4121080289494" -> (known after apply)
  - instance_id = (known after apply)
  - instance_owner_id = (known after apply) 
  ~ nat_gateway_id = "nat-013049722248021fa" -> (known after apply)
  - network_interface_id = (known after apply) 
  ~ origin = "CreateRoute" -> (known after apply) 
  ~ route_table_id = "rtb-03e446b1a1cecd412" -> (known after apply) # forces replacement ~ state = "active" -> (known after apply) }


  # aws_route.public must be replaced

  -/+ resource "aws_route" "public" { 
    destination_cidr_block = "0.0.0.0/0"
    destination_prefix_list_id = (known after apply)
  - egress_only_gateway_id = (known after apply) gateway_id = "igw-09a7f5f6dcb9b0cb2" 
  ~ id = "r-rtb-0663c706aa9484f9e1080289494" -> (known after apply)
  - instance_id = (known after apply)
  - instance_owner_id = (known after apply)
  - nat_gateway_id = (known after apply)
  - network_interface_id = (known after apply) 
  ~ origin = "CreateRoute" -> (known after apply) 
  ~ route_table_id = "rtb-0663c706aa9484f9e" -> (known after apply) # forces replacement 
  ~ state = "active" -> (known after apply) }


  # aws_route_table.private must be replaced

  -/+ resource "aws_route_table" "private" { 
    ~ id = "rtb-03e446b1a1cecd412" -> (known after apply)
    ~ owner_id = "438549961569" -> (known after apply)
    ~ propagating_vgws = [] -> (known after apply) ~ route = [ {


  - cidr_block                = "0.0.0.0/0"
    - egress_only_gateway_id    = ""
    - gateway_id                = ""
    - instance_id               = ""
    - ipv6_cidr_block           = ""
    - nat_gateway_id            = "nat-013049722248021fa"
    - network_interface_id      = ""
    - transit_gateway_id        = ""
    - vpc_peering_connection_id = ""
  },] -> (known after apply) 
  tags = { 
    "Name" = "devopsacademy-rt-private"
  } 
  ~ vpc_id = "vpc-04da1677333236d47" -> (known after apply) # forces replacement }


  # aws_route_table.public must be replaced

  -/+ resource "aws_route_table" "public" { ~ id = "rtb-0663c706aa9484f9e" -> (known after apply) 
  ~ owner_id = "438549961569" -> (known after apply) 
  ~ propagating_vgws = [] -> (known after apply)
  ~ route = [ {
  - cidr_block                = "0.0.0.0/0"
  - egress_only_gateway_id    = ""
  - gateway_id                = "igw-09a7f5f6dcb9b0cb2"
  - instance_id               = ""
  - ipv6_cidr_block           = ""
  - nat_gateway_id            = ""
  - network_interface_id      = ""
  - transit_gateway_id        = ""
  - vpc_peering_connection_id = ""


  },] -> (known after apply) 
  tags = { 
    "Name" = "devopsacademy-rt-public"
     } 
   ~ vpc_id = "vpc-04da1677333236d47" -> (known after apply) # forces replacement }

  # aws_route_table_association.private[0] must be replaced

  -/+ resource "aws_route_table_association" "private" { 
    ~ id = "rtbassoc-0bbcbface9a504e5b" -> (known after apply) 
    ~ route_table_id = "rtb-03e446b1a1cecd412" -> (known after apply) 
    ~ subnet_id = "subnet-0eb1fbfec9b7f107d" -> (known after apply) # forces replacement 
    }

  # aws_route_table_association.private[1] must be replaced

  -/+ resource "aws_route_table_association" "private" { 
    ~ id = "rtbassoc-0f39c2dd7c0f510c3" -> (known after apply) 
    ~ route_table_id = "rtb-03e446b1a1cecd412" -> (known after apply) 
    ~ subnet_id = "subnet-09d4035bb9105492a" -> (known after apply) # forces replacement 
    }

  # aws_route_table_association.public[0] must be replaced

  -/+ resource "aws_route_table_association" "public" { 
    ~ id = "rtbassoc-03fecbf78678304a5" -> (known after apply) 
    ~ route_table_id = "rtb-0663c706aa9484f9e" -> (known after apply) 
    ~ subnet_id = "subnet-0ef1ccc2ebd09902b" -> (known after apply) # forces replacement 
    }

  # aws_route_table_association.public[1] must be replaced

  -/+ resource "aws_route_table_association" "public" {
     ~ id = "rtbassoc-003dc4e2db199dbcc" -> (known after apply) 
     ~ route_table_id = "rtb-0663c706aa9484f9e" -> (known after apply) 
     ~ subnet_id = "subnet-0eec61824886b765e" -> (known after apply) # forces replacement }

  # aws_subnet.private[0] must be replaced

  -/+ resource "aws_subnet" "private" { 
    ~ arn = "arn:aws:ec2:ap-southeast-2:438549961569:subnet/subnet-0eb1fbfec9b7f107d" -> (known after apply) 
    assign_ipv6_address_on_creation = false 
    availability_zone = "ap-southeast-2a" 
    ~ availability_zone_id = "apse2-az1" -> (known after apply) 
    cidr_block = "10.0.30.0/24" ~ id = "subnet-0eb1fbfec9b7f107d" -> (known after apply) 
    ipv6_cidr_block = (known after apply)
  - ipv6_cidr_block_association_id = (known after apply) 
  map_public_ip_on_launch = false 
  ~ owner_id = "438549961569" -> (known after apply) 
  tags = {
    "Name" = "private-a"
  } 
  ~ vpc_id = "vpc-04da1677333236d47" -> (known after apply) # forces replacement 
  } 

  # aws_subnet.private[1] must be replaced

  -/+ resource "aws_subnet" "private" { 
    ~ arn = "arn:aws:ec2:ap-southeast-2:438549961569:subnet/subnet-09d4035bb9105492a" -> (known after apply) 
    assign_ipv6_address_on_creation = false 
    availability_zone = "ap-southeast-2b" 
    ~ availability_zone_id = "apse2-az3" -> (known after apply) 
    cidr_block = "10.0.31.0/24" 
    ~ id = "subnet-09d4035bb9105492a" -> (known after apply)
    ipv6_cidr_block = (known after apply)
    - ipv6_cidr_block_association_id = (known after apply) 
    map_public_ip_on_launch = false 
    ~ owner_id = "438549961569" -> (known after apply) 
    tags = {
    "Name" = "private-b"
    } 
    ~ vpc_id = "vpc-04da1677333236d47" -> (known after apply) # forces replacement } 


  # aws_subnet.public[0] must be replaced

  -/+ resource "aws_subnet" "public" { 
    ~ arn = "arn:aws:ec2:ap-southeast-2:438549961569:subnet/subnet-0ef1ccc2ebd09902b" -> (known after apply) 
    assign_ipv6_address_on_creation = false 
    availability_zone = "ap-southeast-2a" 
    ~ availability_zone_id = "apse2-az1" -> (known after apply) 
    ~ cidr_block = "10.0.10.0/24" -> "172.16.10.0/24" # forces replacement 
    ~ id = "subnet-0ef1ccc2ebd09902b" -> (known after apply)

    ipv6_cidr_block = (known after apply)
    ipv6_cidr_block_association_id = (known after apply) 
    map_public_ip_on_launch = true 
    ~ owner_id = "438549961569" -> (known after apply) 
    tags = {
    "Name" = "public-a"
    } ~ vpc_id = "vpc-04da1677333236d47" -> (known after apply) # forces replacement } 


  # aws_subnet.public[1] must be replaced

  -/+ resource "aws_subnet" "public" { 
    ~ arn = "arn:aws:ec2:ap-southeast-2:438549961569:subnet/subnet-0eec61824886b765e" -> (known after apply) 
    assign_ipv6_address_on_creation = false 
    availability_zone = "ap-southeast-2b" 
    ~ availability_zone_id = "apse2-az3" -> (known after apply) 
    cidr_block = "10.0.11.0/24" 
    ~ id = "subnet-0eec61824886b765e" -> (known after apply)

  - ipv6_cidr_block = (known after apply)
  - ipv6_cidr_block_association_id = (known after apply) 
    map_public_ip_on_launch = true 
  ~ owner_id = "438549961569" -> (known after apply) 
  ~ tags = { 
      ~ "Name" = "public-b" -> "renamed-public-b" } 
  ~ vpc_id = "vpc-04da1677333236d47" -> (known after apply) # forces replacement }

  # aws_vpc.tf-vpc must be replaced

  -/+ resource "aws_vpc" "tf-vpc" {
    ~ arn = "arn:aws:ec2:ap-southeast-2:438549961569:vpc/vpc-04da1677333236d47" -> (known after apply) 
    assign_generated_ipv6_cidr_block = false 
    ~ cidr_block = "10.0.0.0/16" -> "172.16.0.0/16" # forces replacement 
    ~ default_network_acl_id = "acl-06045822c37709ab6" -> (known after apply) 
    ~ default_route_table_id = "rtb-074afce98acc758df" -> (known after apply) 
    ~ default_security_group_id = "sg-0da473e604f4a8daa" -> (known after apply) 
    ~ dhcp_options_id = "dopt-905900f7" -> (known after apply) 
    ~ enable_classiclink = false -> (known after apply)
    ~ enable_classiclink_dns_support = false -> (known after apply) 
    ~ enable_dns_hostnames = false -> (known after apply) 
    enable_dns_support = true 
    ~ id = "vpc-04da1677333236d47" -> (known after apply) 
    instance_tenancy = "default"

    - ipv6_association_id = (known after apply)

    - ipv6_cidr_block = (known after apply) 
    ~ main_route_table_id = "rtb-074afce98acc758df" -> (known after apply) 
    ~ owner_id = "438549961569" -> (known after apply) 
    tags = {
    "Name" = "devopsacademy-i"
    } }


    Plan: 14 to add, 1 to change, 14 to destroy.

    --------------------------------------------------------------------------------

    This plan was saved to: vpc_plan

    To perform exactly these actions, run the following command to apply: terraform apply "vpc_plan"

    Note: Some resources in AWS need to be completely destroyed and new ones need to be created whenever there is any modification.As the CIDR block is changed, all the dependent resources[subnets,route tables etc.] are automtically replaced as well.
```

Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/205c822cbdcd0fd791608eed129941bbee16ce5f/classes/04class/exercises/c04-iac03/README.md)
