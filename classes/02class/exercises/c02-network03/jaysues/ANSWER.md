# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
First we need to create the VPC:
aws ec2 create-vpc --instance-tenancy default --cidr-block 192.168.0.0/16 -no-amazon-provided-ipv6-cidr-block 
-----------------------------------------------------------
|                        CreateVpc                        |
+---------------------------------------------------------+
||                          Vpc                          ||
|+----------------------+--------------------------------+|
||  CidrBlock           |  192.168.0.0/16                ||
||  DhcpOptionsId       |  dopt-0be60e4e9b4b91096        ||
||  InstanceTenancy     |  default                       ||
||  IsDefault           |  False                         ||
||  OwnerId             |  738343455957                  ||
||  State               |  pending                       ||
||  VpcId               |  vpc-01cf6494735903d97         ||
|+----------------------+--------------------------------+|
|||               CidrBlockAssociationSet               |||
||+----------------+------------------------------------+||
|||  AssociationId |  vpc-cidr-assoc-04b9ee7a58474aa31  |||
|||  CidrBlock     |  192.168.0.0/16                    |||
||+----------------+------------------------------------+||
||||                  CidrBlockState                   ||||
|||+-------------------+-------------------------------+|||
||||  State            |  associated                   ||||
|||+-------------------+-------------------------------+|||
(END)

We then need to add the required tags to add the name as required in the exercise:
aws ec2 create-tags --tags  Key=Name,Value=devopsacademy-vpc --resources vpc-0bf64b2480b05e728

-----------------------------------------------------------
|                      DescribeVpcs                       |
+---------------------------------------------------------+
||                         Vpcs                          ||
|+----------------------+--------------------------------+|
||  CidrBlock           |  192.168.0.0/16                ||
||  DhcpOptionsId       |  dopt-0be60e4e9b4b91096        ||
||  InstanceTenancy     |  default                       ||
||  IsDefault           |  False                         ||
||  OwnerId             |  738343455957                  ||
||  State               |  available                     ||
||  VpcId               |  vpc-01cf6494735903d97         ||
|+----------------------+--------------------------------+|
|||               CidrBlockAssociationSet               |||
||+----------------+------------------------------------+||
|||  AssociationId |  vpc-cidr-assoc-04b9ee7a58474aa31  |||
|||  CidrBlock     |  192.168.0.0/16                    |||
||+----------------+------------------------------------+||
||||                  CidrBlockState                   ||||
|||+-------------------+-------------------------------+|||
||||  State            |  associated                   ||||
|||+-------------------+-------------------------------+|||
|||                        Tags                         |||
||+--------------+--------------------------------------+||
|||  Key         |  Name                                |||
|||  Value       |  devopsacademy-vpc                   |||
||+--------------+--------------------------------------+||
(END)
```

- Any extra challenges faced?
Needing to tag the VPC with a name was interesting - AWS defaults the name of the VPC to the hash it creates when it makes it so you need to manually tag it later.


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)