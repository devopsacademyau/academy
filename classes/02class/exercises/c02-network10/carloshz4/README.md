# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
aws ec2 create-network-interface \
--subnet-id subnet-097ae55ec1caa6f35 \
--description "DA ENI" \
--groups sg-06506bfeb68fb128e \
--private-ip-address 10.10.1.4 \
--region ap-southeast-2

------------------------------------------------------
|               CreateNetworkInterface               |
+----------------------------------------------------+
||                 NetworkInterface                 ||
|+---------------------+----------------------------+|
||  AvailabilityZone   |  ap-southeast-2a           ||
||  Description        |  DA ENI                    ||
||  InterfaceType      |  interface                 ||
||  MacAddress         |  02:5a:b3:3e:c0:1c         ||
||  NetworkInterfaceId |  eni-0461a3a4cf94bbc8b     ||
||  OwnerId            |  016454647794              ||
||  PrivateIpAddress   |  10.10.1.4                 ||
||  RequesterId        |  AIDAQHVGF77ZIUCQC6PDU     ||
||  RequesterManaged   |  False                     ||
||  SourceDestCheck    |  True                      ||
||  Status             |  pending                   ||
||  SubnetId           |  subnet-097ae55ec1caa6f35  ||
||  VpcId              |  vpc-0f80827681fb041d0     ||
|+---------------------+----------------------------+|
|||                     Groups                     |||
||+----------------+-------------------------------+||
|||  GroupId       |  sg-06506bfeb68fb128e         |||
|||  GroupName     |  private-sg                   |||
||+----------------+-------------------------------+||
|||               PrivateIpAddresses               |||
||+----------------------------+-------------------+||
|||  Primary                   |  True             |||
|||  PrivateIpAddress          |  10.10.1.4        |||
||+----------------------------+-------------------+||
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)