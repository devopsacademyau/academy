# C04-IAC03

## Terraform plan output

➜  mrcsmonteiro git:(mrcsmonteiro/c04-iac03) ✗ terraform plan -var-file="main.tfvars"
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

aws_eip.devopsacademy_iac_eip: Refreshing state... [id=eipalloc-0f649f60f952f683d]
aws_vpc.devops_academy_iac_vpc: Refreshing state... [id=vpc-01770a00b012a0655]
aws_internet_gateway.devopsacademy_iac_igw: Refreshing state... [id=igw-046278af17074a327]
aws_subnet.devops_academy_iac_private_subnet_2: Refreshing state... [id=subnet-03262b13bf890a258]
aws_default_security_group.default: Refreshing state... [id=sg-00f0dd18db0c97f39]
aws_subnet.devops_academy_iac_private_subnet_1: Refreshing state... [id=subnet-0776039d144ab1bfa]
aws_security_group.devops_academy_sg: Refreshing state... [id=sg-012c0171072df764d]
aws_subnet.devops_academy_iac_public_subnet_2: Refreshing state... [id=subnet-0943deb77b7e900c4]
aws_subnet.devops_academy_iac_public_subnet_1: Refreshing state... [id=subnet-04c62c0f23beaa25b]
aws_route_table.devopsacademy_iac_public_rt: Refreshing state... [id=rtb-017f514e0ca7fae48]
aws_instance.private: Refreshing state... [id=i-0688eeeb3fdac2098]
aws_nat_gateway.devopsacademy_iac_nat_gw: Refreshing state... [id=nat-0eec09c8de0ddf64a]
aws_instance.bastion: Refreshing state... [id=i-0f7afc599428a2097]
aws_route_table_association.devopsacademy-iac-public-rt-assoc-1: Refreshing state... [id=rtbassoc-063f44c396a0541b1]
aws_route_table_association.devopsacademy-iac-public-rt-assoc-2: Refreshing state... [id=rtbassoc-02fb8be9d32b35c0e]
aws_route_table.devopsacademy_iac_private_rt: Refreshing state... [id=rtb-0645f8db7bba86b04]
aws_route_table_association.devopsacademy-iac-private-rt-assoc-1: Refreshing state... [id=rtbassoc-0ba08627eecccc4b4]
aws_route_table_association.devopsacademy-iac-private-rt-assoc-2: Refreshing state... [id=rtbassoc-004fb6f90b950cb43]

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_default_security_group.default must be replaced
-/+ resource "aws_default_security_group" "default" {
      ~ arn                    = "arn:aws:ec2:ap-southeast-2:149613515908:security-group/sg-00f0dd18db0c97f39" -> (known after apply)
      ~ description            = "default VPC security group" -> (known after apply)
        egress                 = [
            {
                cidr_blocks      = [
                    "0.0.0.0/0",
                ]
                description      = ""
                from_port        = 0
                ipv6_cidr_blocks = []
                prefix_list_ids  = []
                protocol         = "-1"
                security_groups  = []
                self             = false
                to_port          = 0
            },
        ]
      ~ id                     = "sg-00f0dd18db0c97f39" -> (known after apply)
        ingress                = [
            {
                cidr_blocks      = [
                    "10.20.0.0/16",
                ]
                description      = "Allow SSH traffic from DevOps Academy VPC"
                from_port        = 22
                ipv6_cidr_blocks = []
                prefix_list_ids  = []
                protocol         = "tcp"
                security_groups  = []
                self             = false
                to_port          = 22
            },
        ]
      ~ name                   = "default" -> (known after apply)
      ~ owner_id               = "149613515908" -> (known after apply)
        revoke_rules_on_delete = false
        tags                   = {
            "Name" = "DevOps Academy Default SG"
        }
      ~ vpc_id                 = "vpc-01770a00b012a0655" -> (known after apply) # forces replacement
    }

  # aws_instance.bastion must be replaced
