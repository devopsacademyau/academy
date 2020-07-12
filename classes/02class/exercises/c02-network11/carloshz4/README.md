# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
 aws ec2 run-instances \
           --image-id ami-0a58e22c727337c51 \
           --instance-type t2.micro \
           --count 1 \
           --subnet-id subnet-0d38b36b10174c83e \
           --key-name  kp_public \
           --security-group-ids sg-05f86f5a3f83b74cb \
           --associate-public-ip-address \
           --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=PublicDA}]' \
             --region ap-southeast-2


------------------------------------------------------------------------------
|                                RunInstances                                |
+-------------------------------+--------------------------------------------+
|  OwnerId                      |  016454647794                              |
|  ReservationId                |  r-0eef0606c7df08dca                       |
+-------------------------------+--------------------------------------------+
||                                 Instances                                ||
|+------------------------+-------------------------------------------------+|
||  AmiLaunchIndex        |  0                                              ||
||  Architecture          |  x86_64                                         ||
||  ClientToken           |  3999b817-b2af-48ec-a695-e276ad1dcb6d           ||
||  EbsOptimized          |  False                                          ||
||  Hypervisor            |  xen                                            ||
||  ImageId               |  ami-0a58e22c727337c51                          ||
||  InstanceId            |  i-0545887ecc50f99e8                            ||
||  InstanceType          |  t2.micro                                       ||
||  KeyName               |  kp_public                                      ||
||  LaunchTime            |  2020-07-09T04:44:23.000Z                       ||
||  PrivateDnsName        |  ip-10-10-0-60.ap-southeast-2.compute.internal  ||
||  PrivateIpAddress      |  10.10.0.60                                     ||
||  PublicDnsName         |                                                 ||
||  RootDeviceName        |  /dev/xvda                                      ||
||  RootDeviceType        |  ebs                                            ||
||  SourceDestCheck       |  True                                           ||
||  StateTransitionReason |                                                 ||
||  SubnetId              |  subnet-0d38b36b10174c83e                       ||
||  VirtualizationType    |  hvm                                            ||
||  VpcId                 |  vpc-012017b09f0dae62e                          ||
|+------------------------+-------------------------------------------------+|
|||                    CapacityReservationSpecification                    |||
||+----------------------------------------------------------+-------------+||
|||  CapacityReservationPreference                           |  open       |||
||+----------------------------------------------------------+-------------+||
|||                               CpuOptions                               |||
||+--------------------------------------------------------+---------------+||
|||  CoreCount                                             |  1            |||
|||  ThreadsPerCore                                        |  1            |||
||+--------------------------------------------------------+---------------+||
|||                             MetadataOptions                            |||
||+-------------------------------------------------+----------------------+||
|||  HttpEndpoint                                   |  enabled             |||
|||  HttpPutResponseHopLimit                        |  1                   |||
|||  HttpTokens                                     |  optional            |||
|||  State                                          |  pending             |||
||+-------------------------------------------------+----------------------+||
|||                               Monitoring                               |||
||+------------------------------+-----------------------------------------+||
|||  State                       |  disabled                               |||
||+------------------------------+-----------------------------------------+||
|||                            NetworkInterfaces                           |||
||+-------------------------------+----------------------------------------+||
|||  Description                  |                                        |||
|||  InterfaceType                |  interface                             |||
|||  MacAddress                   |  02:38:ae:ed:94:90                     |||
|||  NetworkInterfaceId           |  eni-0d42834c5528e95c4                 |||
|||  OwnerId                      |  016454647794                          |||
|||  PrivateIpAddress             |  10.10.0.60                            |||
|||  SourceDestCheck              |  True                                  |||
|||  Status                       |  in-use                                |||
|||  SubnetId                     |  subnet-0d38b36b10174c83e              |||
|||  VpcId                        |  vpc-012017b09f0dae62e                 |||
||+-------------------------------+----------------------------------------+||
||||                              Attachment                              ||||
|||+----------------------------+-----------------------------------------+|||
||||  AttachTime                |  2020-07-09T04:44:23.000Z               ||||
||||  AttachmentId              |  eni-attach-076bc6db354fd51e0           ||||
||||  DeleteOnTermination       |  True                                   ||||
||||  DeviceIndex               |  0                                      ||||
||||  Status                    |  attaching                              ||||
|||+----------------------------+-----------------------------------------+|||
||||                                Groups                                ||||
|||+-----------------------+----------------------------------------------+|||
||||  GroupId              |  sg-05f86f5a3f83b74cb                        ||||
||||  GroupName            |  public-sg                                   ||||
|||+-----------------------+----------------------------------------------+|||
||||                          PrivateIpAddresses                          ||||
|||+----------------------------------------+-----------------------------+|||
||||  Primary                               |  True                       ||||
||||  PrivateIpAddress                      |  10.10.0.60                 ||||
|||+----------------------------------------+-----------------------------+|||
|||                                Placement                               |||
||+------------------------------------+-----------------------------------+||
|||  AvailabilityZone                  |  ap-southeast-2a                  |||
|||  GroupName                         |                                   |||
|||  Tenancy                           |  default                          |||
||+------------------------------------+-----------------------------------+||
|||                             SecurityGroups                             |||
||+------------------------+-----------------------------------------------+||
|||  GroupId               |  sg-05f86f5a3f83b74cb                         |||
|||  GroupName             |  public-sg                                    |||
||+------------------------+-----------------------------------------------+||
|||                                  State                                 |||
||+-----------------------------+------------------------------------------+||
|||  Code                       |  0                                       |||
|||  Name                       |  pending                                 |||
||+-----------------------------+------------------------------------------+||
|||                               StateReason                              |||
||+-----------------------------------+------------------------------------+||
|||  Code                             |  pending                           |||
|||  Message                          |  pending                           |||
||+-----------------------------------+------------------------------------+||
|||                                  Tags                                  |||
||+------------------------------+-----------------------------------------+||
|||  Key                         |  Name                                   |||
|||  Value                       |  PublicDA                               |||
||+------------------------------+-----------------------------------------+||
```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
aws ec2 run-instances \
    --image-id ami-0a58e22c727337c51 \
    --instance-type t2.micro \
    --count 1 \
    --key-name kp_private \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=PrivateDA}]' \
    --network-interface '[{"DeviceIndex":0,"NetworkInterfaceId":"eni-0e4b24dea0142b128"}]' \
    --region ap-southeast-2


-----------------------------------------------------------------------------
|                               RunInstances                                |
+-------------------------------+-------------------------------------------+
|  OwnerId                      |  016454647794                             |
|  ReservationId                |  r-016f11a5933fb626b                      |
+-------------------------------+-------------------------------------------+
||                                Instances                                ||
|+------------------------+------------------------------------------------+|
||  AmiLaunchIndex        |  0                                             ||
||  Architecture          |  x86_64                                        ||
||  ClientToken           |  c563f575-c73d-42c6-b215-dd5ea303ead5          ||
||  EbsOptimized          |  False                                         ||
||  Hypervisor            |  xen                                           ||
||  ImageId               |  ami-0a58e22c727337c51                         ||
||  InstanceId            |  i-092b5ceacbb7ac2a6                           ||
||  InstanceType          |  t2.micro                                      ||
||  KeyName               |  kp_private                                    ||
||  LaunchTime            |  2020-07-09T05:04:04.000Z                      ||
||  PrivateDnsName        |  ip-10-10-1-4.ap-southeast-2.compute.internal  ||
||  PrivateIpAddress      |  10.10.1.4                                     ||
||  PublicDnsName         |                                                ||
||  RootDeviceName        |  /dev/xvda                                     ||
||  RootDeviceType        |  ebs                                           ||
||  SourceDestCheck       |  True                                          ||
||  StateTransitionReason |                                                ||
||  SubnetId              |  subnet-0228cfd1fd235bbdc                      ||
||  VirtualizationType    |  hvm                                           ||
||  VpcId                 |  vpc-012017b09f0dae62e                         ||
|+------------------------+------------------------------------------------+|
|||                   CapacityReservationSpecification                    |||
||+---------------------------------------------------------+-------------+||
|||  CapacityReservationPreference                          |  open       |||
||+---------------------------------------------------------+-------------+||
|||                              CpuOptions                               |||
||+-------------------------------------------------------+---------------+||
|||  CoreCount                                            |  1            |||
|||  ThreadsPerCore                                       |  1            |||
||+-------------------------------------------------------+---------------+||
|||                            MetadataOptions                            |||
||+-------------------------------------------------+---------------------+||
|||  HttpEndpoint                                   |  enabled            |||
|||  HttpPutResponseHopLimit                        |  1                  |||
|||  HttpTokens                                     |  optional           |||
|||  State                                          |  pending            |||
||+-------------------------------------------------+---------------------+||
|||                              Monitoring                               |||
||+-----------------------------+-----------------------------------------+||
|||  State                      |  disabled                               |||
||+-----------------------------+-----------------------------------------+||
|||                           NetworkInterfaces                           |||
||+------------------------------+----------------------------------------+||
|||  Description                 |  DA ENI                                |||
|||  InterfaceType               |  interface                             |||
|||  MacAddress                  |  02:8b:25:d7:1d:ec                     |||
|||  NetworkInterfaceId          |  eni-0e4b24dea0142b128                 |||
|||  OwnerId                     |  016454647794                          |||
|||  PrivateIpAddress            |  10.10.1.4                             |||
|||  SourceDestCheck             |  True                                  |||
|||  Status                      |  in-use                                |||
|||  SubnetId                    |  subnet-0228cfd1fd235bbdc              |||
|||  VpcId                       |  vpc-012017b09f0dae62e                 |||
||+------------------------------+----------------------------------------+||
||||                             Attachment                              ||||
|||+----------------------------+----------------------------------------+|||
||||  AttachTime                |  2020-07-09T05:04:04.000Z              ||||
||||  AttachmentId              |  eni-attach-09128dfc190334a7b          ||||
||||  DeleteOnTermination       |  False                                 ||||
||||  DeviceIndex               |  0                                     ||||
||||  Status                    |  attaching                             ||||
|||+----------------------------+----------------------------------------+|||
||||                               Groups                                ||||
|||+--------------------+------------------------------------------------+|||
||||  GroupId           |  sg-036c606d2b1d3def7                          ||||
|||+--------------------+------------------------------------------------+|||
||||                         PrivateIpAddresses                          ||||
|||+-----------------------------------------+---------------------------+|||
||||  Primary                                |  True                     ||||
||||  PrivateIpAddress                       |  10.10.1.4                ||||
|||+-----------------------------------------+---------------------------+|||
|||                               Placement                               |||
||+-----------------------------------+-----------------------------------+||
|||  AvailabilityZone                 |  ap-southeast-2a                  |||
|||  GroupName                        |                                   |||
|||  Tenancy                          |  default                          |||
||+-----------------------------------+-----------------------------------+||
|||                            SecurityGroups                             |||
||+---------------------+-------------------------------------------------+||
|||  GroupId            |  sg-036c606d2b1d3def7                           |||
||+---------------------+-------------------------------------------------+||
|||                                 State                                 |||
||+-----------------------------+-----------------------------------------+||
|||  Code                       |  0                                      |||
|||  Name                       |  pending                                |||
||+-----------------------------+-----------------------------------------+||
|||                              StateReason                              |||
||+----------------------------------+------------------------------------+||
|||  Code                            |  pending                           |||
|||  Message                         |  pending                           |||
||+----------------------------------+------------------------------------+||
|||                                 Tags                                  |||
||+----------------------------+------------------------------------------+||
|||  Key                       |  Name                                    |||
|||  Value                     |  PrivateDA                               |||
||+----------------------------+------------------------------------------+||
```

- Commands for accessing your public instance using ssh

If using .pem KP:
```
ssh -i "kp_public.pem" ec2-user@13.210.168.225
```
Note: make sure to have 700 permissions for the KP.
If using putty, load the .ppk. Recommend to use Pageant to load the KP (for both instances), then on putty use "Allow agent forwarding" under Connection, SSH, Auth.

- Commands for accessing your private instance from public one

```
[ec2-user@ip-10-10-0-60 ~]$ ssh 10.10.1.4
The authenticity of host '10.10.1.4 (10.10.1.4)' can't be established.
ECDSA key fingerprint is SHA256:t30n7DcFrHYl75qGkoaUcsdO9beizKa4GPNU7m6YGRU.
ECDSA key fingerprint is MD5:e8:19:07:f8:3b:76:29:b5:40:53:84:33:0b:65:c2:3c.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '10.10.1.4' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
9 package(s) needed for security, out of 16 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-10-1-4 ~]$
```

- Commands for testing ping to `8.8.8.8` from private instance

```
[ec2-user@ip-10-10-1-4 ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=109 time=1.92 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=109 time=1.63 ms
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)