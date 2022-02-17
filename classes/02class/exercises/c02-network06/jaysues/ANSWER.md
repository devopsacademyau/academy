# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
First we create the EIP:
aws ec2 allocate-address --domain vpc
-------------------------------------------------------------------------------------------------
|                                        AllocateAddress                                        |
+-----------------------------+---------+---------------------+--------------+------------------+
|        AllocationId         | Domain  | NetworkBorderGroup  |  PublicIp    | PublicIpv4Pool   |
+-----------------------------+---------+---------------------+--------------+------------------+
|  eipalloc-0865c0d1f58a006dd |  vpc    |  ap-southeast-2     |  52.63.138.4 |  amazon          |
+-----------------------------+---------+---------------------+--------------+------------------+
Then we create the nat gateway itself, and assign the eip to it:

➜  jaysues aws ec2 create-nat-gateway --subnet-id subnet-0baf3a3a83b8df14c --allocation-id eipalloc-0865c0d1f58a006dd

---------------------------------------------------------
|                   CreateNatGateway                    |
+--------------+----------------------------------------+
|  ClientToken |  804be90f-1a9c-41cc-b605-4d6b888239b2  |
+--------------+----------------------------------------+
||                     NatGateway                      ||
|+--------------------+--------------------------------+|
||  ConnectivityType  |  public                        ||
||  CreateTime        |  2022-02-17T05:35:20+00:00     ||
||  NatGatewayId      |  nat-015db70fb289a5064         ||
||  State             |  pending                       ||
||  SubnetId          |  subnet-0baf3a3a83b8df14c      ||
||  VpcId             |  vpc-01cf6494735903d97         ||
|+--------------------+--------------------------------+|
|||                NatGatewayAddresses                |||
||+----------------+----------------------------------+||
|||  AllocationId  |  eipalloc-0865c0d1f58a006dd      |||
||+----------------+----------------------------------+||

We will then tag this to ensure the name is correct:

➜  jaysues aws ec2 create-tags --resources nat-015db70fb289a5064 --tags Key=Name,Value=DevopsAcademy-ngw
aws ec2 describe-nat-gateways
----------------------------------------------------------
|                   DescribeNatGateways                  |
+--------------------------------------------------------+
||                      NatGateways                     ||
|+---------------------+--------------------------------+|
||  ConnectivityType   |  public                        ||
||  CreateTime         |  2022-02-17T05:35:20+00:00     ||
||  NatGatewayId       |  nat-015db70fb289a5064         ||
||  State              |  available                     ||
||  SubnetId           |  subnet-0baf3a3a83b8df14c      ||
||  VpcId              |  vpc-01cf6494735903d97         ||
|+---------------------+--------------------------------+|
|||                 NatGatewayAddresses                |||
||+---------------------+------------------------------+||
|||  AllocationId       |  eipalloc-0865c0d1f58a006dd  |||
|||  NetworkInterfaceId |  eni-0dd25f79dd96ebbe5       |||
|||  PrivateIp          |  192.168.105.212             |||
|||  PublicIp           |  52.63.138.4                 |||
||+---------------------+------------------------------+||
|||                        Tags                        |||
||+--------------+-------------------------------------+||
|||  Key         |  Name                               |||
|||  Value       |  DevopsAcademy-ngw                  |||
||+--------------+-------------------------------------+||

Verified this working, now time to remove:
➜  jaysues aws ec2 delete-nat-gateway --nat-gateway-id nat-015db70fb289a5064
➜  jaysues aws ec2 describe-nat-gateways
----------------------------------------------------------
|                   DescribeNatGateways                  |
+--------------------------------------------------------+
||                      NatGateways                     ||
|+---------------------+--------------------------------+|
||  ConnectivityType   |  public                        ||
||  CreateTime         |  2022-02-17T05:35:20+00:00     ||
||  DeleteTime         |  2022-02-17T05:38:02+00:00     ||
||  NatGatewayId       |  nat-015db70fb289a5064         ||
||  State              |  deleting                      ||
||  SubnetId           |  subnet-0baf3a3a83b8df14c      ||
||  VpcId              |  vpc-01cf6494735903d97         ||
|+---------------------+--------------------------------+|
|||                 NatGatewayAddresses                |||
||+---------------------+------------------------------+||
|||  AllocationId       |  eipalloc-0865c0d1f58a006dd  |||
|||  NetworkInterfaceId |  eni-0dd25f79dd96ebbe5       |||
|||  PrivateIp          |  192.168.105.212             |||
|||  PublicIp           |  52.63.138.4                 |||
||+---------------------+------------------------------+||
|||                        Tags                        |||
||+--------------+-------------------------------------+||
|||  Key         |  Name                               |||
|||  Value       |  DevopsAcademy-ngw                  |||
||+--------------+-------------------------------------+||

And finally release the eip:

➜  jaysues aws ec2 release-address --allocation-id eipalloc-0865c0d1f58a006dd

(END)
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)