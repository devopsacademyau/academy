# C01-AWS01

## High level strategy and sequence

Trying to do more CLI and less Console...
- Create Key Pairs
- Get default VPC id
- Get subnet id
- Create Security Groups
- Create first instance (Jumphost)
- Create second instance


## Commands Execution Output

### PREWORK

#### Create Key Pair for first and second instance
```
aws ec2 create-key-pair --key-name kp_public --query 'KeyMaterial' --output text > kp_public.pem
aws ec2 create-key-pair --key-name kp_private --query 'KeyMaterial' --output text > kp_private.pem
```
#### Convert puttygen to convert the key pairs from .pem to .ppk.
The .ppk format is needed to access both instances via putty without the need to upload the second Key Pair to the Jumphost (first instance)

Instructions to convert the format [here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html)


#### Get VPC id and Subnet id
This info is needed for further commands

Get VPC id
```
aws ec2 describe-vpcs --filters "Name=isDefault, Values=true" |grep VpcId 
||  VpcId                |  vpc-0746436f        ||
```

Get Subnet id
```
aws ec2 describe-subnets --filters "Name=vpc-id,Values=vpc-0746436f" |grep SubnetId
||  SubnetId                    |  subnet-0ab82370                                            ||
||  SubnetId                    |  subnet-de73b092                                            ||
||  SubnetId                    |  subnet-5d577a35                                            ||
```
Note there are multiple as there's one subnet per AZ. I chose the first one.


#### Create Security Groups

Create a security group for the first instance (jumphost).

```
aws ec2 create-security-group --group-name SGPublic --description "DA Public SG" --vpc-id vpc-0746436f
-------------------------------------
|        CreateSecurityGroup        |
+----------+------------------------+
|  GroupId |  sg-0f77e29548a70a640  |
+----------+------------------------+
```
The SG ID is used for next command

Add to that SG the rule to accept ssh connections from the internet.

```
aws ec2 authorize-security-group-ingress --group-id sg-0f77e29548a70a640 --protocol tcp --port 22 --cidr 0.0.0.0/0
```
Create security group for second instance.

```
aws ec2 create-security-group --group-name SGPrivate --description "DA Private SG" --vpc-id vpc-0746436f
-------------------------------------
|        CreateSecurityGroup        |
+----------+------------------------+
|  GroupId |  sg-0444f7a5284b1e837  |
+----------+------------------------+
```

The SG ID is used for next command

Add to that SG the rule to accept ssh connections from the first SG (SGPublic)

```
aws ec2 authorize-security-group-ingress --group-id sg-0444f7a5284b1e837 --protocol tcp --port 22 --source-group sg-0f77e29548a70a640
```



### INSTANCES CREATION

- Commands to create the first EC2 instance and any additional resource required:

