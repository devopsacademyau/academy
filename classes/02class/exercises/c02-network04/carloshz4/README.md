# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
aws ec2 create-subnet \
--vpc-id vpc-0f80827681fb041d0  \
--cidr-block 10.10.0.0/24 \
--region ap-southeast-2 \
--availability-zone ap-southeast-2a \
--tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-a}]'

--------------------------------------------------------------------------------------------------------------
|                                                CreateSubnet                                                |
+------------------------------------------------------------------------------------------------------------+
||                                                  Subnet                                                  ||
|+------------------------------+---------------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                                    ||
||  AvailabilityZone            |  ap-southeast-2a                                                          ||
||  AvailabilityZoneId          |  apse2-az1                                                                ||
||  AvailableIpAddressCount     |  251                                                                      ||
||  CidrBlock                   |  10.10.0.0/24                                                             ||
||  DefaultForAz                |  False                                                                    ||
||  MapPublicIpOnLaunch         |  False                                                                    ||
||  OwnerId                     |  016454647794                                                             ||
||  State                       |  available                                                                ||
||  SubnetArn                   |  arn:aws:ec2:ap-southeast-2:016454647794:subnet/subnet-0d42f4977844b4b59  ||
||  SubnetId                    |  subnet-0d42f4977844b4b59                                                 ||
||  VpcId                       |  vpc-0f80827681fb041d0                                                    ||
|+------------------------------+---------------------------------------------------------------------------+|
|||                                                  Tags                                                  |||
||+-------------------------------------------+------------------------------------------------------------+||
|||  Key                                      |  Name                                                      |||
|||  Value                                    |  public-a                                                  |||
||+-------------------------------------------+------------------------------------------------------------+||



aws ec2 create-subnet \
--vpc-id vpc-0f80827681fb041d0  \
--cidr-block 10.10.1.0/24 \
--region ap-southeast-2 \
--availability-zone ap-southeast-2a \
--tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private-a}]'

--------------------------------------------------------------------------------------------------------------
|                                                CreateSubnet                                                |
+------------------------------------------------------------------------------------------------------------+
||                                                  Subnet                                                  ||
|+------------------------------+---------------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                                    ||
||  AvailabilityZone            |  ap-southeast-2a                                                          ||
||  AvailabilityZoneId          |  apse2-az1                                                                ||
||  AvailableIpAddressCount     |  251                                                                      ||
||  CidrBlock                   |  10.10.1.0/24                                                             ||
||  DefaultForAz                |  False                                                                    ||
||  MapPublicIpOnLaunch         |  False                                                                    ||
||  OwnerId                     |  016454647794                                                             ||
||  State                       |  available                                                                ||
||  SubnetArn                   |  arn:aws:ec2:ap-southeast-2:016454647794:subnet/subnet-097ae55ec1caa6f35  ||
||  SubnetId                    |  subnet-097ae55ec1caa6f35                                                 ||
||  VpcId                       |  vpc-0f80827681fb041d0                                                    ||
|+------------------------------+---------------------------------------------------------------------------+|
|||                                                  Tags                                                  |||
||+-----------------------------------------+--------------------------------------------------------------+||
|||  Key                                    |  Name                                                        |||
|||  Value                                  |  private-a                                                   |||
||+-----------------------------------------+--------------------------------------------------------------+||



aws ec2 create-subnet \
--vpc-id vpc-0f80827681fb041d0  \
--cidr-block 10.10.2.0/24 \
--region ap-southeast-2 \
--availability-zone ap-southeast-2b \
--tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-b}]'

--------------------------------------------------------------------------------------------------------------
|                                                CreateSubnet                                                |
+------------------------------------------------------------------------------------------------------------+
||                                                  Subnet                                                  ||
|+------------------------------+---------------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                                    ||
||  AvailabilityZone            |  ap-southeast-2b                                                          ||
||  AvailabilityZoneId          |  apse2-az3                                                                ||
||  AvailableIpAddressCount     |  251                                                                      ||
||  CidrBlock                   |  10.10.2.0/24                                                             ||
||  DefaultForAz                |  False                                                                    ||
||  MapPublicIpOnLaunch         |  False                                                                    ||
||  OwnerId                     |  016454647794                                                             ||
||  State                       |  available                                                                ||
||  SubnetArn                   |  arn:aws:ec2:ap-southeast-2:016454647794:subnet/subnet-0d6e1c9ba3fa9b8f4  ||
||  SubnetId                    |  subnet-0d6e1c9ba3fa9b8f4                                                 ||
||  VpcId                       |  vpc-0f80827681fb041d0                                                    ||
|+------------------------------+---------------------------------------------------------------------------+|
|||                                                  Tags                                                  |||
||+-------------------------------------------+------------------------------------------------------------+||
|||  Key                                      |  Name                                                      |||
|||  Value                                    |  public-b                                                  |||
||+-------------------------------------------+------------------------------------------------------------+||



