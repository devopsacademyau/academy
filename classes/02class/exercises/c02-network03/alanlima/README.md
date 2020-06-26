# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:

```bash
$ aws ec2 create-vpc \
    --cidr-block 10.0.0.0/16 \
    --no-amazon-provided-ipv6-cidr-block \
    --instance-tenancy default

Vpc:
  CidrBlock: 10.0.0.0/16
  CidrBlockAssociationSet:
  - AssociationId: vpc-cidr-assoc-0688628636935c1f6
    CidrBlock: 10.0.0.0/16
    CidrBlockState:
      State: associated
  DhcpOptionsId: dopt-60210907
  InstanceTenancy: default
  Ipv6CidrBlockAssociationSet: []
  IsDefault: false
  OwnerId: '097922957316'
  State: pending
  VpcId: vpc-0695e357c77b2feb2

$ aws ec2 create-tags --tags Key=Name,Value=devopsacademy-vpc --resources vpc-0695e357c77b2feb2

$ aws ec2 describe-vpcs --vpc-id vpc-0695e357c77b2feb2
Vpcs:
- CidrBlock: 10.0.0.0/16
  CidrBlockAssociationSet:
  - AssociationId: vpc-cidr-assoc-0688628636935c1f6
    CidrBlock: 10.0.0.0/16
    CidrBlockState:
      State: associated
  DhcpOptionsId: dopt-60210907
  InstanceTenancy: default
  IsDefault: false
  OwnerId: '097922957316'
  State: available
  Tags:
  - Key: Name
    Value: devopsacademy-vpc
  VpcId: vpc-0695e357c77b2feb2
```

- Any extra challenges faced?

```
To set the name to the VPC, I needed to execute a second command to create a tag with Name=devopsacademy-vpc and using the vpc id created.
```


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)