Use information from previous sections, KP, SG id, Subnet id
```
	aws ec2 run-instances \
	    --image-id ami-026dea5602e368e96 \
	    --instance-type t2.micro \
	    --count 1 \
	    --subnet-id subnet-0ab82370 \
	    --key-name  kp_public \
	    --security-group-ids sg-0f77e29548a70a640 \
	    --associate-public-ip-address \
	    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=PublicDA}]' 

----------------------------------------------------------------------------
|                               RunInstances                               |
+------------------------------+-------------------------------------------+
|  OwnerId                     |  016454647794                             |
|  ReservationId               |  r-05937b94ae04337a6                      |
+------------------------------+-------------------------------------------+
||                                Instances                               ||
|+------------------------+-----------------------------------------------+|
||  AmiLaunchIndex        |  0                                            ||
||  Architecture          |  x86_64                                       ||
||  ClientToken           |                                               ||
||  EbsOptimized          |  False                                        ||
||  Hypervisor            |  xen                                          ||
||  ImageId               |  ami-026dea5602e368e96                        ||
||  InstanceId            |  i-00a8177ca40ae241d                          ||
||  InstanceType          |  t2.micro                                     ||
||  KeyName               |  kp_public                                    ||
||  LaunchTime            |  2020-06-14T06:59:16.000Z                     ||
||  PrivateDnsName        |  ip-172-31-29-120.us-east-2.compute.internal  ||
||  PrivateIpAddress      |  172.31.29.120                                ||
||  PublicDnsName         |                                               ||
||  RootDeviceName        |  /dev/xvda                                    ||
||  RootDeviceType        |  ebs                                          ||
||  SourceDestCheck       |  True                                         ||
||  StateTransitionReason |                                               ||
||  SubnetId              |  subnet-0ab82370                              ||
||  VirtualizationType    |  hvm                                          ||
||  VpcId                 |  vpc-0746436f                                 ||
|+------------------------+-----------------------------------------------+|
|||                   CapacityReservationSpecification                   |||
||+--------------------------------------------------------+-------------+||
|||  CapacityReservationPreference                         |  open       |||
||+--------------------------------------------------------+-------------+||
|||                              CpuOptions                              |||
||+------------------------------------------------------+---------------+||
|||  CoreCount                                           |  1            |||
|||  ThreadsPerCore                                      |  1            |||
||+------------------------------------------------------+---------------+||
|||                              Monitoring                              |||
||+-----------------------------+----------------------------------------+||
|||  State                      |  disabled                              |||
||+-----------------------------+----------------------------------------+||
|||                           NetworkInterfaces                          |||
||+---------------------+------------------------------------------------+||
|||  Description        |                                                |||
|||  MacAddress         |  06:ba:4f:4e:ed:08                             |||
|||  NetworkInterfaceId |  eni-07bf476739998263f                         |||
|||  OwnerId            |  016454647794                                  |||
|||  PrivateDnsName     |  ip-172-31-29-120.us-east-2.compute.internal   |||
|||  PrivateIpAddress   |  172.31.29.120                                 |||
|||  SourceDestCheck    |  True                                          |||
|||  Status             |  in-use                                        |||
|||  SubnetId           |  subnet-0ab82370                               |||
|||  VpcId              |  vpc-0746436f                                  |||
||+---------------------+------------------------------------------------+||
||||                             Attachment                             ||||
|||+---------------------------+----------------------------------------+|||
||||  AttachTime               |  2020-06-14T06:59:16.000Z              ||||
||||  AttachmentId             |  eni-attach-0c4889e139cef71a4          ||||
||||  DeleteOnTermination      |  True                                  ||||
||||  DeviceIndex              |  0                                     ||||
||||  Status                   |  attaching                             ||||
|||+---------------------------+----------------------------------------+|||
||||                               Groups                               ||||
|||+-----------------------+--------------------------------------------+|||
||||  GroupId              |  sg-0f77e29548a70a640                      ||||
||||  GroupName            |  SGPublic                                  ||||
|||+-----------------------+--------------------------------------------+|||
||||                         PrivateIpAddresses                         ||||
|||+-------------------+------------------------------------------------+|||
||||  Primary          |  True                                          ||||
||||  PrivateDnsName   |  ip-172-31-29-120.us-east-2.compute.internal   ||||
||||  PrivateIpAddress |  172.31.29.120                                 ||||
|||+-------------------+------------------------------------------------+|||
|||                               Placement                              |||
||+----------------------------------------+-----------------------------+||
|||  AvailabilityZone                      |  us-east-2b                 |||
|||  GroupName                             |                             |||
|||  Tenancy                               |  default                    |||
||+----------------------------------------+-----------------------------+||
|||                            SecurityGroups                            |||
||+-----------------------+----------------------------------------------+||
|||  GroupId              |  sg-0f77e29548a70a640                        |||
|||  GroupName            |  SGPublic                                    |||
||+-----------------------+----------------------------------------------+||
|||                                 State                                |||
||+----------------------------+-----------------------------------------+||
|||  Code                      |  0                                      |||
|||  Name                      |  pending                                |||
||+----------------------------+-----------------------------------------+||
|||                              StateReason                             |||
||+----------------------------------+-----------------------------------+||
|||  Code                            |  pending                          |||
|||  Message                         |  pending                          |||
||+----------------------------------+-----------------------------------+||
|||                                 Tags                                 |||
||+-----------------------------+----------------------------------------+||
|||  Key                        |  Name                                  |||
|||  Value                      |  PublicDA                              |||
||+-----------------------------+----------------------------------------+||
```
Note image id I grabbed it from the console for Amazon Linux 2. This could potentially be gotten via CLI?