aws ec2 create-subnet \
--vpc-id vpc-0f80827681fb041d0  \
--cidr-block 10.10.3.0/24 \
--region ap-southeast-2 \
--availability-zone ap-southeast-2b \
--tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private-b}]'

--------------------------------------------------------------------------------------------------------------
|                                                CreateSubnet                                                |
+------------------------------------------------------------------------------------------------------------+
||                                                  Subnet                                                  ||
|+------------------------------+---------------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                                    ||
||  AvailabilityZone            |  ap-southeast-2b                                                          ||
||  AvailabilityZoneId          |  apse2-az3                                                                ||
||  AvailableIpAddressCount     |  251                                                                      ||
||  CidrBlock                   |  10.10.3.0/24                                                             ||
||  DefaultForAz                |  False                                                                    ||
||  MapPublicIpOnLaunch         |  False                                                                    ||
||  OwnerId                     |  016454647794                                                             ||
||  State                       |  available                                                                ||
||  SubnetArn                   |  arn:aws:ec2:ap-southeast-2:016454647794:subnet/subnet-0fa2fabb6fa8d62c5  ||
||  SubnetId                    |  subnet-0fa2fabb6fa8d62c5                                                 ||
||  VpcId                       |  vpc-0f80827681fb041d0                                                    ||
|+------------------------------+---------------------------------------------------------------------------+|
|||                                                  Tags                                                  |||
||+-----------------------------------------+--------------------------------------------------------------+||
|||  Key                                    |  Name                                                        |||
|||  Value                                  |  private-b                                                   |||
||+-----------------------------------------+--------------------------------------------------------------+||



aws ec2 create-subnet \
--vpc-id vpc-0f80827681fb041d0  \
--cidr-block 10.10.4.0/24 \
--region ap-southeast-2 \
--availability-zone ap-southeast-2c \
--tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-c}]'

--------------------------------------------------------------------------------------------------------------
|                                                CreateSubnet                                                |
+------------------------------------------------------------------------------------------------------------+
||                                                  Subnet                                                  ||
|+------------------------------+---------------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                                    ||
||  AvailabilityZone            |  ap-southeast-2c                                                          ||
||  AvailabilityZoneId          |  apse2-az2                                                                ||
||  AvailableIpAddressCount     |  251                                                                      ||
||  CidrBlock                   |  10.10.4.0/24                                                             ||
||  DefaultForAz                |  False                                                                    ||
||  MapPublicIpOnLaunch         |  False                                                                    ||
||  OwnerId                     |  016454647794                                                             ||
||  State                       |  available                                                                ||
||  SubnetArn                   |  arn:aws:ec2:ap-southeast-2:016454647794:subnet/subnet-068e76972a02c8586  ||
||  SubnetId                    |  subnet-068e76972a02c8586                                                 ||
||  VpcId                       |  vpc-0f80827681fb041d0                                                    ||
|+------------------------------+---------------------------------------------------------------------------+|
|||                                                  Tags                                                  |||
||+-------------------------------------------+------------------------------------------------------------+||
|||  Key                                      |  Name                                                      |||
|||  Value                                    |  public-c                                                  |||
||+-------------------------------------------+------------------------------------------------------------+||



aws ec2 create-subnet \
--vpc-id vpc-0f80827681fb041d0  \
--cidr-block 10.10.5.0/24 \
--region ap-southeast-2 \
--availability-zone ap-southeast-2c \
--tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private-c}]'

--------------------------------------------------------------------------------------------------------------
|                                                CreateSubnet                                                |
+------------------------------------------------------------------------------------------------------------+
||                                                  Subnet                                                  ||
|+------------------------------+---------------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                                    ||
||  AvailabilityZone            |  ap-southeast-2c                                                          ||
||  AvailabilityZoneId          |  apse2-az2                                                                ||
||  AvailableIpAddressCount     |  251                                                                      ||
||  CidrBlock                   |  10.10.5.0/24                                                             ||
||  DefaultForAz                |  False                                                                    ||
||  MapPublicIpOnLaunch         |  False                                                                    ||
||  OwnerId                     |  016454647794                                                             ||
||  State                       |  available                                                                ||
||  SubnetArn                   |  arn:aws:ec2:ap-southeast-2:016454647794:subnet/subnet-0de0e6cf330b35523  ||
||  SubnetId                    |  subnet-0de0e6cf330b35523                                                 ||
||  VpcId                       |  vpc-0f80827681fb041d0                                                    ||
|+------------------------------+---------------------------------------------------------------------------+|
|||                                                  Tags                                                  |||
||+-----------------------------------------+--------------------------------------------------------------+||
|||  Key                                    |  Name                                                        |||
|||  Value                                  |  private-c                                                   |||
||+-----------------------------------------+--------------------------------------------------------------+||
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)