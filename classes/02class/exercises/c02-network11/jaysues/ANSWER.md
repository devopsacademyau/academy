# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
➜  ~ aws ec2 create-key-pair --key-name c02-net11 --query 'KeyMaterial' --output text > c02-net11.pem

➜  ~ sudo chmod 400 c02-net11.pem
aws ec2 run-instances   --image-id ami-0a4e637babb7b0a86  --instance-type t2.micro   --key-name c02-net11  --subnet-id subnet-0baf3a3a83b8df14c --security-group-ids sg-0c811d6dc3469e9e3 --associate-public-ip-address

-----------------------------------------------------------------------------------
|                                  RunInstances                                   |
+---------------------------------+-----------------------------------------------+
|  OwnerId                        |  738343455957                                 |
|  ReservationId                  |  r-0ee06fcd23ec4a952                          |
+---------------------------------+-----------------------------------------------+
||                                   Instances                                   ||
|+------------------------+------------------------------------------------------+|
||  AmiLaunchIndex        |  0                                                   ||
||  Architecture          |  x86_64                                              ||
||  ClientToken           |  00aff914-e651-48fd-ac55-4dfe9ec90138                ||
||  EbsOptimized          |  False                                               ||
||  EnaSupport            |  True
||
||  Hypervisor            |  xen
||  Architecture          |  x86_64
||
||  ClientToken           |  00aff914-e651-48fd-ac55-4dfe9ec90138
||
||  EbsOptimized          |  False
||
||  EnaSupport            |  True
||
||  Hypervisor            |  xen
||
||  ImageId               |  ami-0a4e637babb7b0a86
||
||  InstanceId            |  i-0ef7237982ec61975
||
||  InstanceType          |  t2.micro
||
||  KeyName               |  c02-net11
||
||  LaunchTime            |  2022-02-18T02:12:53+00:00
||
||  PrivateDnsName        |  ip-192-168-120-239.ap-southeast-2.compute.internal
||
||  PrivateIpAddress      |  192.168.120.239
||
||  PublicDnsName         |
||
||  RootDeviceName        |  /dev/xvda
||
||  RootDeviceType        |  ebs
||
||  SourceDestCheck       |  True
||
||  StateTransitionReason |
||
||  SubnetId              |  subnet-0baf3a3a83b8df14c
||
||  VirtualizationType    |  hvm
||
||  VpcId                 |  vpc-01cf6494735903d97
||
|+------------------------+------------------------------------------------------
+|
|||                      CapacityReservationSpecification                       |
||
||+--------------------------------------------------------------+--------------+
||
|||  CapacityReservationPreference                               |  open        |
||
||+--------------------------------------------------------------+--------------+
||
|||                                 CpuOptions                                  |
||
||+------------------------------------------------------------+----------------+
||
|||  CoreCount                                                 |  1             |
||
|||  ThreadsPerCore                                            |  1             |
||
||+------------------------------------------------------------+----------------+
||
|||                               EnclaveOptions                                |
||
||+-----------------------------------------+-----------------------------------+
||
|||  Enabled                                |  False                            |
||
||+-----------------------------------------+-----------------------------------+
||
|||                               MetadataOptions                               |
||
||+-----------------------------------------------------+-----------------------+
||
|||  HttpEndpoint                                       |  enabled              |
||
|||  HttpProtocolIpv6                                   |  disabled             |
||
|||  HttpPutResponseHopLimit                            |  1                    |
||
|||  HttpTokens                                         |  optional             |
||
|||  InstanceMetadataTags                               |  disabled             |
||
|||  State                                              |  pending              |
||
||+-----------------------------------------------------+-----------------------+
||
|||                                 Monitoring                                  |
||
||+--------------------------------+--------------------------------------------+
||
|||  State                         |  disabled                                  |
||
||+--------------------------------+--------------------------------------------+
||
|||                              NetworkInterfaces                              |
||
||+---------------------------------+-------------------------------------------+
||
|||  Description                    |                                           |
||
|||  InterfaceType                  |  interface                                |
||
|||  MacAddress                     |  02:96:33:21:a8:fe                        |
||
|||  NetworkInterfaceId             |  eni-0cd6a96ded434a07d                    |
||
|||  OwnerId                        |  738343455957                             |
||
|||  PrivateIpAddress               |  192.168.120.239                          |
||
|||  SourceDestCheck                |  True                                     |
||
|||  Status                         |  in-use                                   |
||
|||  SubnetId                       |  subnet-0baf3a3a83b8df14c                 |
||
|||  VpcId                          |  vpc-01cf6494735903d97                    |
||
||+---------------------------------+-------------------------------------------+
||
||||                                Attachment                                 ||
||
|||+------------------------------+--------------------------------------------+|
||
||||  AttachTime                  |  2022-02-18T02:12:53+00:00                 ||
||
||||  AttachmentId                |  eni-attach-04ff67c34cd770ba3              ||
||
||||  DeleteOnTermination         |  True                                      ||
||
||||  DeviceIndex                 |  0                                         ||
||
||||  NetworkCardIndex            |  0                                         ||
||
||||  Status                      |  attaching                                 ||
||
|||+------------------------------+--------------------------------------------+|
||
||||                                  Groups                                   ||
||
|||+-------------------------+-------------------------------------------------+|
||
||||  GroupId                |  sg-0c811d6dc3469e9e3                           ||
||
||||  GroupName              |  public-sg                                      ||
||
|||+-------------------------+-------------------------------------------------+|
||
||||                            PrivateIpAddresses                             ||
||
|||+-------------------------------------+-------------------------------------+|
||
||||  Primary                            |  True                               ||
||
||||  PrivateIpAddress                   |  192.168.120.239                    ||
||
|||+-------------------------------------+-------------------------------------+|
||
|||                                  Placement                                  |
||
||+---------------------------------------+-------------------------------------+
||
|||  AvailabilityZone                     |  ap-southeast-2a                    |
||
|||  GroupName                            |                                     |
||
|||  Tenancy                              |  default                            |
||
||+---------------------------------------+-------------------------------------+
||
|||                            PrivateDnsNameOptions                            |
||
||+----------------------------------------------------------+------------------+
||
|||  EnableResourceNameDnsAAAARecord                         |  False           |
||
|||  EnableResourceNameDnsARecord                            |  False           |
||
|||  HostnameType                                            |  ip-name         |
||
||+----------------------------------------------------------+------------------+
||
|||                               SecurityGroups                                |
||
||+--------------------------+--------------------------------------------------+
||
|||  GroupId                 |  sg-0c811d6dc3469e9e3                            |
||
|||  GroupName               |  public-sg                                       |
||
||+--------------------------+--------------------------------------------------+
||
|||                                    State                                    |
||
||+-------------------------------+---------------------------------------------+
||
|||  Code                         |  0                                          |
||
|||  Name                         |  pending                                    |
||
||+-------------------------------+---------------------------------------------+
||
|||                                 StateReason                                 |
||
||+-------------------------------------+---------------------------------------+
||
|||  Code                               |  pending                              |
||
|||  Message                            |  pending                              |
||
||+-------------------------------------+---------------------------------------+
||
(END)
```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
aws ec2 run-instances --image-id ami-0a4e637babb7b0a86  --instance-type t2.micro   --key-name c02-net11  --network-interfaces '[{"DeviceIndex":0,"NetworkInterfaceId":"eni-002fdb5bac6acd552"}]' 

-----------------------------------------------------------------------------------
|                                  RunInstances                                   |
+---------------------------------+-----------------------------------------------+
|  OwnerId                        |  738343455957                                 |
|  ReservationId                  |  r-0ee06fcd23ec4a952                          |
+---------------------------------+-----------------------------------------------+
||                                   Instances                                   ||
|+------------------------+------------------------------------------------------+|
||  AmiLaunchIndex        |  0                                                   ||
||  Architecture          |  x86_64                                              ||
||  ClientToken           |  00aff914-e651-48fd-ac55-4dfe9ec90138                ||
||  EbsOptimized          |  False                                               ||
||  EnaSupport            |  True
||
||  Hypervisor            |  xen
||  Architecture          |  x86_64
||
||  ClientToken           |  00aff914-e651-48fd-ac55-4dfe9ec90138
||
||  EbsOptimized          |  False
||
||  EnaSupport            |  True
||
||  Hypervisor            |  xen
||
||  ImageId               |  ami-0a4e637babb7b0a86
||
||  InstanceId            |  i-0ef7237982ec61975
||
||  InstanceType          |  t2.micro
||
||  KeyName               |  c02-net11
||
||  LaunchTime            |  2022-02-18T02:12:53+00:00
||
||  PrivateDnsName        |  ip-192-168-120-239.ap-southeast-2.compute.internal
||
||  PrivateIpAddress      |  192.168.120.239
||
||  PublicDnsName         |
||
||  RootDeviceName        |  /dev/xvda
||
||  RootDeviceType        |  ebs
||
||  SourceDestCheck       |  True
||
||  StateTransitionReason |
||
||  SubnetId              |  subnet-0baf3a3a83b8df14c
||
||  VirtualizationType    |  hvm
||
||  VpcId                 |  vpc-01cf6494735903d97
||
|+------------------------+------------------------------------------------------
+|
|||                      CapacityReservationSpecification                       |
||
||+--------------------------------------------------------------+--------------+
||
|||  CapacityReservationPreference                               |  open        |
||
||+--------------------------------------------------------------+--------------+
||
|||                                 CpuOptions                                  |
||
||+------------------------------------------------------------+----------------+
||
|||  CoreCount                                                 |  1             |
||
|||  ThreadsPerCore                                            |  1             |
||
||+------------------------------------------------------------+----------------+
||
|||                               EnclaveOptions                                |
||
||+-----------------------------------------+-----------------------------------+
||
|||  Enabled                                |  False                            |
||
||+-----------------------------------------+-----------------------------------+
||
|||                               MetadataOptions                               |
||
||+-----------------------------------------------------+-----------------------+
||
|||  HttpEndpoint                                       |  enabled              |
||
|||  HttpProtocolIpv6                                   |  disabled             |
||
|||  HttpPutResponseHopLimit                            |  1                    |
||
|||  HttpTokens                                         |  optional             |
||
|||  InstanceMetadataTags                               |  disabled             |
||
|||  State                                              |  pending              |
||
||+-----------------------------------------------------+-----------------------+
||
|||                                 Monitoring                                  |
||
||+--------------------------------+--------------------------------------------+
||
|||  State                         |  disabled                                  |
||
||+--------------------------------+--------------------------------------------+
||
|||                              NetworkInterfaces                              |
||
||+---------------------------------+-------------------------------------------+
||
|||  Description                    |                                           |
||
|||  InterfaceType                  |  interface                                |
||
|||  MacAddress                     |  02:96:33:21:a8:fe                        |
||
|||  NetworkInterfaceId             |  eni-0cd6a96ded434a07d                    |
||
|||  OwnerId                        |  738343455957                             |
||
|||  PrivateIpAddress               |  192.168.120.239                          |
||
|||  SourceDestCheck                |  True                                     |
||
|||  Status                         |  in-use                                   |
||
|||  SubnetId                       |  subnet-0baf3a3a83b8df14c                 |
||
|||  VpcId                          |  vpc-01cf6494735903d97                    |
||
||+---------------------------------+-------------------------------------------+
||
||||                                Attachment                                 ||
||
|||+------------------------------+--------------------------------------------+|
||
||||  AttachTime                  |  2022-02-18T02:12:53+00:00                 ||
||
||||  AttachmentId                |  eni-attach-04ff67c34cd770ba3              ||
||
||||  DeleteOnTermination         |  True                                      ||
||
||||  DeviceIndex                 |  0                                         ||
||
||||  NetworkCardIndex            |  0                                         ||
||
||||  Status                      |  attaching                                 ||
||
|||+------------------------------+--------------------------------------------+|
||
||||                                  Groups                                   ||
||
|||+-------------------------+-------------------------------------------------+|
||
||||  GroupId                |  sg-0c811d6dc3469e9e3                           ||
||
||||  GroupName              |  public-sg                                      ||
||
|||+-------------------------+-------------------------------------------------+|
||
||||                            PrivateIpAddresses                             ||
||
|||+-------------------------------------+-------------------------------------+|
||
||||  Primary                            |  True                               ||
||
||||  PrivateIpAddress                   |  192.168.120.239                    ||
||
|||+-------------------------------------+-------------------------------------+|
||
|||                                  Placement                                  |
||
||+---------------------------------------+-------------------------------------+
||
|||  AvailabilityZone                     |  ap-southeast-2a                    |
||
|||  GroupName                            |                                     |
||
|||  Tenancy                              |  default                            |
||
||+---------------------------------------+-------------------------------------+
||
|||                            PrivateDnsNameOptions                            |
||
||+----------------------------------------------------------+------------------+
||
|||  EnableResourceNameDnsAAAARecord                         |  False           |
||
|||  EnableResourceNameDnsARecord                            |  False           |
||
|||  HostnameType                                            |  ip-name         |
||
||+----------------------------------------------------------+------------------+
||
|||                               SecurityGroups                                |
||
||+--------------------------+--------------------------------------------------+
||
|||  GroupId                 |  sg-0c811d6dc3469e9e3                            |
||
➜  ~ aws ec2 describe-security-groups --filters Name=group-name,Values=*sg* Name=description,Values=*SSH* Name=ip-permission.from-port,Values=22 Name=ip-permission.to-port,Values=22 --query "SecurityGroups[*].{Name:GroupName,ID:GroupId,Descrip---------------------------------------------------------------------------------
|                                 RunInstances                                  |
+--------------------------------+----------------------------------------------+
|  OwnerId                       |  738343455957                                |
|  ReservationId                 |  r-0f61558aa0f421343                         |
+--------------------------------+----------------------------------------------+
||                                  Instances                                  ||
|+------------------------+----------------------------------------------------+|
||  AmiLaunchIndex        |  0                                                 ||
||  Architecture          |  x86_64                                            ||
||  ClientToken           |  782634d7-cfa7-47a8-8183-018a2dccdb83              ||
||  EbsOptimized          |  False                                             ||
||  EnaSupport            |  True                                              ||
||  Hypervisor            |  xen                                               ||
||  ImageId               |  ami-0a4e637babb7b0a86                             ||
||  InstanceId            |  i-04b3cc5058d94f9a4                               ||
||  InstanceType          |  t2.micro                                          ||
||  KeyName               |  c02-net11                                         ||
||  LaunchTime            |  2022-02-18T02:16:09+00:00                         ||
||  PrivateDnsName        |  ip-192-168-13-37.ap-southeast-2.compute.internal  ||
||  PrivateIpAddress      |  192.168.13.37                                     ||
||  PublicDnsName         |                                                    ||
||  RootDeviceName        |  /dev/xvda                                         ||
||  RootDeviceType        |  ebs                                               ||
||  SourceDestCheck       |  True                                              ||
||  StateTransitionReason |                                                    ||
||  SubnetId              |  subnet-0ae613de296de90d6                          ||
||  VirtualizationType    |  hvm                                               ||
||  VpcId                 |  vpc-01cf6494735903d97                             ||
|+------------------------+----------------------------------------------------+|
|||                     CapacityReservationSpecification                      |||
||+------------------------------------------------------------+--------------+||
|||  CapacityReservationPreference                             |  open        |||
||+------------------------------------------------------------+--------------+||
|||                                CpuOptions                                 |||
||+----------------------------------------------------------+----------------+||
|||  CoreCount                                               |  1             |||
|||  ThreadsPerCore                                          |  1             |||
||+----------------------------------------------------------+----------------+||
|||                              EnclaveOptions                               |||
||+----------------------------------------+----------------------------------+||
|||  Enabled                               |  False                           |||
||+----------------------------------------+----------------------------------+||
|||                              MetadataOptions                              |||
||+---------------------------------------------------+-----------------------+||
|||  HttpEndpoint                                     |  enabled              |||
|||  HttpProtocolIpv6                                 |  disabled             |||
|||  HttpPutResponseHopLimit                          |  1                    |||
|||  HttpTokens                                       |  optional             |||
|||  InstanceMetadataTags                             |  disabled             |||
|||  State                                            |  pending              |||
||+---------------------------------------------------+-----------------------+||
|||                                Monitoring                                 |||
||+-------------------------------+-------------------------------------------+||
|||  State                        |  disabled                                 |||
||+-------------------------------+-------------------------------------------+||
|||                             NetworkInterfaces                             |||
||+----------------------------+----------------------------------------------+||
|||  Description               |  DevopsAcademy Network Interface             |||
|||  InterfaceType             |  interface                                   |||
|||  MacAddress                |  02:4d:8c:3b:8a:10                           |||
|||  NetworkInterfaceId        |  eni-002fdb5bac6acd552                       |||
|||  OwnerId                   |  738343455957                                |||
|||  PrivateIpAddress          |  192.168.13.37                               |||
|||  SourceDestCheck           |  True                                        |||
|||  Status                    |  in-use                                      |||
|||  SubnetId                  |  subnet-0ae613de296de90d6                    |||
|||  VpcId                     |  vpc-01cf6494735903d97                       |||
||+----------------------------+----------------------------------------------+||
||||                               Attachment                                ||||
|||+-----------------------------+-------------------------------------------+|||
||||  AttachTime                 |  2022-02-18T02:16:09+00:00                ||||
||||  AttachmentId               |  eni-attach-02e868839497bffe5             ||||
||||  DeleteOnTermination        |  False                                    ||||
||||  DeviceIndex                |  0                                        ||||
||||  NetworkCardIndex           |  0                                        ||||
||||  Status                     |  attaching                                ||||
|||+-----------------------------+-------------------------------------------+|||
||||                                 Groups                                  ||||
|||+----------------------+--------------------------------------------------+|||
||||  GroupId             |  sg-0b173087fa4c40d38                            ||||
|||+----------------------+--------------------------------------------------+|||
||||                           PrivateIpAddresses                            ||||
|||+---------------------------------------+---------------------------------+|||
||||  Primary                              |  True                           ||||
||||  PrivateIpAddress                     |  192.168.13.37                  ||||
|||+---------------------------------------+---------------------------------+|||
|||                                 Placement                                 |||
||+-------------------------------------+-------------------------------------+||
|||  AvailabilityZone                   |  ap-southeast-2a                    |||
|||  GroupName                          |                                     |||
|||  Tenancy                            |  default                            |||
||+-------------------------------------+-------------------------------------+||
|||                           PrivateDnsNameOptions                           |||
||+---------------------------------------------------------+-----------------+||
|||  EnableResourceNameDnsAAAARecord                        |  False          |||
|||  EnableResourceNameDnsARecord                           |  False          |||
|||  HostnameType                                           |  ip-name        |||
||+---------------------------------------------------------+-----------------+||
|||                              SecurityGroups                               |||
||+----------------------+----------------------------------------------------+||
|||  GroupId             |  sg-0b173087fa4c40d38                              |||
||+----------------------+----------------------------------------------------+||
|||                                   State                                   |||
||+------------------------------+--------------------------------------------+||
|||  Code                        |  0                                         |||
|||  Name                        |  pending                                   |||
||+------------------------------+--------------------------------------------+||
|||                                StateReason                                |||
||+------------------------------------+--------------------------------------+||
|||  Code                              |  pending                             |||
|||  Message                           |  pending                             |||
||+------------------------------------+--------------------------------------+||
(END)

```

