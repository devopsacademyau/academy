# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
First we create the ENI and assign it the private IP address:
aws ec2 create-network-interface  --subnet-id subnet-0ae613de296de90d6  --description "DevopsAcademy Network Interface"  --groups sg-0b173087fa4c40d38  --private-ip-address 192.168.13.37

-------------------------------------------------------------
|                  CreateNetworkInterface                   |
+-----------------------------------------------------------+
||                    NetworkInterface                     ||
|+---------------------+-----------------------------------+|
||  AvailabilityZone   |  ap-southeast-2a                  ||
||  Description        |  DevopsAcademy Network Interface  ||
||  InterfaceType      |  interface                        ||
||  MacAddress         |  02:4d:8c:3b:8a:10                ||
||  NetworkInterfaceId |  eni-002fdb5bac6acd552            ||
||  OwnerId            |  738343455957                     ||
||  PrivateIpAddress   |  192.168.13.37                    ||
||  RequesterId        |  AIDA2X2FTBTK6ZLU5NU7H            ||
||  RequesterManaged   |  False                            ||
||  SourceDestCheck    |  True                             ||
||  Status             |  pending                          ||
||  SubnetId           |  subnet-0ae613de296de90d6         ||
||  VpcId              |  vpc-01cf6494735903d97            ||
|+---------------------+-----------------------------------+|
|||                        Groups                         |||
||+------------------+------------------------------------+||
|||  GroupId         |  sg-0b173087fa4c40d38              |||
|||  GroupName       |  private-sg                        |||
||+------------------+------------------------------------+||

We then tag the resource to make it clear for later:
aws ec2 create-tags --resources eni-002fdb5bac6acd552 --tags Key=Name,Value=Private-a-NetworkInterface
aws ec2 describe-network-interfaces --filters Name=tag:Name,Values=Private-a-NetworkInterface
-------------------------------------------------------------
|                 DescribeNetworkInterfaces                 |
+-----------------------------------------------------------+
||                    NetworkInterfaces                    ||
|+---------------------+-----------------------------------+|
||  AvailabilityZone   |  ap-southeast-2a                  ||
||  Description        |  DevopsAcademy Network Interface  ||
||  InterfaceType      |  interface                        ||
||  MacAddress         |  02:4d:8c:3b:8a:10                ||
||  NetworkInterfaceId |  eni-002fdb5bac6acd552            ||
||  OwnerId            |  738343455957                     ||
||  PrivateIpAddress   |  192.168.13.37                    ||
||  RequesterId        |  AIDA2X2FTBTK6ZLU5NU7H            ||
||  RequesterManaged   |  False                            ||
||  SourceDestCheck    |  True                             ||
||  Status             |  available                        ||
||  SubnetId           |  subnet-0ae613de296de90d6         ||
||  VpcId              |  vpc-01cf6494735903d97            ||
|+---------------------+-----------------------------------+|
|||                        Groups                         |||
||+------------------+------------------------------------+||
|||  GroupId         |  sg-0b173087fa4c40d38              |||
|||  GroupName       |  private-sg                        |||
||+------------------+------------------------------------+||


```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)