- Commands to connect to the first EC2 instance:

These commands can be used to connect

```
chmod 700 kp_public.pem
ssh -i "kp_public" ec2-user@<public_ip_or_dns_name>
```
But instead I loaded the (ppk) key with (putty) pageant. Then on putty, with the public IP of the instance and in settings, SSH, Auth, select the option "Allow agent forwarding" I was then able to connect with the ec2-user.


```
login as: ec2-user
Authenticating with public key "imported-openssh-key" from agent

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-29-120 ~]$
```


- Commands to create the second EC2 instance and any additional resource required:

Use information from previous sections, KP, SG id, Subnet id
```
	aws ec2 run-instances \
	    --image-id ami-026dea5602e368e96 \
	    --instance-type t2.micro \
	    --count 1 \
	    --subnet-id subnet-0ab82370 \
	    --key-name kp_private \
	    --security-group-ids sg-0444f7a5284b1e837 \
	    --no-associate-public-ip-address \
            --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=PrivateDA}]' 

----------------------------------------------------------------------------
|                               RunInstances                               |
+------------------------------+-------------------------------------------+
|  OwnerId                     |  016454647794                             |
|  ReservationId               |  r-0c485742e34565253                      |
+------------------------------+-------------------------------------------+
||                                Instances                               ||
|+------------------------+-----------------------------------------------+|
||  AmiLaunchIndex        |  0                                            ||
||  Architecture          |  x86_64                                       ||
||  ClientToken           |                                               ||
||  EbsOptimized          |  False                                        ||
||  Hypervisor            |  xen                                          ||
||  ImageId               |  ami-026dea5602e368e96                        ||
||  InstanceId            |  i-014aecc4545c92db3                          ||
||  InstanceType          |  t2.micro                                     ||
||  KeyName               |  kp_private                                   ||
||  LaunchTime            |  2020-06-14T07:02:09.000Z                     ||
||  PrivateDnsName        |  ip-172-31-27-187.us-east-2.compute.internal  ||
||  PrivateIpAddress      |  172.31.27.187                                ||
||  PublicDnsName         |                                               ||
||  RootDeviceName        |  /dev/xvda                                    ||
||  RootDeviceType        |  ebs                                          ||
||  SourceDestCheck       |  True                                         ||
||  StateTransitionReason |                                               ||
||  SubnetId              |  subnet-0ab82370                              ||
||  VirtualizationType    |  hvm                                          ||
||  VpcId                 |  vpc-0746436f                                 ||
|+------------------------+-----------------------------------------------+|
|||                   CapacityReservationSpecification                   |||
||+--------------------------------------------------------+-------------+||
|||  CapacityReservationPreference                         |  open       |||
||+--------------------------------------------------------+-------------+||
|||                              CpuOptions                              |||
||+------------------------------------------------------+---------------+||
|||  CoreCount                                           |  1            |||
|||  ThreadsPerCore                                      |  1            |||
||+------------------------------------------------------+---------------+||
|||                              Monitoring                              |||
||+-----------------------------+----------------------------------------+||
|||  State                      |  disabled                              |||
||+-----------------------------+----------------------------------------+||
|||                           NetworkInterfaces                          |||
||+---------------------+------------------------------------------------+||
|||  Description        |                                                |||
|||  MacAddress         |  06:9b:79:52:57:88                             |||
|||  NetworkInterfaceId |  eni-05d237ba17fa72a43                         |||
|||  OwnerId            |  016454647794                                  |||
|||  PrivateDnsName     |  ip-172-31-27-187.us-east-2.compute.internal   |||
|||  PrivateIpAddress   |  172.31.27.187                                 |||
|||  SourceDestCheck    |  True                                          |||
|||  Status             |  in-use                                        |||
|||  SubnetId           |  subnet-0ab82370                               |||
|||  VpcId              |  vpc-0746436f                                  |||
||+---------------------+------------------------------------------------+||
||||                             Attachment                             ||||
|||+---------------------------+----------------------------------------+|||
||||  AttachTime               |  2020-06-14T07:02:09.000Z              ||||
||||  AttachmentId             |  eni-attach-0397c7ac8dc8a221f          ||||
||||  DeleteOnTermination      |  True                                  ||||
||||  DeviceIndex              |  0                                     ||||
||||  Status                   |  attaching                             ||||
|||+---------------------------+----------------------------------------+|||
||||                               Groups                               ||||
|||+-----------------------+--------------------------------------------+|||
||||  GroupId              |  sg-0444f7a5284b1e837                      ||||
||||  GroupName            |  SGPrivate                                 ||||
|||+-----------------------+--------------------------------------------+|||
||||                         PrivateIpAddresses                         ||||
|||+-------------------+------------------------------------------------+|||
||||  Primary          |  True                                          ||||
||||  PrivateDnsName   |  ip-172-31-27-187.us-east-2.compute.internal   ||||
||||  PrivateIpAddress |  172.31.27.187                                 ||||
|||+-------------------+------------------------------------------------+|||
|||                               Placement                              |||
||+----------------------------------------+-----------------------------+||
|||  AvailabilityZone                      |  us-east-2b                 |||
|||  GroupName                             |                             |||
|||  Tenancy                               |  default                    |||
||+----------------------------------------+-----------------------------+||
|||                            SecurityGroups                            |||
||+-----------------------+----------------------------------------------+||
|||  GroupId              |  sg-0444f7a5284b1e837                        |||
|||  GroupName            |  SGPrivate                                   |||
||+-----------------------+----------------------------------------------+||
|||                                 State                                |||
||+----------------------------+-----------------------------------------+||
|||  Code                      |  0                                      |||
|||  Name                      |  pending                                |||
||+----------------------------+-----------------------------------------+||
|||                              StateReason                             |||
||+----------------------------------+-----------------------------------+||
|||  Code                            |  pending                          |||
|||  Message                         |  pending                          |||
||+----------------------------------+-----------------------------------+||
|||                                 Tags                                 |||
||+---------------------------+------------------------------------------+||
|||  Key                      |  Name                                    |||
|||  Value                    |  PrivateDA                               |||
||+---------------------------+------------------------------------------+||
```

- Commands to connect to the second EC2 instance:

I loaded the second (ppk) key with (putty) pageant. Then on putty, after connecting to the first instance and using the private DNS name of the second instance I typed:


```
[ec2-user@ip-172-31-29-120 ~]$ ssh ip-172-31-27-187.us-east-2.compute.internal
The authenticity of host 'ip-172-31-27-187.us-east-2.compute.internal (172.31.27.187)' can't be established.
ECDSA key fingerprint is SHA256:L2XWbPIl0xMOL0dGIaEmLRavRHzcS3WkcZq4TvkpUdk.
ECDSA key fingerprint is MD5:4e:a6:0d:22:3a:19:be:28:f2:b1:7e:d5:82:1f:a0:97.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'ip-172-31-27-187.us-east-2.compute.internal' (ECDSA) to the list of known hosts.
Last login: Sun Jun 14 07:19:41 2020 from ip-172-31-29-120.us-east-2.compute.internal

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-31-27-187 ~]$
```


***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)
