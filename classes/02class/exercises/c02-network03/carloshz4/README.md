# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
aws ec2 create-vpc \
--cidr-block 10.10.0.0/16 --instance-tenancy default \
--no-amazon-provided-ipv6-cidr-block \
--region ap-southeast-2


-------------------------------------------------------------------------------------------------------------------------
|                                                       CreateVpc                                                       |
+-----------------------------------------------------------------------------------------------------------------------+
||                                                         Vpc                                                         ||
|+--------------+----------------+------------------+------------+---------------+-----------+-------------------------+|
||   CidrBlock  | DhcpOptionsId  | InstanceTenancy  | IsDefault  |    OwnerId    |   State   |          VpcId          ||
|+--------------+----------------+------------------+------------+---------------+-----------+-------------------------+|
||  10.10.0.0/16|  dopt-75344712 |  default         |  False     |  016454647794 |  pending  |  vpc-0f80827681fb041d0  ||
|+--------------+----------------+------------------+------------+---------------+-----------+-------------------------+|
|||                                              CidrBlockAssociationSet                                              |||
||+-------------------------------------------------------------------------------+-----------------------------------+||
|||                                 AssociationId                                 |             CidrBlock             |||
||+-------------------------------------------------------------------------------+-----------------------------------+||
|||  vpc-cidr-assoc-04ba06ec7e5683f90                                             |  10.10.0.0/16                     |||
||+-------------------------------------------------------------------------------+-----------------------------------+||
||||                                                 CidrBlockState                                                  ||||
|||+-------------------------------------------+---------------------------------------------------------------------+|||
||||  State                                    |  associated                                                         ||||
|||+-------------------------------------------+---------------------------------------------------------------------+||


aws ec2 create-tags \
--resources vpc-0f80827681fb041d0 \
--tags Key=Name,Value=devopsacademy-vpc \
--region ap-southeast-2
```

- Any extra challenges faced?

I couldn't use the tag parameter. CLI didn't recognise it. Hence tagged vpc with an extra command. Later in the next exercise I upgraded the aws cli with pip3 which solved that problem.


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)