-/+ resource "aws_instance" "bastion" {
        ami                          = "ami-0a58e22c727337c51"
      ~ arn                          = "arn:aws:ec2:ap-southeast-2:149613515908:instance/i-0f7afc599428a2097" -> (known after apply)
      ~ associate_public_ip_address  = true -> (known after apply)
      ~ availability_zone            = "ap-southeast-2a" -> (known after apply)
      ~ cpu_core_count               = 1 -> (known after apply)
      ~ cpu_threads_per_core         = 1 -> (known after apply)
      - disable_api_termination      = false -> null
      - ebs_optimized                = false -> null
        get_password_data            = false
      - hibernation                  = false -> null
      + host_id                      = (known after apply)
      ~ id                           = "i-0f7afc599428a2097" -> (known after apply)
      ~ instance_state               = "running" -> (known after apply)
        instance_type                = "t2.micro"
      ~ ipv6_address_count           = 0 -> (known after apply)
      ~ ipv6_addresses               = [] -> (known after apply)
        key_name                     = "DevOpsAcademy"
      - monitoring                   = false -> null
      + network_interface_id         = (known after apply)
      + outpost_arn                  = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      ~ primary_network_interface_id = "eni-0fe6f0b8ca31d6378" -> (known after apply)
      ~ private_dns                  = "ip-10-20-1-98.ap-southeast-2.compute.internal" -> (known after apply)
      ~ private_ip                   = "10.20.1.98" -> (known after apply)
      ~ public_dns                   = "ec2-13-210-195-66.ap-southeast-2.compute.amazonaws.com" -> (known after apply)
      ~ public_ip                    = "13.210.195.66" -> (known after apply)
      ~ security_groups              = [] -> (known after apply)
        source_dest_check            = true
      ~ subnet_id                    = "subnet-04c62c0f23beaa25b" -> (known after apply) # forces replacement
        tags                         = {
            "Name" = "DevOps Academy Public Instance"
        }
      ~ tenancy                      = "default" -> (known after apply)
      ~ volume_tags                  = {} -> (known after apply)
      ~ vpc_security_group_ids       = [
          - "sg-012c0171072df764d",
        ] -> (known after apply)

      - credit_specification {
          - cpu_credits = "standard" -> null
        }

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      ~ metadata_options {
          ~ http_endpoint               = "enabled" -> (known after apply)
          ~ http_put_response_hop_limit = 1 -> (known after apply)
          ~ http_tokens                 = "optional" -> (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      ~ root_block_device {
          ~ delete_on_termination = true -> (known after apply)
          ~ device_name           = "/dev/xvda" -> (known after apply)
          ~ encrypted             = false -> (known after apply)
          ~ iops                  = 100 -> (known after apply)
          + kms_key_id            = (known after apply)
          ~ volume_id             = "vol-07985f6751572d184" -> (known after apply)
          ~ volume_size           = 8 -> (known after apply)
          ~ volume_type           = "gp2" -> (known after apply)
        }
    }

  # aws_instance.private must be replaced
-/+ resource "aws_instance" "private" {
        ami                          = "ami-0a58e22c727337c51"
      ~ arn                          = "arn:aws:ec2:ap-southeast-2:149613515908:instance/i-0688eeeb3fdac2098" -> (known after apply)
      ~ associate_public_ip_address  = false -> (known after apply)
      ~ availability_zone            = "ap-southeast-2a" -> (known after apply)
      ~ cpu_core_count               = 1 -> (known after apply)
      ~ cpu_threads_per_core         = 1 -> (known after apply)
      - disable_api_termination      = false -> null
      - ebs_optimized                = false -> null
        get_password_data            = false
      - hibernation                  = false -> null
      + host_id                      = (known after apply)
      ~ id                           = "i-0688eeeb3fdac2098" -> (known after apply)
      ~ instance_state               = "running" -> (known after apply)
        instance_type                = "t2.micro"
      ~ ipv6_address_count           = 0 -> (known after apply)
      ~ ipv6_addresses               = [] -> (known after apply)
        key_name                     = "DevOpsAcademy"
      - monitoring                   = false -> null
      + network_interface_id         = (known after apply)
      + outpost_arn                  = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      ~ primary_network_interface_id = "eni-047d101290005063d" -> (known after apply)
      ~ private_dns                  = "ip-10-20-3-76.ap-southeast-2.compute.internal" -> (known after apply)
      ~ private_ip                   = "10.20.3.76" -> (known after apply)
      + public_dns                   = (known after apply)
      + public_ip                    = (known after apply)
      ~ security_groups              = [] -> (known after apply)
        source_dest_check            = true
      ~ subnet_id                    = "subnet-0776039d144ab1bfa" -> (known after apply) # forces replacement
        tags                         = {
            "Name" = "DevOps Academy Private Instance"
        }
      ~ tenancy                      = "default" -> (known after apply)
      ~ volume_tags                  = {} -> (known after apply)
      ~ vpc_security_group_ids       = [
          - "sg-00f0dd18db0c97f39",
        ] -> (known after apply)

      - credit_specification {
          - cpu_credits = "standard" -> null
        }

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      ~ metadata_options {
          ~ http_endpoint               = "enabled" -> (known after apply)
          ~ http_put_response_hop_limit = 1 -> (known after apply)
          ~ http_tokens                 = "optional" -> (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      ~ root_block_device {
          ~ delete_on_termination = true -> (known after apply)
          ~ device_name           = "/dev/xvda" -> (known after apply)
          ~ encrypted             = false -> (known after apply)
          ~ iops                  = 100 -> (known after apply)
          + kms_key_id            = (known after apply)
          ~ volume_id             = "vol-065ee4db669cb3864" -> (known after apply)
          ~ volume_size           = 8 -> (known after apply)
          ~ volume_type           = "gp2" -> (known after apply)
        }
    }

  # aws_internet_gateway.devopsacademy_iac_igw will be updated in-place
  ~ resource "aws_internet_gateway" "devopsacademy_iac_igw" {
        arn      = "arn:aws:ec2:ap-southeast-2:149613515908:internet-gateway/igw-046278af17074a327"
        id       = "igw-046278af17074a327"
        owner_id = "149613515908"
        tags     = {
            "Name" = "devopsacademy-iac-igw"
        }
      ~ vpc_id   = "vpc-01770a00b012a0655" -> (known after apply)
    }

  # aws_nat_gateway.devopsacademy_iac_nat_gw must be replaced
-/+ resource "aws_nat_gateway" "devopsacademy_iac_nat_gw" {
        allocation_id        = "eipalloc-0f649f60f952f683d"
      ~ id                   = "nat-0eec09c8de0ddf64a" -> (known after apply)
      ~ network_interface_id = "eni-0ff1f9c860434fcd2" -> (known after apply)
      ~ private_ip           = "10.20.1.39" -> (known after apply)
      ~ public_ip            = "3.104.67.205" -> (known after apply)
      ~ subnet_id            = "subnet-04c62c0f23beaa25b" -> (known after apply) # forces replacement
        tags                 = {
            "Name" = "devopsacademy-iac-nat-gw"
        }
    }

  # aws_route_table.devopsacademy_iac_private_rt must be replaced
-/+ resource "aws_route_table" "devopsacademy_iac_private_rt" {
      ~ id               = "rtb-0645f8db7bba86b04" -> (known after apply)
      ~ owner_id         = "149613515908" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      ~ route            = [
          - {
              - cidr_block                = "0.0.0.0/0"
              - egress_only_gateway_id    = ""
              - gateway_id                = ""
              - instance_id               = ""
              - ipv6_cidr_block           = ""
              - nat_gateway_id            = "nat-0eec09c8de0ddf64a"
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
            "Name" = "devopsacademy-iac-private-rt"
        }
      ~ vpc_id           = "vpc-01770a00b012a0655" -> (known after apply) # forces replacement
    }

  # aws_route_table.devopsacademy_iac_public_rt must be replaced
-/+ resource "aws_route_table" "devopsacademy_iac_public_rt" {
      ~ id               = "rtb-017f514e0ca7fae48" -> (known after apply)
      ~ owner_id         = "149613515908" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
        route            = [
            {
                cidr_block                = "0.0.0.0/0"
                egress_only_gateway_id    = ""
                gateway_id                = "igw-046278af17074a327"
                instance_id               = ""
                ipv6_cidr_block           = ""
                nat_gateway_id            = ""
                network_interface_id      = ""
                transit_gateway_id        = ""
                vpc_peering_connection_id = ""
            },
        ]
        tags             = {
            "Name" = "devopsacademy-iac-public-rt"
        }
      ~ vpc_id           = "vpc-01770a00b012a0655" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.devopsacademy-iac-private-rt-assoc-1 must be replaced
-/+ resource "aws_route_table_association" "devopsacademy-iac-private-rt-assoc-1" {
      ~ id             = "rtbassoc-0ba08627eecccc4b4" -> (known after apply)
      ~ route_table_id = "rtb-0645f8db7bba86b04" -> (known after apply)
      ~ subnet_id      = "subnet-0776039d144ab1bfa" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.devopsacademy-iac-private-rt-assoc-2 must be replaced
-/+ resource "aws_route_table_association" "devopsacademy-iac-private-rt-assoc-2" {
      ~ id             = "rtbassoc-004fb6f90b950cb43" -> (known after apply)
      ~ route_table_id = "rtb-0645f8db7bba86b04" -> (known after apply)
      ~ subnet_id      = "subnet-03262b13bf890a258" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.devopsacademy-iac-public-rt-assoc-1 must be replaced
-/+ resource "aws_route_table_association" "devopsacademy-iac-public-rt-assoc-1" {
      ~ id             = "rtbassoc-063f44c396a0541b1" -> (known after apply)
      ~ route_table_id = "rtb-017f514e0ca7fae48" -> (known after apply)
      ~ subnet_id      = "subnet-04c62c0f23beaa25b" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.devopsacademy-iac-public-rt-assoc-2 must be replaced
-/+ resource "aws_route_table_association" "devopsacademy-iac-public-rt-assoc-2" {
      ~ id             = "rtbassoc-02fb8be9d32b35c0e" -> (known after apply)
      ~ route_table_id = "rtb-017f514e0ca7fae48" -> (known after apply)
      ~ subnet_id      = "subnet-0943deb77b7e900c4" -> (known after apply) # forces replacement
    }

  # aws_security_group.devops_academy_sg must be replaced
-/+ resource "aws_security_group" "devops_academy_sg" {
      ~ arn                    = "arn:aws:ec2:ap-southeast-2:149613515908:security-group/sg-012c0171072df764d" -> (known after apply)
        description            = "Allow SSH traffic"
        egress                 = [
            {
                cidr_blocks      = [
                    "0.0.0.0/0",
                ]
                description      = "Allow ALL outbound traffic"
                from_port        = 0
                ipv6_cidr_blocks = []
                prefix_list_ids  = []
                protocol         = "-1"
                security_groups  = []
                self             = false
                to_port          = 0
            },
        ]
      ~ id                     = "sg-012c0171072df764d" -> (known after apply)
        ingress                = [
            {
                cidr_blocks      = [
                    "220.253.7.163/32",
                ]
                description      = "Allow SSH for Admin only"
                from_port        = 22
                ipv6_cidr_blocks = []
                prefix_list_ids  = []
                protocol         = "tcp"
                security_groups  = []
                self             = false
                to_port          = 22
            },
        ]
        name                   = "devops-academy-sg"
      ~ owner_id               = "149613515908" -> (known after apply)
        revoke_rules_on_delete = false
        tags                   = {
            "Name" = "DevOps Academy SG"
        }
      ~ vpc_id                 = "vpc-01770a00b012a0655" -> (known after apply) # forces replacement
    }

  # aws_subnet.devops_academy_iac_private_subnet_1 must be replaced
-/+ resource "aws_subnet" "devops_academy_iac_private_subnet_1" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:149613515908:subnet/subnet-0776039d144ab1bfa" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
        cidr_block                      = "10.20.3.0/24"
      ~ id                              = "subnet-0776039d144ab1bfa" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "149613515908" -> (known after apply)
        tags                            = {
            "Name" = "devopsacademy-iac-private-a"
        }
      ~ vpc_id                          = "vpc-01770a00b012a0655" -> (known after apply) # forces replacement
    }

  # aws_subnet.devops_academy_iac_private_subnet_2 must be replaced
-/+ resource "aws_subnet" "devops_academy_iac_private_subnet_2" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:149613515908:subnet/subnet-03262b13bf890a258" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
        cidr_block                      = "10.20.4.0/24"
      ~ id                              = "subnet-03262b13bf890a258" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "149613515908" -> (known after apply)
        tags                            = {
            "Name" = "devopsacademy-iac-private-b"
        }
      ~ vpc_id                          = "vpc-01770a00b012a0655" -> (known after apply) # forces replacement
    }

  # aws_subnet.devops_academy_iac_public_subnet_1 must be replaced
-/+ resource "aws_subnet" "devops_academy_iac_public_subnet_1" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:149613515908:subnet/subnet-04c62c0f23beaa25b" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
      ~ cidr_block                      = "10.20.1.0/24" -> "10.30.1.0/24" # forces replacement
      ~ id                              = "subnet-04c62c0f23beaa25b" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = true
      ~ owner_id                        = "149613515908" -> (known after apply)
        tags                            = {
            "Name" = "devopsacademy-iac-public-a"
        }
      ~ vpc_id                          = "vpc-01770a00b012a0655" -> (known after apply) # forces replacement
    }

  # aws_subnet.devops_academy_iac_public_subnet_2 must be replaced
-/+ resource "aws_subnet" "devops_academy_iac_public_subnet_2" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:149613515908:subnet/subnet-0943deb77b7e900c4" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2b"
      ~ availability_zone_id            = "apse2-az3" -> (known after apply)
        cidr_block                      = "10.20.2.0/24"
      ~ id                              = "subnet-0943deb77b7e900c4" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = true
      ~ owner_id                        = "149613515908" -> (known after apply)
      ~ tags                            = {
          ~ "Name" = "devopsacademy-iac-public-b" -> "devopsacademy-iac-new-public-b"
        }
      ~ vpc_id                          = "vpc-01770a00b012a0655" -> (known after apply) # forces replacement
    }

  # aws_vpc.devops_academy_iac_vpc must be replaced
-/+ resource "aws_vpc" "devops_academy_iac_vpc" {
      ~ arn                              = "arn:aws:ec2:ap-southeast-2:149613515908:vpc/vpc-01770a00b012a0655" -> (known after apply)
        assign_generated_ipv6_cidr_block = false
      ~ cidr_block                       = "10.20.0.0/16" -> "10.30.0.0/16" # forces replacement
      ~ default_network_acl_id           = "acl-0fee1c719f3710bca" -> (known after apply)
      ~ default_route_table_id           = "rtb-0c065a656972e6e85" -> (known after apply)
      ~ default_security_group_id        = "sg-00f0dd18db0c97f39" -> (known after apply)
      ~ dhcp_options_id                  = "dopt-2267ed46" -> (known after apply)
      ~ enable_classiclink               = false -> (known after apply)
      ~ enable_classiclink_dns_support   = false -> (known after apply)
        enable_dns_hostnames             = true
        enable_dns_support               = true
      ~ id                               = "vpc-01770a00b012a0655" -> (known after apply)
        instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      ~ main_route_table_id              = "rtb-0c065a656972e6e85" -> (known after apply)
      ~ owner_id                         = "149613515908" -> (known after apply)
        tags                             = {
            "Name" = "devopsacademy-iac"
        }
    }

Plan: 16 to add, 1 to change, 16 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.

***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/205c822cbdcd0fd791608eed129941bbee16ce5f/classes/04class/exercises/c04-iac03/README.md)