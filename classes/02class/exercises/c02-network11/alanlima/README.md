# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```

$ aws ec2 run-instances \
    --image-id ami-088ff0e3bde7b3fdf \
    --instance-type t2.micro \
    --key-name kp-devops \
    --subnet-id subnet-0f82d6e49b9a6dafd \
    --security-group-ids sg-035e5a3df769a4114 \
    --associate-public-ip-address

Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: bf59d7c0-8072-403c-94d1-a6e861e84c5f
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-0ab9ee62b745f0be5
  InstanceType: t2.micro
  KeyName: kp-devops
  LaunchTime: '2020-07-03T09:11:54+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-03T09:11:54+00:00'
      AttachmentId: eni-attach-063e785cdd1682bab
      DeleteOnTermination: true
      DeviceIndex: 0
      Status: attaching
    Description: ''
    Groups:
    - GroupId: sg-035e5a3df769a4114
      GroupName: public-sg
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 06:5c:28:f2:ea:ea
    NetworkInterfaceId: eni-0f9764fa3e41b6ff1
    OwnerId: '097922957316'
    PrivateIpAddress: 172.16.10.77
    PrivateIpAddresses:
    - Primary: true
      PrivateIpAddress: 172.16.10.77
    SourceDestCheck: true
    Status: in-use
    SubnetId: subnet-0f82d6e49b9a6dafd
    VpcId: vpc-027019faaf6756407
  Placement:
    AvailabilityZone: ap-southeast-2a
    GroupName: ''
    Tenancy: default
  PrivateDnsName: ip-172-16-10-77.ap-southeast-2.compute.internal
  PrivateIpAddress: 172.16.10.77
  ProductCodes: []
  PublicDnsName: ''
  RootDeviceName: /dev/xvda
  RootDeviceType: ebs
  SecurityGroups:
  - GroupId: sg-035e5a3df769a4114
    GroupName: public-sg
  SourceDestCheck: true
  State:
    Code: 0
    Name: pending
  StateReason:
    Code: pending
    Message: pending
  StateTransitionReason: ''
  SubnetId: subnet-0f82d6e49b9a6dafd
  VirtualizationType: hvm
  VpcId: vpc-027019faaf6756407
OwnerId: '097922957316'
ReservationId: r-0b4abdd0b0cc05530
```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```

$ aws ec2 run-instances \
    --image-id ami-088ff0e3bde7b3fdf \
    --instance-type t2.micro \
    --key-name kp-devops \
    --network-interfaces '[{"NetworkInterfaceId":"eni-08dbd042b048496d7","DeviceIndex":0}]'

Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: d6771240-e53c-4aa1-96c3-482fd545e39c
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-0ca17b52d926452e2
  InstanceType: t2.micro
  KeyName: kp-devops
  LaunchTime: '2020-07-03T09:20:53+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-03T09:20:53+00:00'
:...skipping...
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: d6771240-e53c-4aa1-96c3-482fd545e39c
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-0ca17b52d926452e2
  InstanceType: t2.micro
  KeyName: kp-devops
  LaunchTime: '2020-07-03T09:20:53+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-03T09:20:53+00:00'
      AttachmentId: eni-attach-0eda727f7e644b96a
      DeleteOnTermination: false
      DeviceIndex: 0
      Status: attaching
    Description: Fixed IP for private subnet A
    Groups:
    - GroupId: sg-00d7287fdbffc50db
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 06:f1:06:ca:50:f0
    NetworkInterfaceId: eni-08dbd042b048496d7
    OwnerId: '097922957316'
    PrivateIpAddress: 172.16.20.10
    PrivateIpAddresses:
    - Primary: true
      PrivateIpAddress: 172.16.20.10
    SourceDestCheck: true
    Status: in-use
    SubnetId: subnet-0b24a09de741ecd50
