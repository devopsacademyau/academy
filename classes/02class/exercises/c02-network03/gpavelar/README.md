# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:

```bash
## Creating VPC
aws ec2 create-vpc --cidr-block 10.0.0.0/16 --no-amazon-provided-ipv6-cidr-block --instance-tenancy default

# Output
VPC     10.0.0.0/16     dopt-9dc3e8fa   default False   478433196210    pending vpc-074c260483405f2bb
CIDRBLOCKASSOCIATIONSET vpc-cidr-assoc-04bf367e9d7de622c        10.0.0.0/16
CIDRBLOCKSTATE  associated

## Tag VPC
## Tags enable you to create categories and name AWS resources, for instance, by environment.
aws ec2 create-tags --resources vpc-074c260483405f2bb --tags Key="Name",Value="devopsacademy-vpc"
# Output
none

## Describe tags
TAGS    Name    vpc-074c260483405f2bb   vpc     devopsacademy-vpc

## Describe VPC
aws ec2 describe-vpcs

# Output
VPCS    10.0.0.0/16     dopt-9dc3e8fa   default False   478433196210    available       vpc-074c260483405f2bb
CIDRBLOCKASSOCIATIONSET vpc-cidr-assoc-04bf367e9d7de622c        10.0.0.0/16
CIDRBLOCKSTATE  associated
TAGS    Name    devopsacademy-vpc

## Checking route tables -
aws ec2 describe-route-tables
# Output
ROUTETABLES     478433196210    rtb-0609f049cb1055409   vpc-074c260483405f2bb
ASSOCIATIONS    True    rtbassoc-01793416f529fba55      rtb-0609f049cb1055409
ASSOCIATIONSTATE        associated
ROUTES  10.0.0.0/16     local   CreateRouteTable        active

```

- Any extra challenges faced?

> 1. Understanding which key-value use to name my vpc or any resource. Will it be used in future automations?
> 2. Check where my vpc was created.
> 3. Notice that a route table with default local routes and network acls.

---

Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)
