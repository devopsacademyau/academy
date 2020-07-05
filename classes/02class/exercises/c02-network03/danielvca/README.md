
# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
aws ec2 create-vpc \
--cidr-block 10.0.0.0/16

Vpc:  
CidrBlock: 10.0.0.0/16  
CidrBlockAssociationSet:  
- AssociationId: vpc-cidr-assoc-0299d583ddaa29bb4  
CidrBlock: 10.0.0.0/16  
CidrBlockState:  
State: associated  
DhcpOptionsId: dopt-ddbc90ba  
InstanceTenancy: default  
Ipv6CidrBlockAssociationSet: []  
IsDefault: false  
OwnerId: '646093908012'  
State: pending  
VpcId: vpc-0c2c93451cdd28192
```

- Any extra challenges faced?
```
Had to run another command to name the VPC aws ec2 create-tags
--resources vpc-0c2c93451cdd28192 --tags Key=Name,Value=devopsacademy-vpc
```
[https://cloudaffaire.com/how-to-create-a-custom-vpc-using-aws-cli/](https://cloudaffaire.com/how-to-create-a-custom-vpc-using-aws-cli/)

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)

> Written with [StackEdit](https://stackedit.io/).