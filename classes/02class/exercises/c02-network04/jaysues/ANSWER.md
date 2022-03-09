# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
aws ec2 describe-availability-zones --region ap-southeast-2
aws ec2 create-subnet --vpc-id vpc-01cf6494735903d97 --availability-zone ap-southeast-2a --cidr-block 192.168.0.0/19
--------------------------------------------------------------------------------------------------------------
|                                                CreateSubnet                                                |
+------------------------------------------------------------------------------------------------------------+
||                                                  Subnet                                                  ||
|+------------------------------+---------------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                                    ||
||  AvailabilityZone            |  ap-southeast-2a                                                          ||
||  AvailabilityZoneId          |  apse2-az1                                                                ||
||  AvailableIpAddressCount     |  8187                                                                     ||
||  CidrBlock                   |  192.168.0.0/19                                                           ||
||  DefaultForAz                |  False                                                                    ||
||  EnableDns64                 |  False                                                                    ||
||  Ipv6Native                  |  False                                                                    ||
||  MapPublicIpOnLaunch         |  False                                                                    ||
||  OwnerId                     |  738343455957                                                             ||
||  State                       |  available                                                                ||
||  SubnetArn                   |  arn:aws:ec2:ap-southeast-2:738343455957:subnet/subnet-0ae613de296de90d6  ||
||  SubnetId                    |  subnet-0ae613de296de90d6                                                 ||
||  VpcId                       |  vpc-01cf6494735903d97                                                    ||
|+------------------------------+---------------------------------------------------------------------------+|
|||                                      PrivateDnsNameOptionsOnLaunch                                     |||
||+-------------------------------------------------------------------------------+------------------------+||
|||  EnableResourceNameDnsAAAARecord                                              |  False                 |||
|||  EnableResourceNameDnsARecord                                                 |  False                 |||
|||  HostnameType                                                                 |  ip-name               |||
||+-------------------------------------------------------------------------------+------------------------+||
aws ec2 create-tags --resources subnet-0ae613de296de90d6 --tags Key=Name,Value=Private-a

