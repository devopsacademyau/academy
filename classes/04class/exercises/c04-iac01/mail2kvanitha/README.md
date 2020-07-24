 # C04-IAC01

  ## Terraform code 
  - [_backend.tf](_backend.tf)
  - [_provider.tf](_provider.tf)
  - [ec2.tf](ec2.tf)
  - [iam.tf](iam.tf)
  - [s3.tf](s3.tf)
  - [security-group.tf](security-group.tf)

  ## Command Execution Output
  - [output.txt](output.txt)

```
  $ terraform apply
    var.ec2_image_id
    EC2 AMI ID of the instance

    Enter a value: ami-0001f49b65fd1bd5e

   data.aws_availability_zones.class04-az: Refreshing state...

   An execution plan has been generated and is shown below.
   Resource actions are indicated with the following symbols:
    + create

   Terraform will perform the following actions:

    # aws_iam_instance_profile.class04-iam-instance-profile will be created
    + resource "aws_iam_instance_profile" "class04-iam-instance-profile" {
       + arn         = (known after apply)
       + create_date = (known after apply)
       + id          = (known after apply)
       + name        = "class04-iam-instance-profile"
       + path        = "/"
       + role        = "class04-iam-role"
       + roles       = (known after apply)
       + unique_id   = (known after apply)
      }

   # aws_iam_policy.class04-iam-policy will be created
   + resource "aws_iam_policy" "class04-iam-policy" {
      + arn         = (known after apply)
      + description = "Class04 IAM policy"
      + id          = (known after apply)
      + name        = "class04-iam-policy"
      + path        = "/"
      + policy      = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "s3:Get*",
                          + "s3:List*",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
    }

   # aws_iam_policy_attachment.class04-iam-policy-attach will be created
   + resource "aws_iam_policy_attachment" "class04-iam-policy-attach" {
      + id         = (known after apply)
      + name       = "class04-iam-policy-attach"
      + policy_arn = (known after apply)
      + roles      = [
          + "class04-iam-role",
        ]
    }

   # aws_iam_role.class04-iam-role will be created
   + resource "aws_iam_role" "class04-iam-role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                      + Sid       = ""
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + max_session_duration  = 3600
      + name                  = "class04-iam-role"
      + path                  = "/"
      + tags                  = {
          + "tag-key" = "class04-s3-readonly-role"
        }
      + unique_id             = (known after apply)
    }

   # aws_iam_role_policy_attachment.class04-iam-role-policy-attach will be created
   + resource "aws_iam_role_policy_attachment" "class04-iam-role-policy-attach" {
      + id         = (known after apply)
      + policy_arn = (known after apply)
      + role       = "class04-iam-role"
    }

   # aws_instance.class04-ec2 will be created
   + resource "aws_instance" "class04-ec2" {
      + ami                          = "ami-0001f49b65fd1bd5e"
      + arn                          = (known after apply)
      + associate_public_ip_address  = true
      + availability_zone            = (known after apply)
      + cpu_core_count               = (known after apply)
      + cpu_threads_per_core         = (known after apply)
      + get_password_data            = false
      + host_id                      = (known after apply)
      + iam_instance_profile         = "class04-iam-instance-profile"
      + id                           = (known after apply)
      + instance_state               = (known after apply)
      + instance_type                = "t2.micro"
      + ipv6_address_count           = (known after apply)
      + ipv6_addresses               = (known after apply)
      + key_name                     = "class04-ec2-key"
      + network_interface_id         = (known after apply)
      + outpost_arn                  = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      + primary_network_interface_id = (known after apply)
      + private_dns                  = (known after apply)
      + private_ip                   = (known after apply)
      + public_dns                   = (known after apply)
      + public_ip                    = (known after apply)
      + security_groups              = (known after apply)
      + source_dest_check            = true
      + subnet_id                    = (known after apply)
      + tenancy                      = (known after apply)
      + volume_tags                  = (known after apply)
      + vpc_security_group_ids       = (known after apply)

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

      + metadata_options {
          + http_endpoint               = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

   # aws_internet_gateway.class04-igw will be created
   + resource "aws_internet_gateway" "class04-igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "class04-igw"
        }
      + vpc_id   = (known after apply)
    }

   # aws_key_pair.class04-ec2-key will be created
   + resource "aws_key_pair" "class04-ec2-key" {
      + arn         = (known after apply)
      + fingerprint = (known after apply)
      + id          = (known after apply)
      + key_name    = "class04-ec2-key"
      + key_pair_id = (known after apply)
       + public_key  = "ssh-rsa AAAAB3NzaCxty1yc2EAAAADAQABAAABAQCyDZgvl/gEJCNvS2x1kjcoOCZvPhP41c0OeSuIUkRCKwmYCJN4/qOBP+0dHFM7Mm69wKIBrWT71nyO2IH56C0EVf5mIao8p97U/vL1VmFDeyxSCAmeJ4IM5TF6gXpeUKMHXuhCOBaXrnsC/pSuv6UdCl4SRlkOCJmnug3ijXKS+aY5eViRfsCJ5LjJ3S7XGbpJFoq+PMgleRmzMc7FVEzf90mHNOAk5fW6pQdvTFyy9yHjQCzCedJNWumKVtytpACwRmNnYJd+firXODU7toYnPEaj0X1Tf1iRalobTSgVQ9EXNdCslBVdNQwsvRATi1gm+Dqu6ysCZ++MvZnYC7df WEBSERVER"
     }

   # aws_main_route_table_association.class04-rt-association will be created
  + resource "aws_main_route_table_association" "class04-rt-association" {
      + id                      = (known after apply)
      + original_route_table_id = (known after apply)
      + route_table_id          = (known after apply)
      + vpc_id                  = (known after apply)
    }

   # aws_route_table.class04-routetable will be created
   + resource "aws_route_table" "class04-routetable" {
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
          + "Name" = "class04-routetable"
        }
      + vpc_id           = (known after apply)
    }

   # aws_s3_bucket.class04-bucket will be created
   + resource "aws_s3_bucket" "class04-bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = "private"
      + arn                         = (known after apply)
      + bucket                      = "class04-s3-bucket04"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "Environment" = "Dev"
          + "Name"        = "class04-s3-bucket04"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }
    }

   # aws_security_group.class04-sg will be created
   + resource "aws_security_group" "class04-sg" {
      + arn                    = (known after apply)
      + description            = "Class04 Security Group"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow SSH Connectivity"
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
        ]
      + name                   = "class04-sg"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "class04-sg"
        }
      + vpc_id                 = (known after apply)
    }

   # aws_subnet.class04-subnet will be created
   + resource "aws_subnet" "class04-subnet" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "ap-southeast-2a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "20.0.1.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name" = "class04-subnet"
        }
      + vpc_id                          = (known after apply)
    }

   # aws_vpc.class04-vpc will be created
   + resource "aws_vpc" "class04-vpc" {
       + arn                              = (known after apply)
       + assign_generated_ipv6_cidr_block = false
       + cidr_block                       = "20.0.0.0/16"
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
     }
 
 Plan: 14 to add, 0 to change, 0 to destroy.
 
 Do you want to perform these actions?
   Terraform will perform the actions described above.
   Only 'yes' will be accepted to approve.

   Enter a value: yes

 aws_iam_policy.class04-iam-policy: Creating...
 aws_key_pair.class04-ec2-key: Creating...
 aws_iam_role.class04-iam-role: Creating...
 aws_vpc.class04-vpc: Creating...
 aws_s3_bucket.class04-bucket: Creating...
 aws_key_pair.class04-ec2-key: Creation complete after 1s [id=class04-ec2-key]
 aws_iam_role.class04-iam-role: Creation complete after 2s [id=class04-iam-role]
 aws_iam_instance_profile.class04-iam-instance-profile: Creating...
 aws_iam_policy.class04-iam-policy: Creation complete after 3s [id=arn:aws:iam::823151257518:policy/class04-iam-policy]
 aws_iam_role_policy_attachment.class04-iam-role-policy-attach: Creating...
 aws_iam_policy_attachment.class04-iam-policy-attach: Creating...
 aws_vpc.class04-vpc: Creation complete after 4s [id=vpc-0f91661994c0a14b5]
 aws_internet_gateway.class04-igw: Creating...
 aws_subnet.class04-subnet: Creating...
 aws_security_group.class04-sg: Creating...
 aws_subnet.class04-subnet: Creation complete after 1s [id=subnet-0fa14cb0a689ea751]
 aws_iam_role_policy_attachment.class04-iam-role-policy-attach: Creation complete after 3s [id=class04-iam-role-20200724065529621700000001]
 aws_iam_instance_profile.class04-iam-instance-profile: Creation complete after 4s [id=class04-iam-instance-profile]
 aws_internet_gateway.class04-igw: Creation complete after 2s [id=igw-03953ead7ad09fa71]
 aws_route_table.class04-routetable: Creating...
 aws_iam_policy_attachment.class04-iam-policy-attach: Creation complete after 4s [id=class04-iam-policy-attach]
 aws_s3_bucket.class04-bucket: Creation complete after 7s [id=class04-s3-bucket04]
 aws_security_group.class04-sg: Creation complete after 3s [id=sg-0b579f8bb20a9e029]
 aws_instance.class04-ec2: Creating...
 aws_route_table.class04-routetable: Creation complete after 1s [id=rtb-08d84cc2a022f59c3]
 aws_main_route_table_association.class04-rt-association: Creating...
 aws_main_route_table_association.class04-rt-association: Creation complete after 1s [id=rtbassoc-05dc767aaca97d3a2]
 aws_instance.class04-ec2: Still creating... [10s elapsed]
 aws_instance.class04-ec2: Still creating... [20s elapsed]
 aws_instance.class04-ec2: Still creating... [30s elapsed]
 aws_instance.class04-ec2: Creation complete after 34s [id=i-0bea4063ea9123b34]

 Apply complete! Resources: 14 added, 0 changed, 0 destroyed.

 The state of your infrastructure has been saved to the path
 below. This state is required to modify and destroy your
 infrastructure, so keep it safe. To inspect the complete state
 use the `terraform show` command.

 State path: /Users/vanithak/project1/terraform.tfstate

 Outputs:

 bucket = class04-s3-bucket04
 bucket_arn = arn:aws:s3:::class04-s3-bucket04
 bucket_domain_name = class04-s3-bucket04.s3.amazonaws.com
 bucket_id = class04-s3-bucket04
 ec2_instance_id = i-0bea4063ea9123b34
 ec2_public_ip = 3.24.138.61
 route_table_id = rtb-08d84cc2a022f59c3
 security_group_id = sg-0b579f8bb20a9e029
 subnet_id = subnet-0fa14cb0a689ea751
 vpc_id = vpc-0f91661994c0a14b5
```
- VERIFICATION STEP:
```
 $ ssh -i "~/AWS/AWS_Console/WEBSERVER.pem" ubuntu@3.24.138.61
 The authenticity of host '3.24.138.61 (3.24.138.61)' can't be established.
 ECDSA key fingerprint is SHA256:M3MrWs+k3pPG5QgtOaAd5R4xFuf8vr1w3RHRDhJ3QDE.
 Are you sure you want to continue connecting (yes/no)? yes
 Warning: Permanently added '3.24.138.61' (ECDSA) to the list of known hosts.
 Welcome to Ubuntu 16.04.6 LTS (GNU/Linux 4.4.0-1075-aws x86_64)

  * Documentation:  https://help.ubuntu.com
  * Management:     https://landscape.canonical.com
  * Support:        https://ubuntu.com/advantage

   Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud

 344 packages can be updated.
 279 updates are security updates.



 The programs included with the Ubuntu system are free software;
 the exact distribution terms for each program are described in the
 individual files in /usr/share/doc/*/copyright.

 Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
 applicable law.

 To run a command as administrator (user "root"), use "sudo <command>".
 See "man sudo_root" for details.

 :~ $ aws s3 ls
 2020-07-24 06:55:27 class04-s3-bucket04
 2020-06-29 09:57:12 www.invoicedemowebpage.com
 :~ $ 




<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c04-iac01](https://github.com/devopsacademyau/academy/blob/c41e824fb2a2c55e3a30b2371a87e3a7551b6741/classes/04class/exercises/c04-iac01/README.md)
```