- Commands for accessing your public instance using ssh

```
➜  ~ aws ec2 describe-instances
➜  ~ ssh-add c02-net11.pem
Identity added: c02-net11.pem (c02-net11.pem)
➜  ~ ssh -i c02-net11.pem ec2-user@54.252.158.47
The authenticity of host '54.252.158.47 (54.252.158.47)' can't be established.
ED25519 key fingerprint is SHA256:Q5PSMD2zX2AHG+FYXssbyG9y6AittJSlfiqUj4gVcfU.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '54.252.158.47' (ED25519) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
3 package(s) needed for security, out of 6 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-192-168-120-239 ~]$
```

- Commands for accessing your private instance from public one

```
[ec2-user@ip-192-168-120-239 ~]$ ssh ec2-user@192.168.13.37

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
13 package(s) needed for security, out of 22 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-192-168-13-37 ~]$ 
```

- Commands for testing ping to `8.8.8.8` from private instance

```
[ec2-user@ip-192-168-13-37 ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=110 time=1.27 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=110 time=1.34 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=110 time=1.35 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=110 time=1.41 ms
64 bytes from 8.8.8.8: icmp_seq=5 ttl=110 time=1.33 ms
64 bytes from 8.8.8.8: icmp_seq=6 ttl=110 time=1.30 ms
64 bytes from 8.8.8.8: icmp_seq=7 ttl=110 time=1.38 ms
64 bytes from 8.8.8.8: icmp_seq=8 ttl=110 time=1.36 ms
^C
--- 8.8.8.8 ping statistics ---
8 packets transmitted, 8 received, 0% packet loss, time 7010ms
rtt min/avg/max/mdev = 1.274/1.346/1.412/0.052 ms
[ec2-user@ip-192-168-13-37 ~]$
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)