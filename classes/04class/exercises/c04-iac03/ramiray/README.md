terraform plan -var-file="main.tfvars"
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

aws_eip.nat[0]: Refreshing state... [id=eipalloc-0136cf297f583dec4]
aws_subnet.public[0]: Refreshing state... [id=subnet-04ef74673aa7debd8]
aws_subnet.public[1]: Refreshing state... [id=subnet-00f924800d4f5ddc5]
aws_eip.nat[1]: Refreshing state... [id=eipalloc-0d9d62d9bed86578e]
aws_vpc.da_iac02_vpc: Refreshing state... [id=vpc-095a4ba6da1dfd727]
aws_subnet.private[1]: Refreshing state... [id=subnet-0ba062b9607bd6775]
aws_subnet.private[0]: Refreshing state... [id=subnet-05c33af87974e3619]
aws_route_table.private[0]: Refreshing state... [id=rtb-0697ec1580658f0df]
aws_internet_gateway.da_iac02_igw: Refreshing state... [id=igw-05674b4385ac18a67]
aws_route_table.private[1]: Refreshing state... [id=rtb-0c66ce35bd1b8468b]
aws_route_table.public: Refreshing state... [id=rtb-02df7592db8ecaebf]
aws_nat_gateway.iac02nat[1]: Refreshing state... [id=nat-0ec94965e344aa426]
aws_route.public: Refreshing state... [id=r-rtb-02df7592db8ecaebf1080289494]
aws_nat_gateway.iac02nat[0]: Refreshing state... [id=nat-01535a3c31e4899aa]
aws_route_table_association.public[1]: Refreshing state... [id=rtbassoc-0e3fb78c8e7d70c9b]
aws_route_table_association.private[1]: Refreshing state... [id=rtbassoc-03fdfb58db0037657]
aws_route_table_association.private[0]: Refreshing state... [id=rtbassoc-031f6bccd0eb4dc16]
aws_route_table_association.public[0]: Refreshing state... [id=rtbassoc-0bbea73fd247fd37a]
aws_route.private[1]: Refreshing state... [id=r-rtb-0c66ce35bd1b8468b1080289494]
aws_route.private[0]: Refreshing state... [id=r-rtb-0697ec1580658f0df1080289494]

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create
  ~ update in-place
  - destroy
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_internet_gateway.da_iac02_igw will be updated in-place
  ~ resource "aws_internet_gateway" "da_iac02_igw" {
        arn      = "arn:aws:ec2:ap-southeast-2:348662207501:internet-gateway/igw-05674b4385ac18a67"
        id       = "igw-05674b4385ac18a67"
        owner_id = "348662207501"
        tags     = {
            "Name" = "gwInternet"
        }
      ~ vpc_id   = "vpc-095a4ba6da1dfd727" -> (known after apply)
    }

  # aws_nat_gateway.iac02nat[0] must be replaced
-/+ resource "aws_nat_gateway" "iac02nat" {
        allocation_id        = "eipalloc-0136cf297f583dec4"
      ~ id                   = "nat-01535a3c31e4899aa" -> (known after apply)
      ~ network_interface_id = "eni-099ebd2c95599e2fe" -> (known after apply)
      ~ private_ip           = "10.0.0.155" -> (known after apply)
      ~ public_ip            = "54.66.103.148" -> (known after apply)
      ~ subnet_id            = "subnet-04ef74673aa7debd8" -> (known after apply) # forces replacement
        tags                 = {
            "Name" = "iac02nat"
        }
    }

  # aws_nat_gateway.iac02nat[1] must be replaced
-/+ resource "aws_nat_gateway" "iac02nat" {
        allocation_id        = "eipalloc-0d9d62d9bed86578e"
      ~ id                   = "nat-0ec94965e344aa426" -> (known after apply)
      ~ network_interface_id = "eni-0465cea5155db1291" -> (known after apply)
      ~ private_ip           = "10.0.2.198" -> (known after apply)
      ~ public_ip            = "3.24.3.64" -> (known after apply)
      ~ subnet_id            = "subnet-00f924800d4f5ddc5" -> (known after apply) # forces replacement
        tags                 = {
            "Name" = "iac02nat"
        }
    }

  # aws_route.private[0] must be replaced
-/+ resource "aws_route" "private" {
        destination_cidr_block     = "0.0.0.0/0"
      + destination_prefix_list_id = (known after apply)
      + egress_only_gateway_id     = (known after apply)
      + gateway_id                 = (known after apply)
      ~ id                         = "r-rtb-0697ec1580658f0df1080289494" -> (known after apply)
      + instance_id                = (known after apply)
      + instance_owner_id          = (known after apply)
      ~ nat_gateway_id             = "nat-01535a3c31e4899aa" -> (known after apply)
      + network_interface_id       = (known after apply)
      ~ origin                     = "CreateRoute" -> (known after apply)
      ~ route_table_id             = "rtb-0697ec1580658f0df" -> (known after apply) # forces replacement
      ~ state                      = "active" -> (known after apply)
    }

  # aws_route.private[1] must be replaced
