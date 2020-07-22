# C04-IAC03

## Attachment

- [Exercise C04-IAC02](../../c04-iac02/alanlima/README.md)

## Variables changes

```diff
devops_class = "c04-iac02"
- vpc_cidr     = "10.0.0.0/16"
+ vpc_cidr     = "10.0.0.0/18"

common_tags = {
  devops-class = "c04-iac02"
  deployed-by  = "terraform"
}

public_subnets = {
  public_1 = {
-    cidr_block = "10.0.10.0/24"
+    cidr_block = "10.0.15.0/24"
    zone       = "ap-southeast-2a"
  }
-  public_2 = {
+  public_2_modified = {
    cidr_block = "10.0.11.0/24"
    zone       = "ap-southeast-2b"
  }
}

private_subnets = {
  private_1 = {
    cidr_block = "10.0.20.0/24"
    zone       = "ap-southeast-2a"
  }
  private_2 = {
    cidr_block = "10.0.21.0/24"
    zone       = "ap-southeast-2b"
  }
}
```
## Terraform plan output

```diff
$ terraform plan
Running plan in the remote backend. Output will stream here. Pressing Ctrl-C
will stop streaming the logs, but will not stop the plan running remotely.

Preparing the remote plan...

To view this run in a browser, visit:
https://app.terraform.io/app/alima-devopsacademy/c04-iac02/runs/run-2fmuBwLdAKjwQ9cR

Waiting for the plan to start...

Terraform v0.12.28
Configuring remote state backend...
Initializing Terraform configuration...
2020/07/22 21:03:05 [DEBUG] Using modified User-Agent: Terraform/0.12.28 TFC/6fc70e0a03
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

aws_vpc.vpc_devops: Refreshing state... [id=vpc-00286e3d12682c421]
aws_eip.nat: Refreshing state... [id=eipalloc-0a5327e1d2ab6797e]
aws_internet_gateway.igw_devops: Refreshing state... [id=igw-01335242f48594ae4]
aws_subnet.private["private_1"]: Refreshing state... [id=subnet-0cf9db45bc152934a]
aws_subnet.public["public_1"]: Refreshing state... [id=subnet-0bacc051bdd1ff5b0]
aws_subnet.public["public_2"]: Refreshing state... [id=subnet-0503b83119c75c873]
aws_subnet.private["private_2"]: Refreshing state... [id=subnet-0c5ee1e9049a87cfb]
aws_route_table.rt_public: Refreshing state... [id=rtb-098ac6caa2e5baa83]
aws_nat_gateway.ngw_devops: Refreshing state... [id=nat-04f64e05b72779079]
aws_route_table_association.public_route_link["public_2"]: Refreshing state... [id=rtbassoc-04299060f0ad45e65]
aws_route_table_association.public_route_link["public_1"]: Refreshing state... [id=rtbassoc-0c37c1aea2fa57dc1]
aws_route_table.rt_private: Refreshing state... [id=rtb-0f2e79389dc13c02e]
aws_route_table_association.private_route_link["private_1"]: Refreshing state... [id=rtbassoc-0e5342c4a6f6e9047]
aws_route_table_association.private_route_link["private_2"]: Refreshing state... [id=rtbassoc-0d3655e2dce574467]

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create
  ~ update in-place
  - destroy
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_internet_gateway.igw_devops will be updated in-place
~ resource "aws_internet_gateway" "igw_devops" {
        arn      = "arn:aws:ec2:ap-southeast-2:097922957316:internet-gateway/igw-01335242f48594ae4"
        id       = "igw-01335242f48594ae4"
        owner_id = "097922957316"
        tags     = {
            "Name"         = "devops-igw"
            "deployed-by"  = "terraform"
            "devops-class" = "c04-iac02"
        }
      ~ vpc_id   = "vpc-00286e3d12682c421" -> (known after apply)
    }

  # aws_nat_gateway.ngw_devops must be replaced
-/+ resource "aws_nat_gateway" "ngw_devops" {
        allocation_id        = "eipalloc-0a5327e1d2ab6797e"
      ~ id                   = "nat-04f64e05b72779079" -> (known after apply)
      ~ network_interface_id = "eni-0d7a79717ebe4baa9" -> (known after apply)
      ~ private_ip           = "10.0.10.100" -> (known after apply)
      ~ public_ip            = "52.62.144.34" -> (known after apply)
      ~ subnet_id            = "subnet-0bacc051bdd1ff5b0" -> (known after apply) # forces replacement
        tags                 = {
            "Name"         = "devops-ngw"
            "deployed-by"  = "terraform"
            "devops-class" = "c04-iac02"
        }
    }

  # aws_route_table.rt_private must be replaced
-/+ resource "aws_route_table" "rt_private" {
      ~ id               = "rtb-0f2e79389dc13c02e" -> (known after apply)
      ~ owner_id         = "097922957316" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      ~ route            = [
          - {
              - cidr_block                = "0.0.0.0/0"
              - egress_only_gateway_id    = ""
              - gateway_id                = ""
              - instance_id               = ""
              - ipv6_cidr_block           = ""
              - nat_gateway_id            = "nat-04f64e05b72779079"
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
            "Name"         = "devops-private-rt"
            "deployed-by"  = "terraform"
            "devops-class" = "c04-iac02"
        }
      ~ vpc_id           = "vpc-00286e3d12682c421" -> (known after apply) # forces replacement
    }

  # aws_route_table.rt_public must be replaced
-/+ resource "aws_route_table" "rt_public" {
      ~ id               = "rtb-098ac6caa2e5baa83" -> (known after apply)
      ~ owner_id         = "097922957316" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
        route            = [
            {
                cidr_block                = "0.0.0.0/0"
                egress_only_gateway_id    = ""
                gateway_id                = "igw-01335242f48594ae4"
                instance_id               = ""
                ipv6_cidr_block           = ""
                nat_gateway_id            = ""
                network_interface_id      = ""
                transit_gateway_id        = ""
                vpc_peering_connection_id = ""
            },
        ]
        tags             = {
            "Name"         = "devops-public-rt"
            "deployed-by"  = "terraform"
            "devops-class" = "c04-iac02"
        }
      ~ vpc_id           = "vpc-00286e3d12682c421" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private_route_link["private_1"] must be replaced
-/+ resource "aws_route_table_association" "private_route_link" {
      ~ id             = "rtbassoc-0e5342c4a6f6e9047" -> (known after apply)
      ~ route_table_id = "rtb-0f2e79389dc13c02e" -> (known after apply)
      ~ subnet_id      = "subnet-0cf9db45bc152934a" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private_route_link["private_2"] must be replaced
-/+ resource "aws_route_table_association" "private_route_link" {
      ~ id             = "rtbassoc-0d3655e2dce574467" -> (known after apply)
      ~ route_table_id = "rtb-0f2e79389dc13c02e" -> (known after apply)
      ~ subnet_id      = "subnet-0c5ee1e9049a87cfb" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public_route_link["public_1"] must be replaced
-/+ resource "aws_route_table_association" "public_route_link" {
      ~ id             = "rtbassoc-0c37c1aea2fa57dc1" -> (known after apply)
      ~ route_table_id = "rtb-098ac6caa2e5baa83" -> (known after apply)
      ~ subnet_id      = "subnet-0bacc051bdd1ff5b0" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public_route_link["public_2"] will be destroyed
- resource "aws_route_table_association" "public_route_link" {
      - id             = "rtbassoc-04299060f0ad45e65" -> null
      - route_table_id = "rtb-098ac6caa2e5baa83" -> null
      - subnet_id      = "subnet-0503b83119c75c873" -> null
    }

  # aws_route_table_association.public_route_link["public_2_modified"] will be created
+ resource "aws_route_table_association" "public_route_link" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_subnet.private["private_1"] must be replaced
-/+ resource "aws_subnet" "private" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:097922957316:subnet/subnet-0cf9db45bc152934a" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az3" -> (known after apply)
        cidr_block                      = "10.0.20.0/24"
      ~ id                              = "subnet-0cf9db45bc152934a" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "097922957316" -> (known after apply)
        tags                            = {
            "Name"         = "devops-subnet-private_1"
            "deployed-by"  = "terraform"
            "devops-class" = "c04-iac02"
        }
      ~ vpc_id                          = "vpc-00286e3d12682c421" -> (known after apply) # forces replacement
    }

  # aws_subnet.private["private_2"] must be replaced
-/+ resource "aws_subnet" "private" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:097922957316:subnet/subnet-0c5ee1e9049a87cfb" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2b"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
        cidr_block                      = "10.0.21.0/24"
      ~ id                              = "subnet-0c5ee1e9049a87cfb" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "097922957316" -> (known after apply)
        tags                            = {
            "Name"         = "devops-subnet-private_2"
            "deployed-by"  = "terraform"
            "devops-class" = "c04-iac02"
        }
      ~ vpc_id                          = "vpc-00286e3d12682c421" -> (known after apply) # forces replacement
    }

  # aws_subnet.public["public_1"] must be replaced
-/+ resource "aws_subnet" "public" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:097922957316:subnet/subnet-0bacc051bdd1ff5b0" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az3" -> (known after apply)
      ~ cidr_block                      = "10.0.10.0/24" -> "10.0.15.0/24" # forces replacement
      ~ id                              = "subnet-0bacc051bdd1ff5b0" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = true
      ~ owner_id                        = "097922957316" -> (known after apply)
        tags                            = {
            "Name"         = "devops-subnet-public_1"
            "deployed-by"  = "terraform"
            "devops-class" = "c04-iac02"
        }
      ~ vpc_id                          = "vpc-00286e3d12682c421" -> (known after apply) # forces replacement
    }

  # aws_subnet.public["public_2"] will be destroyed
- resource "aws_subnet" "public" {
      - arn                             = "arn:aws:ec2:ap-southeast-2:097922957316:subnet/subnet-0503b83119c75c873" -> null
      - assign_ipv6_address_on_creation = false -> null
      - availability_zone               = "ap-southeast-2b" -> null
      - availability_zone_id            = "apse2-az1" -> null
      - cidr_block                      = "10.0.11.0/24" -> null
      - id                              = "subnet-0503b83119c75c873" -> null
      - map_public_ip_on_launch         = true -> null
      - owner_id                        = "097922957316" -> null
      - tags                            = {
          - "Name"         = "devops-subnet-public_2"
          - "deployed-by"  = "terraform"
          - "devops-class" = "c04-iac02"
        } -> null
      - vpc_id                          = "vpc-00286e3d12682c421" -> null
    }

  # aws_subnet.public["public_2_modified"] will be created
+ resource "aws_subnet" "public" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "ap-southeast-2b"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.11.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name"         = "devops-subnet-public_2_modified"
          + "deployed-by"  = "terraform"
          + "devops-class" = "c04-iac02"
        }
      + vpc_id                          = (known after apply)
    }

  # aws_vpc.vpc_devops must be replaced
-/+ resource "aws_vpc" "vpc_devops" {
      ~ arn                              = "arn:aws:ec2:ap-southeast-2:097922957316:vpc/vpc-00286e3d12682c421" -> (known after apply)
        assign_generated_ipv6_cidr_block = false
      ~ cidr_block                       = "10.0.0.0/16" -> "10.0.0.0/18" # forces replacement
      ~ default_network_acl_id           = "acl-00edce2f47721d2ed" -> (known after apply)
      ~ default_route_table_id           = "rtb-0bb95d7ed3070522a" -> (known after apply)
      ~ default_security_group_id        = "sg-09b1c2a8add8b5af9" -> (known after apply)
      ~ dhcp_options_id                  = "dopt-60210907" -> (known after apply)
      ~ enable_classiclink               = false -> (known after apply)
      ~ enable_classiclink_dns_support   = false -> (known after apply)
      ~ enable_dns_hostnames             = false -> (known after apply)
        enable_dns_support               = true
      ~ id                               = "vpc-00286e3d12682c421" -> (known after apply)
        instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      ~ main_route_table_id              = "rtb-0bb95d7ed3070522a" -> (known after apply)
      ~ owner_id                         = "097922957316" -> (known after apply)
        tags                             = {
            "Name"         = "devopsacademy-iac"
            "deployed-by"  = "terraform"
            "devops-class" = "c04-iac02"
        }
    }

Plan: 12 to add, 1 to change, 12 to destroy.
```


***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/205c822cbdcd0fd791608eed129941bbee16ce5f/classes/04class/exercises/c04-iac03/README.md)