aws ec2 create-subnet --vpc-id vpc-01cf6494735903d97 --availability-zone ap-southeast-2b --cidr-block 192.168.32.0/19
aws ec2 create-tags --resources subnet-079a1c39db6013bf3 --tags Key=Name,Value=Private-b
aws ec2 create-subnet --vpc-id vpc-01cf6494735903d97 --availability-zone ap-southeast-2c --cidr-block 192.168.64.0/19
aws ec2 create-tags --resources subnet-02a1501937c03b796 --tags Key=Name,Value=Private-c
aws ec2 create-subnet --vpc-id vpc-01cf6494735903d97 --availability-zone ap-southeast-2a --cidr-block 192.168.96.0/19
aws ec2 create-tags --resources subnet-0baf3a3a83b8df14c --tags Key=Name,Value=Public-a
aws ec2 create-subnet --vpc-id vpc-01cf6494735903d97 --availability-zone ap-southeast-2b --cidr-block 192.168.128.0/19
aws ec2 create-tags --resources subnet-08500379e763425ee --tags Key=Name,Value=Public-b
aws ec2 create-subnet --vpc-id vpc-01cf6494735903d97 --availability-zone ap-southeast-2c --cidr-block 192.168.160.0/19
aws ec2 create-tags --resources subnet-070006a36558f1750 --tags Key=Name,Value=Public-c
--------------------------------------------------------------------------------------------------------------
|                                               DescribeSubnets                                              |
+------------------------------------------------------------------------------------------------------------+
||                                                  Subnets                                                 ||
|+------------------------------+---------------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                                    ||
||  AvailabilityZone            |  ap-southeast-2c                                                          ||
||  AvailabilityZoneId          |  apse2-az2                                                                ||
||  AvailableIpAddressCount     |  8187                                                                     ||
||  CidrBlock                   |  192.168.160.0/19                                                         ||
||  DefaultForAz                |  False                                                                    ||
||  EnableDns64                 |  False                                                                    ||
||  Ipv6Native                  |  False                                                                    ||
||  MapCustomerOwnedIpOnLaunch  |  False                                                                    ||
||  MapPublicIpOnLaunch         |  False                                                                    ||
||  OwnerId                     |  738343455957                                                             ||
||  State                       |  available                                                                ||
||  SubnetArn                   |  arn:aws:ec2:ap-southeast-2:738343455957:subnet/subnet-070006a36558f1750  ||
||  SubnetId                    |  subnet-070006a36558f1750                                                 ||
||  VpcId                       |  vpc-01cf6494735903d97                                                    ||
|+------------------------------+---------------------------------------------------------------------------+|
|||                                      PrivateDnsNameOptionsOnLaunch                                     |||
||+-------------------------------------------------------------------------------+------------------------+||
|||  EnableResourceNameDnsAAAARecord                                              |  False                 |||
|||  EnableResourceNameDnsARecord                                                 |  False                 |||
|||  HostnameType                                                                 |  ip-name               |||
||+-------------------------------------------------------------------------------+------------------------+||
|||                                                  Tags                                                  |||
||+-------------------------------------------+------------------------------------------------------------+||
|||  Key                                      |  Name                                                      |||
|||  Value                                    |  Public-c                                                  |||
||+-------------------------------------------+------------------------------------------------------------+||
||                                                  Subnets                                                 ||
|+------------------------------+---------------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                                    ||
||  AvailabilityZone            |  ap-southeast-2c                                                          ||
||  AvailabilityZoneId          |  apse2-az2                                                                ||
||  AvailableIpAddressCount     |  8187                                                                     ||
||  CidrBlock                   |  192.168.64.0/19                                                          ||
||  DefaultForAz                |  False                                                                    ||
||  EnableDns64                 |  False                                                                    ||
||  Ipv6Native                  |  False                                                                    ||
||  MapCustomerOwnedIpOnLaunch  |  False                                                                    ||
||  MapPublicIpOnLaunch         |  False                                                                    ||
||  OwnerId                     |  738343455957                                                             ||
||  State                       |  available                                                                ||
||  SubnetArn                   |  arn:aws:ec2:ap-southeast-2:738343455957:subnet/subnet-02a1501937c03b796  ||
||  SubnetId                    |  subnet-02a1501937c03b796                                                 ||
||  VpcId                       |  vpc-01cf6494735903d97                                                    ||
|+------------------------------+---------------------------------------------------------------------------+|
|||                                      PrivateDnsNameOptionsOnLaunch                                     |||
||+-------------------------------------------------------------------------------+------------------------+||
|||  EnableResourceNameDnsAAAARecord                                              |  False                 |||
|||  EnableResourceNameDnsARecord                                                 |  False                 |||
|||  HostnameType                                                                 |  ip-name               |||
||+-------------------------------------------------------------------------------+------------------------+||
|||                                                  Tags                                                  |||
||+-----------------------------------------+--------------------------------------------------------------+||
|||  Key                                    |  Name                                                        |||
|||  Value                                  |  Private-c                                                   |||
||+-----------------------------------------+--------------------------------------------------------------+||
||                                                  Subnets                                                 ||
|+------------------------------+---------------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                                    ||
||  AvailabilityZone            |  ap-southeast-2c                                                          ||
||  AvailabilityZoneId          |  apse2-az2                                                                ||
||  AvailableIpAddressCount     |  4091                                                                     ||
||  CidrBlock                   |  172.31.16.0/20                                                           ||
||  DefaultForAz                |  True                                                                     ||
||  EnableDns64                 |  False                                                                    ||
||  Ipv6Native                  |  False                                                                    ||
||  MapCustomerOwnedIpOnLaunch  |  False                                                                    ||
||  MapPublicIpOnLaunch         |  True                                                                     ||
||  OwnerId                     |  738343455957                                                             ||
||  State                       |  available                                                                ||
||  SubnetArn                   |  arn:aws:ec2:ap-southeast-2:738343455957:subnet/subnet-0d66e775892898731  ||
||  SubnetId                    |  subnet-0d66e775892898731                                                 ||
||  VpcId                       |  vpc-04220c24c443ac9b4                                                    ||
|+------------------------------+---------------------------------------------------------------------------+|
|||                                      PrivateDnsNameOptionsOnLaunch                                     |||
||+-------------------------------------------------------------------------------+------------------------+||
|||  EnableResourceNameDnsAAAARecord                                              |  False                 |||
|||  EnableResourceNameDnsARecord                                                 |  False                 |||
|||  HostnameType                                                                 |  ip-name               |||
||+-------------------------------------------------------------------------------+------------------------+||
||                                                  Subnets                                                 ||
|+------------------------------+---------------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                                    ||
||  AvailabilityZone            |  ap-southeast-2b                                                          ||
||  AvailabilityZoneId          |  apse2-az3                                                                ||
||  AvailableIpAddressCount     |  4091                                                                     ||
||  CidrBlock                   |  172.31.32.0/20                                                           ||
||  DefaultForAz                |  True                                                                     ||
||  EnableDns64                 |  False                                                                    ||
||  Ipv6Native                  |  False                                                                    ||
||  MapCustomerOwnedIpOnLaunch  |  False                                                                    ||
||  MapPublicIpOnLaunch         |  True                                                                     ||
||  OwnerId                     |  738343455957                                                             ||
||  State                       |  available                                                                ||
||  SubnetArn                   |  arn:aws:ec2:ap-southeast-2:738343455957:subnet/subnet-0e5e6c597555f2f83  ||
||  SubnetId                    |  subnet-0e5e6c597555f2f83                                                 ||
||  VpcId                       |  vpc-04220c24c443ac9b4                                                    ||
|+------------------------------+---------------------------------------------------------------------------+|
|||                                      PrivateDnsNameOptionsOnLaunch                                     |||
||+-------------------------------------------------------------------------------+------------------------+||
|||  EnableResourceNameDnsAAAARecord                                              |  False                 |||
|||  EnableResourceNameDnsARecord                                                 |  False                 |||
|||  HostnameType                                                                 |  ip-name               |||
||+-------------------------------------------------------------------------------+------------------------+||
||                                                  Subnets                                                 ||
|+------------------------------+---------------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                                    ||
||  AvailabilityZone            |  ap-southeast-2a                                                          ||
||  AvailabilityZoneId          |  apse2-az1                                                                ||
||  AvailableIpAddressCount     |  8187                                                                     ||
||  CidrBlock                   |  192.168.96.0/19                                                          ||
||  DefaultForAz                |  False                                                                    ||
||  EnableDns64                 |  False                                                                    ||
||  Ipv6Native                  |  False                                                                    ||
||  MapCustomerOwnedIpOnLaunch  |  False                                                                    ||
||  MapPublicIpOnLaunch         |  False                                                                    ||
||  OwnerId                     |  738343455957                                                             ||
||  State                       |  available                                                                ||
||  SubnetArn                   |  arn:aws:ec2:ap-southeast-2:738343455957:subnet/subnet-0baf3a3a83b8df14c  ||
||  SubnetId                    |  subnet-0baf3a3a83b8df14c                                                 ||
||  VpcId                       |  vpc-01cf6494735903d97                                                    ||
|+------------------------------+---------------------------------------------------------------------------+|
|||                                      PrivateDnsNameOptionsOnLaunch                                     |||
||+-------------------------------------------------------------------------------+------------------------+||
|||  EnableResourceNameDnsAAAARecord                                              |  False                 |||
|||  EnableResourceNameDnsARecord                                                 |  False                 |||
|||  HostnameType                                                                 |  ip-name               |||
||+-------------------------------------------------------------------------------+------------------------+||
|||                                                  Tags                                                  |||
||+-------------------------------------------+------------------------------------------------------------+||
|||  Key                                      |  Name                                                      |||
|||  Value                                    |  Public-a                                                  |||
||+-------------------------------------------+------------------------------------------------------------+||
||                                                  Subnets                                                 ||
|+------------------------------+---------------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                                    ||
||  AvailabilityZone            |  ap-southeast-2b                                                          ||
||  AvailabilityZoneId          |  apse2-az3                                                                ||
||  AvailableIpAddressCount     |  8187                                                                     ||
||  CidrBlock                   |  192.168.32.0/19                                                          ||
||  DefaultForAz                |  False                                                                    ||
||  EnableDns64                 |  False                                                                    ||
||  Ipv6Native                  |  False                                                                    ||
||  MapCustomerOwnedIpOnLaunch  |  False                                                                    ||
||  MapPublicIpOnLaunch         |  False                                                                    ||
||  OwnerId                     |  738343455957                                                             ||
||  State                       |  available                                                                ||
||  SubnetArn                   |  arn:aws:ec2:ap-southeast-2:738343455957:subnet/subnet-079a1c39db6013bf3  ||
||  SubnetId                    |  subnet-079a1c39db6013bf3                                                 ||
||  VpcId                       |  vpc-01cf6494735903d97                                                    ||
|+------------------------------+---------------------------------------------------------------------------+|
|||                                      PrivateDnsNameOptionsOnLaunch                                     |||
||+-------------------------------------------------------------------------------+------------------------+||
|||  EnableResourceNameDnsAAAARecord                                              |  False                 |||
|||  EnableResourceNameDnsARecord                                                 |  False                 |||
|||  HostnameType                                                                 |  ip-name               |||
||+-------------------------------------------------------------------------------+------------------------+||
|||                                                  Tags                                                  |||
||+-----------------------------------------+--------------------------------------------------------------+||
|||  Key                                    |  Name                                                        |||
|||  Value                                  |  Private-b                                                   |||
||+-----------------------------------------+--------------------------------------------------------------+||
||                                                  Subnets                                                 ||
|+------------------------------+---------------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                                    ||
||  AvailabilityZone            |  ap-southeast-2b                                                          ||
||  AvailabilityZoneId          |  apse2-az3                                                                ||
||  AvailableIpAddressCount     |  8187                                                                     ||
||  CidrBlock                   |  192.168.128.0/19                                                         ||
||  DefaultForAz                |  False                                                                    ||
||  EnableDns64                 |  False                                                                    ||
||  Ipv6Native                  |  False                                                                    ||
||  MapCustomerOwnedIpOnLaunch  |  False                                                                    ||
||  MapPublicIpOnLaunch         |  False                                                                    ||
||  OwnerId                     |  738343455957                                                             ||
||  State                       |  available                                                                ||
||  SubnetArn                   |  arn:aws:ec2:ap-southeast-2:738343455957:subnet/subnet-08500379e763425ee  ||
||  SubnetId                    |  subnet-08500379e763425ee                                                 ||
||  VpcId                       |  vpc-01cf6494735903d97                                                    ||
|+------------------------------+---------------------------------------------------------------------------+|
|||                                      PrivateDnsNameOptionsOnLaunch                                     |||
||+-------------------------------------------------------------------------------+------------------------+||
|||  EnableResourceNameDnsAAAARecord                                              |  False                 |||
|||  EnableResourceNameDnsARecord                                                 |  False                 |||
|||  HostnameType                                                                 |  ip-name               |||
||+-------------------------------------------------------------------------------+------------------------+||
|||                                                  Tags                                                  |||
||+-------------------------------------------+------------------------------------------------------------+||
|||  Key                                      |  Name                                                      |||
|||  Value                                    |  Public-b                                                  |||
||+-------------------------------------------+------------------------------------------------------------+||
||                                                  Subnets                                                 ||
|+------------------------------+---------------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                                    ||
||  AvailabilityZone            |  ap-southeast-2a                                                          ||
||  AvailabilityZoneId          |  apse2-az1                                                                ||
||  AvailableIpAddressCount     |  4091                                                                     ||
||  CidrBlock                   |  172.31.0.0/20                                                            ||
||  DefaultForAz                |  True                                                                     ||
||  EnableDns64                 |  False                                                                    ||
||  Ipv6Native                  |  False                                                                    ||
||  MapCustomerOwnedIpOnLaunch  |  False                                                                    ||
||  MapPublicIpOnLaunch         |  True                                                                     ||
||  OwnerId                     |  738343455957                                                             ||
||  State                       |  available                                                                ||
||  SubnetArn                   |  arn:aws:ec2:ap-southeast-2:738343455957:subnet/subnet-0e2e323562fc01ba3  ||
||  SubnetId                    |  subnet-0e2e323562fc01ba3                                                 ||
||  VpcId                       |  vpc-04220c24c443ac9b4                                                    ||
|+------------------------------+---------------------------------------------------------------------------+|
|||                                      PrivateDnsNameOptionsOnLaunch                                     |||
||+-------------------------------------------------------------------------------+------------------------+||
|||  EnableResourceNameDnsAAAARecord                                              |  False                 |||
|||  EnableResourceNameDnsARecord                                                 |  False                 |||
|||  HostnameType                                                                 |  ip-name               |||
||+-------------------------------------------------------------------------------+------------------------+||
||                                                  Subnets                                                 ||
|+------------------------------+---------------------------------------------------------------------------+|
||  AssignIpv6AddressOnCreation |  False                                                                    ||
||  AvailabilityZone            |  ap-southeast-2a                                                          ||
||  AvailabilityZoneId          |  apse2-az1                                                                ||
||  AvailableIpAddressCount     |  8187                                                                     ||
||  CidrBlock                   |  192.168.0.0/19                                                           ||
||  DefaultForAz                |  False                                                                    ||
||  EnableDns64                 |  False                                                                    ||
||  Ipv6Native                  |  False                                                                    ||
||  MapCustomerOwnedIpOnLaunch  |  False                                                                    ||
||  MapPublicIpOnLaunch         |  False                                                                    ||
||  OwnerId                     |  738343455957                                                             ||
||  State                       |  available                                                                ||
||  SubnetArn                   |  arn:aws:ec2:ap-southeast-2:738343455957:subnet/subnet-0ae613de296de90d6  ||
||  SubnetId                    |  subnet-0ae613de296de90d6                                                 ||
||  VpcId                       |  vpc-01cf6494735903d97                                                    ||
|+------------------------------+---------------------------------------------------------------------------+|
|||                                      PrivateDnsNameOptionsOnLaunch                                     |||
||+-------------------------------------------------------------------------------+------------------------+||
|||  EnableResourceNameDnsAAAARecord                                              |  False                 |||
|||  EnableResourceNameDnsARecord                                                 |  False                 |||
|||  HostnameType                                                                 |  ip-name               |||
||+-------------------------------------------------------------------------------+------------------------+||
|||                                                  Tags                                                  |||
||+-----------------------------------------+--------------------------------------------------------------+||
|||  Key                                    |  Name                                                        |||
|||  Value                                  |  Private-a                                                   |||
||+-----------------------------------------+--------------------------------------------------------------+||
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)