-/+ resource "aws_route" "private" {
        destination_cidr_block     = "0.0.0.0/0"
      + destination_prefix_list_id = (known after apply)
      + egress_only_gateway_id     = (known after apply)
      + gateway_id                 = (known after apply)
      ~ id                         = "r-rtb-0c66ce35bd1b8468b1080289494" -> (known after apply)
      + instance_id                = (known after apply)
      + instance_owner_id          = (known after apply)
      ~ nat_gateway_id             = "nat-0ec94965e344aa426" -> (known after apply)
      + network_interface_id       = (known after apply)
      ~ origin                     = "CreateRoute" -> (known after apply)
      ~ route_table_id             = "rtb-0c66ce35bd1b8468b" -> (known after apply) # forces replacement
      ~ state                      = "active" -> (known after apply)
    }

  # aws_route.public must be replaced
-/+ resource "aws_route" "public" {
        destination_cidr_block     = "0.0.0.0/0"
      + destination_prefix_list_id = (known after apply)
      + egress_only_gateway_id     = (known after apply)
        gateway_id                 = "igw-05674b4385ac18a67"
      ~ id                         = "r-rtb-02df7592db8ecaebf1080289494" -> (known after apply)
      + instance_id                = (known after apply)
      + instance_owner_id          = (known after apply)
      + nat_gateway_id             = (known after apply)
      + network_interface_id       = (known after apply)
      ~ origin                     = "CreateRoute" -> (known after apply)
      ~ route_table_id             = "rtb-02df7592db8ecaebf" -> (known after apply) # forces replacement
      ~ state                      = "active" -> (known after apply)
    }

  # aws_route_table.private[0] must be replaced
-/+ resource "aws_route_table" "private" {
      ~ id               = "rtb-0697ec1580658f0df" -> (known after apply)
      ~ owner_id         = "348662207501" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      ~ route            = [
          - {
              - cidr_block                = "0.0.0.0/0"
              - egress_only_gateway_id    = ""
              - gateway_id                = ""
              - instance_id               = ""
              - ipv6_cidr_block           = ""
              - nat_gateway_id            = "nat-01535a3c31e4899aa"
              - network_interface_id      = ""
              - transit_gateway_id        = ""
              - vpc_peering_connection_id = ""
            },
        ] -> (known after apply)
        tags             = {
            "Name" = "PrivateRouteTable"
        }
      ~ vpc_id           = "vpc-095a4ba6da1dfd727" -> (known after apply) # forces replacement
    }

  # aws_route_table.private[1] must be replaced
-/+ resource "aws_route_table" "private" {
      ~ id               = "rtb-0c66ce35bd1b8468b" -> (known after apply)
      ~ owner_id         = "348662207501" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      ~ route            = [
          - {
              - cidr_block                = "0.0.0.0/0"
              - egress_only_gateway_id    = ""
              - gateway_id                = ""
              - instance_id               = ""
              - ipv6_cidr_block           = ""
              - nat_gateway_id            = "nat-0ec94965e344aa426"
              - network_interface_id      = ""
              - transit_gateway_id        = ""
              - vpc_peering_connection_id = ""
            },
        ] -> (known after apply)
        tags             = {
            "Name" = "PrivateRouteTable"
        }
      ~ vpc_id           = "vpc-095a4ba6da1dfd727" -> (known after apply) # forces replacement
    }

  # aws_route_table.public must be replaced