:...skipping...
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: d6771240-e53c-4aa1-96c3-482fd545e39c
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-0ca17b52d926452e2
  InstanceType: t2.micro
  KeyName: kp-devops
  LaunchTime: '2020-07-03T09:20:53+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-03T09:20:53+00:00'
      AttachmentId: eni-attach-0eda727f7e644b96a
      DeleteOnTermination: false
      DeviceIndex: 0
      Status: attaching
    Description: Fixed IP for private subnet A
    Groups:
    - GroupId: sg-00d7287fdbffc50db
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 06:f1:06:ca:50:f0
    NetworkInterfaceId: eni-08dbd042b048496d7
    OwnerId: '097922957316'
    PrivateIpAddress: 172.16.20.10
    PrivateIpAddresses:
    - Primary: true
      PrivateIpAddress: 172.16.20.10
    SourceDestCheck: true
    Status: in-use
    SubnetId: subnet-0b24a09de741ecd50
    VpcId: vpc-027019faaf6756407
  Placement:
    AvailabilityZone: ap-southeast-2a
    GroupName: ''
    Tenancy: default
  PrivateDnsName: ip-172-16-20-10.ap-southeast-2.compute.internal
  PrivateIpAddress: 172.16.20.10
  ProductCodes: []
  PublicDnsName: ''
  RootDeviceName: /dev/xvda
  RootDeviceType: ebs
  SecurityGroups:
  - GroupId: sg-00d7287fdbffc50db
:...skipping...
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: d6771240-e53c-4aa1-96c3-482fd545e39c
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-0ca17b52d926452e2
  InstanceType: t2.micro
  KeyName: kp-devops
  LaunchTime: '2020-07-03T09:20:53+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-03T09:20:53+00:00'
      AttachmentId: eni-attach-0eda727f7e644b96a
      DeleteOnTermination: false
      DeviceIndex: 0
      Status: attaching
    Description: Fixed IP for private subnet A
    Groups:
    - GroupId: sg-00d7287fdbffc50db
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 06:f1:06:ca:50:f0
    NetworkInterfaceId: eni-08dbd042b048496d7
    OwnerId: '097922957316'
    PrivateIpAddress: 172.16.20.10
    PrivateIpAddresses:
    - Primary: true
      PrivateIpAddress: 172.16.20.10
    SourceDestCheck: true
    Status: in-use
    SubnetId: subnet-0b24a09de741ecd50
    VpcId: vpc-027019faaf6756407
  Placement:
    AvailabilityZone: ap-southeast-2a
    GroupName: ''
    Tenancy: default
  PrivateDnsName: ip-172-16-20-10.ap-southeast-2.compute.internal
  PrivateIpAddress: 172.16.20.10
  ProductCodes: []
  PublicDnsName: ''
  RootDeviceName: /dev/xvda
  RootDeviceType: ebs
  SecurityGroups:
  - GroupId: sg-00d7287fdbffc50db
  SourceDestCheck: true
  State:
    Code: 0
    Name: pending
  StateReason:
    Code: pending
    Message: pending
  StateTransitionReason: ''
  SubnetId: subnet-0b24a09de741ecd50
  VirtualizationType: hvm
  VpcId: vpc-027019faaf6756407
OwnerId: '097922957316'
ReservationId: r-027c4b38c2e6ce987

$ aws ec2 modify-instance-attribute --instance-id i-0ca17b52d926452e2 --groups sg-0f2326bb3047f4894

```

- Commands for accessing your public instance using ssh

```
 alima  ALAN-LIMA  ~/.ssh  19:38:50 
 $  ssh-add ~/.ssh/kp-devops
Identity added: /home/alima/.ssh/kp-devops (alima@ALAN-LIMA)
 alima  ALAN-LIMA  ~/.ssh  19:38:59 
 $  ssh -A ec2-user@13.239.96.100
Last login: Fri Jul  3 09:38:00 2020 from 122-148-135-233.sta.wbroadband.net.au

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-16-10-77 ~]$

```

- Commands for accessing your private instance from public one

```
[ec2-user@ip-172-16-10-77 ~]$ ssh ec2-user@172.16.20.10
Last login: Fri Jul  3 09:38:20 2020 from 172.16.10.77

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-16-20-10 ~]$
```

- Commands for testing ping to `8.8.8.8` from private instance

```
[ec2-user@ip-172-16-20-10 ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=106 time=2.60 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=106 time=1.86 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=106 time=1.90 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=106 time=1.87 ms
64 bytes from 8.8.8.8: icmp_seq=5 ttl=106 time=1.88 ms
64 bytes from 8.8.8.8: icmp_seq=6 ttl=106 time=1.87 ms
64 bytes from 8.8.8.8: icmp_seq=7 ttl=106 time=1.93 ms
64 bytes from 8.8.8.8: icmp_seq=8 ttl=106 time=1.87 ms
^C
--- 8.8.8.8 ping statistics ---
8 packets transmitted, 8 received, 0% packet loss, time 7011ms
rtt min/avg/max/mdev = 1.862/1.976/2.606/0.244 ms
[ec2-user@ip-172-16-20-10 ~]$
```

- Any extra challenges faced?

```
Forgot to add the keypair to ssh-agent 😅😅
```


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)