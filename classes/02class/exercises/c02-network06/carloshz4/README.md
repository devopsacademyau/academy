# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:

Create Elastic IP

```
aws ec2 allocate-address --region ap-southeast-2 --domain vpc

--------------------------------------------------------------------------------------------------
|                                         AllocateAddress                                        |
+-----------------------------+---------+---------------------+---------------+------------------+
|        AllocationId         | Domain  | NetworkBorderGroup  |   PublicIp    | PublicIpv4Pool   |
+-----------------------------+---------+---------------------+---------------+------------------+
|  eipalloc-0aab75a7da6f5ec3c |  vpc    |  ap-southeast-2     |  13.54.12.123 |  amazon          |
+-----------------------------+---------+---------------------+---------------+------------------+
```

Create NGW

```
aws ec2 create-nat-gateway --subnet-id subnet-0d42f4977844b4b59 \
--allocation-id eipalloc-0aab75a7da6f5ec3c \
--region ap-southeast-2 \
--tag-specifications 'ResourceType=natgateway,Tags=[{Key=Name,Value=devopsacademy-ngw}]'

---------------------------------------------------------
|                   CreateNatGateway                    |
+--------------+----------------------------------------+
|  ClientToken |  4e859525-a267-4480-a3fa-c07ca4013706  |
+--------------+----------------------------------------+
||                     NatGateway                      ||
|+------------------+----------------------------------+|
||  CreateTime      |  2020-07-05T06:19:18.000Z        ||
||  NatGatewayId    |  nat-0df9320dff635b6ba           ||
||  State           |  pending                         ||
||  SubnetId        |  subnet-0d42f4977844b4b59        ||
||  VpcId           |  vpc-0f80827681fb041d0           ||
|+------------------+----------------------------------+|
|||                NatGatewayAddresses                |||
||+----------------+----------------------------------+||
|||  AllocationId  |  eipalloc-0aab75a7da6f5ec3c      |||
||+----------------+----------------------------------+||
|||                       Tags                        |||
||+--------------+------------------------------------+||
|||  Key         |  Name                              |||
|||  Value       |  devopsacademy-ngw                 |||
||+--------------+------------------------------------+||
```


- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)