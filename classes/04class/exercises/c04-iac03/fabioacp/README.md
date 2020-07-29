# C04-IAC03

## Terraform plan output

```sh
❯ terraform plan -var-file="main.tfvars"                     
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

aws_eip.nat[0]: Refreshing state... [id=eipalloc-0bf62a9825bc25784]
aws_vpc.this: Refreshing state... [id=vpc-0ab385eb2835e38bc]
aws_internet_gateway.this[0]: Refreshing state... [id=igw-089b764008e036521]
aws_route_table.public[0]: Refreshing state... [id=rtb-0a198f7cdf8f7d611]
aws_subnet.public[1]: Refreshing state... [id=subnet-03630e2f3f994fc50]
aws_subnet.private[1]: Refreshing state... [id=subnet-0209d154770952a3b]
aws_route_table.private[0]: Refreshing state... [id=rtb-0c18afb1923a12f22]
aws_subnet.private[0]: Refreshing state... [id=subnet-04ef5695a4b3efd3b]
aws_subnet.public[0]: Refreshing state... [id=subnet-08bfb1d0292dc941e]
aws_route_table_association.public[1]: Refreshing state... [id=rtbassoc-06d8faed1a7c22f63]
aws_route_table_association.private[1]: Refreshing state... [id=rtbassoc-04c38fccff3ffb0f0]
aws_route_table_association.public[0]: Refreshing state... [id=rtbassoc-0032b8ca7d25c4915]
aws_nat_gateway.this[0]: Refreshing state... [id=nat-0bea9e7776c6152fe]
aws_route_table_association.private[0]: Refreshing state... [id=rtbassoc-095127e6fe8ca70cb]

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # aws_internet_gateway.this[0] will be updated in-place
  ~ resource "aws_internet_gateway" "this" {
        arn      = "arn:aws:ec2:ap-southeast-2:978009416274:internet-gateway/igw-089b764008e036521"
        id       = "igw-089b764008e036521"
        owner_id = "978009416274"
        tags     = {
            "BillingCode" = "0800"
            "Environment" = "DEV"
            "Name"        = "devopsacademy-ig"
            "Owner"       = "FACP"
            "Project"     = "C04-iac02"
        }
      ~ vpc_id   = "vpc-0ab385eb2835e38bc" -> (known after apply)
    }

  # aws_nat_gateway.this[0] must be replaced
-/+ resource "aws_nat_gateway" "this" {
        allocation_id        = "eipalloc-0bf62a9825bc25784"
      ~ id                   = "nat-0bea9e7776c6152fe" -> (known after apply)
      ~ network_interface_id = "eni-09db0631e4a5e0b00" -> (known after apply)
      ~ private_ip           = "10.0.1.156" -> (known after apply)
      ~ public_ip            = "54.206.178.12" -> (known after apply)
      ~ subnet_id            = "subnet-08bfb1d0292dc941e" -> (known after apply) # forces replacement
        tags                 = {
            "BillingCode" = "0800"
            "Environment" = "DEV"
            "Name"        = "devopsacademy-ap-southeast-2a"
            "Owner"       = "FACP"
            "Project"     = "C04-iac02"
        }
    }

  # aws_route_table.private[0] must be replaced
-/+ resource "aws_route_table" "private" {
      ~ id               = "rtb-0c18afb1923a12f22" -> (known after apply)
      ~ owner_id         = "978009416274" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      ~ route            = [] -> (known after apply)
        tags             = {
            "BillingCode" = "0800"
            "Environment" = "DEV"
            "Name"        = "devopsacademy-private"
            "Owner"       = "FACP"
            "Project"     = "C04-iac02"
        }
      ~ vpc_id           = "vpc-0ab385eb2835e38bc" -> (known after apply) # forces replacement
    }

  # aws_route_table.public[0] must be replaced
-/+ resource "aws_route_table" "public" {
      ~ id               = "rtb-0a198f7cdf8f7d611" -> (known after apply)
      ~ owner_id         = "978009416274" -> (known after apply)
      ~ propagating_vgws = [] -> (known after apply)
      ~ route            = [] -> (known after apply)
        tags             = {
            "BillingCode" = "0800"
            "Environment" = "DEV"
            "Name"        = "devopsacademy-public"
            "Owner"       = "FACP"
            "Project"     = "C04-iac02"
        }
      ~ vpc_id           = "vpc-0ab385eb2835e38bc" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private[0] must be replaced
-/+ resource "aws_route_table_association" "private" {
      ~ id             = "rtbassoc-095127e6fe8ca70cb" -> (known after apply)
      ~ route_table_id = "rtb-0c18afb1923a12f22" -> (known after apply)
      ~ subnet_id      = "subnet-04ef5695a4b3efd3b" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.private[1] must be replaced
-/+ resource "aws_route_table_association" "private" {
      ~ id             = "rtbassoc-04c38fccff3ffb0f0" -> (known after apply)
      ~ route_table_id = "rtb-0c18afb1923a12f22" -> (known after apply)
      ~ subnet_id      = "subnet-0209d154770952a3b" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public[0] must be replaced
-/+ resource "aws_route_table_association" "public" {
      ~ id             = "rtbassoc-0032b8ca7d25c4915" -> (known after apply)
      ~ route_table_id = "rtb-0a198f7cdf8f7d611" -> (known after apply)
      ~ subnet_id      = "subnet-08bfb1d0292dc941e" -> (known after apply) # forces replacement
    }

  # aws_route_table_association.public[1] must be replaced
-/+ resource "aws_route_table_association" "public" {
      ~ id             = "rtbassoc-06d8faed1a7c22f63" -> (known after apply)
      ~ route_table_id = "rtb-0a198f7cdf8f7d611" -> (known after apply)
      ~ subnet_id      = "subnet-03630e2f3f994fc50" -> (known after apply) # forces replacement
    }

  # aws_subnet.private[0] must be replaced
-/+ resource "aws_subnet" "private" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:978009416274:subnet/subnet-04ef5695a4b3efd3b" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
      ~ cidr_block                      = "10.0.2.0/24" -> "10.0.6.0/24" # forces replacement
      ~ id                              = "subnet-04ef5695a4b3efd3b" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "978009416274" -> (known after apply)
        tags                            = {
            "BillingCode" = "0800"
            "Environment" = "DEV"
            "Name"        = "private-sb1-ap-southeast-2a"
            "Owner"       = "FACP"
            "Project"     = "C04-iac02"
        }
      ~ vpc_id                          = "vpc-0ab385eb2835e38bc" -> (known after apply) # forces replacement
    }

  # aws_subnet.private[1] must be replaced
-/+ resource "aws_subnet" "private" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:978009416274:subnet/subnet-0209d154770952a3b" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2b"
      ~ availability_zone_id            = "apse2-az3" -> (known after apply)
        cidr_block                      = "10.0.4.0/24"
      ~ id                              = "subnet-0209d154770952a3b" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = false
      ~ owner_id                        = "978009416274" -> (known after apply)
      ~ tags                            = {
            "BillingCode" = "0800"
            "Environment" = "DEV"
          ~ "Name"        = "private-sb2-ap-southeast-2b" -> "private-sb2-chqnged-ap-southeast-2b"
            "Owner"       = "FACP"
            "Project"     = "C04-iac02"
        }
      ~ vpc_id                          = "vpc-0ab385eb2835e38bc" -> (known after apply) # forces replacement
    }

  # aws_subnet.public[0] must be replaced
-/+ resource "aws_subnet" "public" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:978009416274:subnet/subnet-08bfb1d0292dc941e" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2a"
      ~ availability_zone_id            = "apse2-az1" -> (known after apply)
      ~ cidr_block                      = "10.0.1.0/24" -> "10.0.5.0/24" # forces replacement
      ~ id                              = "subnet-08bfb1d0292dc941e" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = true
      ~ owner_id                        = "978009416274" -> (known after apply)
        tags                            = {
            "BillingCode" = "0800"
            "Environment" = "DEV"
            "Name"        = "public-sb1-ap-southeast-2a"
            "Owner"       = "FACP"
            "Project"     = "C04-iac02"
        }
      ~ vpc_id                          = "vpc-0ab385eb2835e38bc" -> (known after apply) # forces replacement
    }

  # aws_subnet.public[1] must be replaced
-/+ resource "aws_subnet" "public" {
      ~ arn                             = "arn:aws:ec2:ap-southeast-2:978009416274:subnet/subnet-03630e2f3f994fc50" -> (known after apply)
        assign_ipv6_address_on_creation = false
        availability_zone               = "ap-southeast-2b"
      ~ availability_zone_id            = "apse2-az3" -> (known after apply)
        cidr_block                      = "10.0.3.0/24"
      ~ id                              = "subnet-03630e2f3f994fc50" -> (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
        map_public_ip_on_launch         = true
      ~ owner_id                        = "978009416274" -> (known after apply)
      ~ tags                            = {
            "BillingCode" = "0800"
            "Environment" = "DEV"
          ~ "Name"        = "public-sb2-ap-southeast-2b" -> "public-sb2-chqnged-ap-southeast-2b"
            "Owner"       = "FACP"
            "Project"     = "C04-iac02"
        }
      ~ vpc_id                          = "vpc-0ab385eb2835e38bc" -> (known after apply) # forces replacement
    }

  # aws_vpc.this must be replaced
-/+ resource "aws_vpc" "this" {
      ~ arn                              = "arn:aws:ec2:ap-southeast-2:978009416274:vpc/vpc-0ab385eb2835e38bc" -> (known after apply)
        assign_generated_ipv6_cidr_block = false
      ~ cidr_block                       = "10.0.0.0/16" -> "10.20.0.0/16" # forces replacement
      ~ default_network_acl_id           = "acl-0a49fc0d81d2f25a8" -> (known after apply)
      ~ default_route_table_id           = "rtb-03589d176223a3ef9" -> (known after apply)
      ~ default_security_group_id        = "sg-05cbb175338ddc542" -> (known after apply)
      ~ dhcp_options_id                  = "dopt-f5dbfc92" -> (known after apply)
      ~ enable_classiclink               = false -> (known after apply)
      ~ enable_classiclink_dns_support   = false -> (known after apply)
        enable_dns_hostnames             = true
        enable_dns_support               = true
      ~ id                               = "vpc-0ab385eb2835e38bc" -> (known after apply)
        instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      ~ main_route_table_id              = "rtb-03589d176223a3ef9" -> (known after apply)
      ~ owner_id                         = "978009416274" -> (known after apply)
        tags                             = {
            "BillingCode" = "0800"
            "Environment" = "DEV"
            "Name"        = "devopsacademy-iac"
            "Owner"       = "FACP"
            "Project"     = "C04-iac02"
        }
    }

Plan: 12 to add, 1 to change, 12 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/205c822cbdcd0fd791608eed129941bbee16ce5f/classes/04class/exercises/c04-iac03/README.md)