-/+ resource "aws_route_table" "public" {
      ~ id               = "rtb-02df7592db8ecaebf" -> (known after apply)
      ~ owner_id         = "348662207501" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      ~ route            = [
          - {
              - cidr_block                = "0.0.0.0/0"
              - egress_only_gateway_id    = ""
              - gateway_id                = "igw-05674b4385ac18a67"
              - instance_id               = ""
              - ipv6_cidr_block           = ""
              - nat_gateway_id            = ""
              - network_interface_id      = ""
              - transit_gateway_id        = ""
              - vpc_peering_connection_id = ""
            },
        ] -> (known after apply)
        tags             = {
            "Name" = "PublicRouteTable"
        }
      ~ vpc_id           = "vpc-095a4ba6da1dfd727" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private[0] must be replaced
-/+ resource "aws_route_table_association" "private" {
      ~ id             = "rtbassoc-031f6bccd0eb4dc16" -> (known after apply)
      ~ route_table_id = "rtb-0697ec1580658f0df" -> (known after apply)
      ~ subnet_id      = "subnet-05c33af87974e3619" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private[1] must be replaced
-/+ resource "aws_route_table_association" "private" {
      ~ id             = "rtbassoc-03fdfb58db0037657" -> (known after apply)
      ~ route_table_id = "rtb-0c66ce35bd1b8468b" -> (known after apply)
      ~ subnet_id      = "subnet-0ba062b9607bd6775" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public[0] must be replaced
-/+ resource "aws_route_table_association" "public" {
      ~ id             = "rtbassoc-0bbea73fd247fd37a" -> (known after apply)
      ~ route_table_id = "rtb-02df7592db8ecaebf" -> (known after apply)
      ~ subnet_id      = "subnet-04ef74673aa7debd8" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public[1] must be replaced
-/+ resource "aws_route_table_association" "public" {
      ~ id             = "rtbassoc-0e3fb78c8e7d70c9b" -> (known after apply)
      ~ route_table_id = "rtb-02df7592db8ecaebf" -> (known after apply)
      ~ subnet_id      = "subnet-00f924800d4f5ddc5" -> (known after apply) # forces replacement
    }

  # aws_subnet.private[0] must be replaced
-/+ resource "aws_subnet" "private" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:348662207501:subnet/subnet-05c33af87974e3619" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
      ~ cidr_block                      = "10.0.3.0/24" -> "10.0.56.0/24" # forces replacement
      ~ id                              = "subnet-05c33af87974e3619" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "348662207501" -> (known after apply)
        tags                            = {
            "Name" = "PrivateSubnet"
        }
      ~ vpc_id                          = "vpc-095a4ba6da1dfd727" -> (known after apply) # forces replacement
    }

  # aws_subnet.private[1] must be replaced
-/+ resource "aws_subnet" "private" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:348662207501:subnet/subnet-0ba062b9607bd6775" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2b"
      ~ availability_zone_id            = "apse2-az3" -> (known after apply)
      ~ cidr_block                      = "10.0.4.0/24" -> "10.0.57.0/24" # forces replacement
      ~ id                              = "subnet-0ba062b9607bd6775" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "348662207501" -> (known after apply)
        tags                            = {
            "Name" = "PrivateSubnet"
        }
      ~ vpc_id                          = "vpc-095a4ba6da1dfd727" -> (known after apply) # forces replacement
    }

  # aws_subnet.public[0] will be destroyed
  - resource "aws_subnet" "public" {
      - arn                             = "arn:aws:ec2:ap-southeast-2:348662207501:subnet/subnet-04ef74673aa7debd8" -> null
      - assign_ipv6_address_on_creation = false -> null
      - availability_zone               = "ap-southeast-2a" -> null
      - availability_zone_id            = "apse2-az1" -> null
      - cidr_block                      = "10.0.0.0/24" -> null
      - id                              = "subnet-04ef74673aa7debd8" -> null
      - map_public_ip_on_launch         = true -> null
      - owner_id                        = "348662207501" -> null
      - tags                            = {
          - "Name" = "PublicSubnet"
        } -> null
      - vpc_id                          = "vpc-095a4ba6da1dfd727" -> null
    }

  # aws_subnet.public[1] will be destroyed
  - resource "aws_subnet" "public" {
      - arn                             = "arn:aws:ec2:ap-southeast-2:348662207501:subnet/subnet-00f924800d4f5ddc5" -> null
      - assign_ipv6_address_on_creation = false -> null
      - availability_zone               = "ap-southeast-2b" -> null
      - availability_zone_id            = "apse2-az3" -> null
      - cidr_block                      = "10.0.2.0/24" -> null
      - id                              = "subnet-00f924800d4f5ddc5" -> null
      - map_public_ip_on_launch         = true -> null
      - owner_id                        = "348662207501" -> null
      - tags                            = {
          - "Name" = "PublicSubnet"
        } -> null
      - vpc_id                          = "vpc-095a4ba6da1dfd727" -> null
    }

  # aws_subnet.publiciac03[0] will be created
  + resource "aws_subnet" "publiciac03" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "ap-southeast-2a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.0.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name" = "Publiciac03"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_subnet.publiciac03[1] will be created
  + resource "aws_subnet" "publiciac03" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "ap-southeast-2b"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.2.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name" = "Publiciac03"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_vpc.da_iac02_vpc must be replaced
-/+ resource "aws_vpc" "da_iac02_vpc" {
      ~ arn                              = "arn:aws:ec2:ap-southeast-2:348662207501:vpc/vpc-095a4ba6da1dfd727" -> (known after apply)
      ~ cidr_block                       = "10.0.0.0/16" -> "10.0.0.0/17" # forces replacement
      ~ default_network_acl_id           = "acl-0d24d0fd7f79516a5" -> (known after apply)
      ~ default_route_table_id           = "rtb-000c580041acbdb0c" -> (known after apply)
      ~ default_security_group_id        = "sg-0277723ff50b06196" -> (known after apply)
      ~ dhcp_options_id                  = "dopt-1ff7df78" -> (known after apply)
      ~ enable_classiclink               = false -> (known after apply)
      ~ enable_classiclink_dns_support   = false -> (known after apply)
        enable_dns_hostnames             = true
        enable_dns_support               = true
      ~ id                               = "vpc-095a4ba6da1dfd727" -> (known after apply)
        instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      ~ main_route_table_id              = "rtb-000c580041acbdb0c" -> (known after apply)
      ~ owner_id                         = "348662207501" -> (known after apply)
        tags                             = {
            "Name" = "da_iac02_vpc"
        }
    }

Plan: 17 to add, 1 to change, 17 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.