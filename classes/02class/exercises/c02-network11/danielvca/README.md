# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
aws ec2 run-instances \
--image-id ami-088ff0e3bde7b3fdf \
--instance-type t2.micro \
--count 1 \
--associate-public-ip-address \
--subnet-id subnet-091fd751e703a303b \
--security-group-ids sg-024a02765d4a3501d \
--key-name danibook

Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: ''
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-04bbfef4d8432ae37
  InstanceType: t2.micro
  KeyName: danibook
  LaunchTime: '2020-07-02T07:26:48+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-02T07:26:48+00:00'
      AttachmentId: eni-attach-09bbabcf8851711dd
      DeleteOnTermination: true
:...skipping...
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: ''
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-04bbfef4d8432ae37
  InstanceType: t2.micro
  KeyName: danibook
  LaunchTime: '2020-07-02T07:26:48+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-02T07:26:48+00:00'
      AttachmentId: eni-attach-09bbabcf8851711dd
      DeleteOnTermination: true
:...skipping...
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: ''
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-04bbfef4d8432ae37
  InstanceType: t2.micro
  KeyName: danibook
  LaunchTime: '2020-07-02T07:26:48+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-02T07:26:48+00:00'
      AttachmentId: eni-attach-09bbabcf8851711dd
      DeleteOnTermination: true
      DeviceIndex: 0
      Status: attaching
    Description: ''
    Groups:
    - GroupId: sg-024a02765d4a3501d
      GroupName: da_public-sg
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 02:d0:1d:d0:c6:94
    NetworkInterfaceId: eni-07bb8accd0c32721f
    OwnerId: '646093908012'
:...skipping...
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: ''
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-04bbfef4d8432ae37
  InstanceType: t2.micro
  KeyName: danibook
  LaunchTime: '2020-07-02T07:26:48+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-02T07:26:48+00:00'
      AttachmentId: eni-attach-09bbabcf8851711dd
      DeleteOnTermination: true
      DeviceIndex: 0
      Status: attaching
    Description: ''
    Groups:
    - GroupId: sg-024a02765d4a3501d
      GroupName: da_public-sg
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 02:d0:1d:d0:c6:94
    NetworkInterfaceId: eni-07bb8accd0c32721f
    OwnerId: '646093908012'
    PrivateIpAddress: 10.0.4.93
    PrivateIpAddresses:
    - Primary: true
      PrivateIpAddress: 10.0.4.93
    SourceDestCheck: true
:...skipping...
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: ''
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-04bbfef4d8432ae37
  InstanceType: t2.micro
  KeyName: danibook
  LaunchTime: '2020-07-02T07:26:48+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-02T07:26:48+00:00'
      AttachmentId: eni-attach-09bbabcf8851711dd
      DeleteOnTermination: true
      DeviceIndex: 0
      Status: attaching
    Description: ''
    Groups:
    - GroupId: sg-024a02765d4a3501d
      GroupName: da_public-sg
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 02:d0:1d:d0:c6:94
    NetworkInterfaceId: eni-07bb8accd0c32721f
    OwnerId: '646093908012'
    PrivateIpAddress: 10.0.4.93
    PrivateIpAddresses:
    - Primary: true
      PrivateIpAddress: 10.0.4.93
    SourceDestCheck: true
    Status: in-use
    SubnetId: subnet-091fd751e703a303b
    VpcId: vpc-0c2c93451cdd28192
  Placement:
    AvailabilityZone: ap-southeast-2a
:
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: ''
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-04bbfef4d8432ae37
  InstanceType: t2.micro
  KeyName: danibook
  LaunchTime: '2020-07-02T07:26:48+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-02T07:26:48+00:00'
      AttachmentId: eni-attach-09bbabcf8851711dd
      DeleteOnTermination: true
      DeviceIndex: 0
      Status: attaching
    Description: ''
    Groups:
    - GroupId: sg-024a02765d4a3501d
      GroupName: da_public-sg
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 02:d0:1d:d0:c6:94
    NetworkInterfaceId: eni-07bb8accd0c32721f
    OwnerId: '646093908012'
    PrivateIpAddress: 10.0.4.93
    PrivateIpAddresses:
    - Primary: true
      PrivateIpAddress: 10.0.4.93
    SourceDestCheck: true
    Status: in-use
    SubnetId: subnet-091fd751e703a303b
    VpcId: vpc-0c2c93451cdd28192
  Placement:
    AvailabilityZone: ap-southeast-2a
:...skipping...
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: ''
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-04bbfef4d8432ae37
  InstanceType: t2.micro
  KeyName: danibook
  LaunchTime: '2020-07-02T07:26:48+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-02T07:26:48+00:00'
      AttachmentId: eni-attach-09bbabcf8851711dd
      DeleteOnTermination: true
      DeviceIndex: 0
      Status: attaching
    Description: ''
    Groups:
    - GroupId: sg-024a02765d4a3501d
      GroupName: da_public-sg
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 02:d0:1d:d0:c6:94
    NetworkInterfaceId: eni-07bb8accd0c32721f
    OwnerId: '646093908012'
    PrivateIpAddress: 10.0.4.93
    PrivateIpAddresses:
    - Primary: true
      PrivateIpAddress: 10.0.4.93
    SourceDestCheck: true
    Status: in-use
    SubnetId: subnet-091fd751e703a303b
    VpcId: vpc-0c2c93451cdd28192
  Placement:
    AvailabilityZone: ap-southeast-2a
    GroupName: ''
:...skipping...
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: ''
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-04bbfef4d8432ae37
  InstanceType: t2.micro
  KeyName: danibook
  LaunchTime: '2020-07-02T07:26:48+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-02T07:26:48+00:00'
      AttachmentId: eni-attach-09bbabcf8851711dd
      DeleteOnTermination: true
      DeviceIndex: 0
      Status: attaching
    Description: ''
    Groups:
    - GroupId: sg-024a02765d4a3501d
      GroupName: da_public-sg
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 02:d0:1d:d0:c6:94
    NetworkInterfaceId: eni-07bb8accd0c32721f
    OwnerId: '646093908012'
    PrivateIpAddress: 10.0.4.93
    PrivateIpAddresses:
    - Primary: true
      PrivateIpAddress: 10.0.4.93
    SourceDestCheck: true
    Status: in-use
    SubnetId: subnet-091fd751e703a303b
    VpcId: vpc-0c2c93451cdd28192
  Placement:
    AvailabilityZone: ap-southeast-2a
    GroupName: ''
    Tenancy: default
:...skipping...
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: ''
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-04bbfef4d8432ae37
  InstanceType: t2.micro
  KeyName: danibook
  LaunchTime: '2020-07-02T07:26:48+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-02T07:26:48+00:00'
      AttachmentId: eni-attach-09bbabcf8851711dd
      DeleteOnTermination: true
      DeviceIndex: 0
      Status: attaching
    Description: ''
    Groups:
    - GroupId: sg-024a02765d4a3501d
      GroupName: da_public-sg
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 02:d0:1d:d0:c6:94
    NetworkInterfaceId: eni-07bb8accd0c32721f
    OwnerId: '646093908012'
    PrivateIpAddress: 10.0.4.93
    PrivateIpAddresses:
    - Primary: true
      PrivateIpAddress: 10.0.4.93
    SourceDestCheck: true
    Status: in-use
    SubnetId: subnet-091fd751e703a303b
    VpcId: vpc-0c2c93451cdd28192
  Placement:
    AvailabilityZone: ap-southeast-2a
    GroupName: ''
    Tenancy: default
  PrivateDnsName: ip-10-0-4-93.ap-southeast-2.compute.internal
  PrivateIpAddress: 10.0.4.93
  ProductCodes: []
  PublicDnsName: ''
:...skipping...
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: ''
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-04bbfef4d8432ae37
  InstanceType: t2.micro
  KeyName: danibook
  LaunchTime: '2020-07-02T07:26:48+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-02T07:26:48+00:00'
      AttachmentId: eni-attach-09bbabcf8851711dd
      DeleteOnTermination: true
      DeviceIndex: 0
      Status: attaching
    Description: ''
    Groups:
    - GroupId: sg-024a02765d4a3501d
      GroupName: da_public-sg
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 02:d0:1d:d0:c6:94
    NetworkInterfaceId: eni-07bb8accd0c32721f
    OwnerId: '646093908012'
    PrivateIpAddress: 10.0.4.93
    PrivateIpAddresses:
    - Primary: true
      PrivateIpAddress: 10.0.4.93
    SourceDestCheck: true
    Status: in-use
    SubnetId: subnet-091fd751e703a303b
    VpcId: vpc-0c2c93451cdd28192
  Placement:
    AvailabilityZone: ap-southeast-2a
    GroupName: ''
    Tenancy: default
  PrivateDnsName: ip-10-0-4-93.ap-southeast-2.compute.internal
  PrivateIpAddress: 10.0.4.93
  ProductCodes: []
  PublicDnsName: ''
  RootDeviceName: /dev/xvda


```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
aws ec2 run-instances \
--image-id ami-088ff0e3bde7b3fdf \
--instance-type t2.micro \
--count 1 \
--network-interfaces '[{"DeviceIndex":0,"NetworkInterfaceId":"eni-0a541536aaf7f5302"}]' \
--key-name danibook

roups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: ''
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-04bbfef4d8432ae37
  InstanceType: t2.micro
  KeyName: danibook
  LaunchTime: '2020-07-02T07:26:48+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-02T07:26:48+00:00'
      AttachmentId: eni-attach-09bbabcf8851711dd
      DeleteOnTermination: true
:...skipping...
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: ''
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-04bbfef4d8432ae37
  InstanceType: t2.micro
  KeyName: danibook
  LaunchTime: '2020-07-02T07:26:48+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-02T07:26:48+00:00'
      AttachmentId: eni-attach-09bbabcf8851711dd
      DeleteOnTermination: true
:...skipping...
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: ''
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-04bbfef4d8432ae37
  InstanceType: t2.micro
  KeyName: danibook
  LaunchTime: '2020-07-02T07:26:48+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-02T07:26:48+00:00'
      AttachmentId: eni-attach-09bbabcf8851711dd
      DeleteOnTermination: true
      DeviceIndex: 0
      Status: attaching
    Description: ''
    Groups:
    - GroupId: sg-024a02765d4a3501d
      GroupName: da_public-sg
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 02:d0:1d:d0:c6:94
    NetworkInterfaceId: eni-07bb8accd0c32721f
    OwnerId: '646093908012'
:...skipping...
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: ''
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-04bbfef4d8432ae37
  InstanceType: t2.micro
  KeyName: danibook
  LaunchTime: '2020-07-02T07:26:48+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-02T07:26:48+00:00'
      AttachmentId: eni-attach-09bbabcf8851711dd
      DeleteOnTermination: true
      DeviceIndex: 0
      Status: attaching
    Description: ''
    Groups:
    - GroupId: sg-024a02765d4a3501d
      GroupName: da_public-sg
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 02:d0:1d:d0:c6:94
    NetworkInterfaceId: eni-07bb8accd0c32721f
    OwnerId: '646093908012'
    PrivateIpAddress: 10.0.4.93
    PrivateIpAddresses:
    - Primary: true
      PrivateIpAddress: 10.0.4.93
    SourceDestCheck: true
:...skipping...
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: ''
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-04bbfef4d8432ae37
  InstanceType: t2.micro
  KeyName: danibook
  LaunchTime: '2020-07-02T07:26:48+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-02T07:26:48+00:00'
      AttachmentId: eni-attach-09bbabcf8851711dd
      DeleteOnTermination: true
      DeviceIndex: 0
      Status: attaching
    Description: ''
    Groups:
    - GroupId: sg-024a02765d4a3501d
      GroupName: da_public-sg
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 02:d0:1d:d0:c6:94
    NetworkInterfaceId: eni-07bb8accd0c32721f
    OwnerId: '646093908012'
    PrivateIpAddress: 10.0.4.93
    PrivateIpAddresses:
    - Primary: true
      PrivateIpAddress: 10.0.4.93
    SourceDestCheck: true
    Status: in-use
    SubnetId: subnet-091fd751e703a303b
    VpcId: vpc-0c2c93451cdd28192
  Placement:
    AvailabilityZone: ap-southeast-2a
:
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: ''
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-04bbfef4d8432ae37
  InstanceType: t2.micro
  KeyName: danibook
  LaunchTime: '2020-07-02T07:26:48+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-02T07:26:48+00:00'
      AttachmentId: eni-attach-09bbabcf8851711dd
      DeleteOnTermination: true
      DeviceIndex: 0
      Status: attaching
    Description: ''
    Groups:
    - GroupId: sg-024a02765d4a3501d
      GroupName: da_public-sg
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 02:d0:1d:d0:c6:94
    NetworkInterfaceId: eni-07bb8accd0c32721f
    OwnerId: '646093908012'
    PrivateIpAddress: 10.0.4.93
    PrivateIpAddresses:
    - Primary: true
      PrivateIpAddress: 10.0.4.93
    SourceDestCheck: true
    Status: in-use
    SubnetId: subnet-091fd751e703a303b
    VpcId: vpc-0c2c93451cdd28192
  Placement:
    AvailabilityZone: ap-southeast-2a
:...skipping...
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: ''
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-04bbfef4d8432ae37
  InstanceType: t2.micro
  KeyName: danibook
  LaunchTime: '2020-07-02T07:26:48+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-02T07:26:48+00:00'
      AttachmentId: eni-attach-09bbabcf8851711dd
      DeleteOnTermination: true
      DeviceIndex: 0
      Status: attaching
    Description: ''
    Groups:
    - GroupId: sg-024a02765d4a3501d
      GroupName: da_public-sg
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 02:d0:1d:d0:c6:94
    NetworkInterfaceId: eni-07bb8accd0c32721f
    OwnerId: '646093908012'
    PrivateIpAddress: 10.0.4.93
    PrivateIpAddresses:
    - Primary: true
      PrivateIpAddress: 10.0.4.93
    SourceDestCheck: true
    Status: in-use
    SubnetId: subnet-091fd751e703a303b
    VpcId: vpc-0c2c93451cdd28192
  Placement:
    AvailabilityZone: ap-southeast-2a
    GroupName: ''
:...skipping...
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: ''
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-04bbfef4d8432ae37
  InstanceType: t2.micro
  KeyName: danibook
  LaunchTime: '2020-07-02T07:26:48+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-02T07:26:48+00:00'
      AttachmentId: eni-attach-09bbabcf8851711dd
      DeleteOnTermination: true
      DeviceIndex: 0
      Status: attaching
    Description: ''
    Groups:
    - GroupId: sg-024a02765d4a3501d
      GroupName: da_public-sg
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 02:d0:1d:d0:c6:94
    NetworkInterfaceId: eni-07bb8accd0c32721f
    OwnerId: '646093908012'
    PrivateIpAddress: 10.0.4.93
    PrivateIpAddresses:
    - Primary: true
      PrivateIpAddress: 10.0.4.93
    SourceDestCheck: true
    Status: in-use
    SubnetId: subnet-091fd751e703a303b
    VpcId: vpc-0c2c93451cdd28192
  Placement:
    AvailabilityZone: ap-southeast-2a
    GroupName: ''
    Tenancy: default
:...skipping...
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: ''
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-04bbfef4d8432ae37
  InstanceType: t2.micro
  KeyName: danibook
  LaunchTime: '2020-07-02T07:26:48+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-02T07:26:48+00:00'
      AttachmentId: eni-attach-09bbabcf8851711dd
      DeleteOnTermination: true
      DeviceIndex: 0
      Status: attaching
    Description: ''
    Groups:
    - GroupId: sg-024a02765d4a3501d
      GroupName: da_public-sg
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 02:d0:1d:d0:c6:94
    NetworkInterfaceId: eni-07bb8accd0c32721f
    OwnerId: '646093908012'
    PrivateIpAddress: 10.0.4.93
    PrivateIpAddresses:
    - Primary: true
      PrivateIpAddress: 10.0.4.93
    SourceDestCheck: true
    Status: in-use
    SubnetId: subnet-091fd751e703a303b
    VpcId: vpc-0c2c93451cdd28192
  Placement:
    AvailabilityZone: ap-southeast-2a
    GroupName: ''
    Tenancy: default
  PrivateDnsName: ip-10-0-4-93.ap-southeast-2.compute.internal
  PrivateIpAddress: 10.0.4.93
  ProductCodes: []
  PublicDnsName: ''
:...skipping...
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: ''
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-088ff0e3bde7b3fdf
  InstanceId: i-0fb4e843c5408633e
  InstanceType: t2.micro
  KeyName: danibook
  LaunchTime: '2020-07-02T07:32:26+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-07-02T07:32:26+00:00'
      AttachmentId: eni-attach-00b119d8ad440df7e
      DeleteOnTermination: false
      DeviceIndex: 0
      Status: attaching
    Description: DevOps Academy ENI
    Groups:
    - GroupId: sg-0f854ba13fa06fc9e
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 02:c0:a8:f6:ed:b2
    NetworkInterfaceId: eni-0a541536aaf7f5302
    OwnerId: '646093908012'
    PrivateIpAddress: 10.0.1.50
    PrivateIpAddresses:
    - Primary: true
      PrivateIpAddress: 10.0.1.50
    SourceDestCheck: true
    Status: in-use
    SubnetId: subnet-0452f4ddac49bb979
    VpcId: vpc-0c2c93451cdd28192
  Placement:
    AvailabilityZone: ap-southeast-2a
    GroupName: ''
    Tenancy: default
  PrivateDnsName: ip-10-0-1-50.ap-southeast-2.compute.internal
  PrivateIpAddress: 10.0.1.50
  ProductCodes: []
  PublicDnsName: ''
  RootDeviceName: /dev/xvda
  RootDeviceType: ebs

```

- Commands for accessing your public instance using ssh

```
❯ ssh -A ec2-user@54.206.85.117

The authenticity of host '54.206.85.117 (54.206.85.117)' can't be established.
ECDSA key fingerprint is SHA256:49B3MKgR9PasMdil3+nUPUoIm1IFf7pcGGWvrOW2108.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '54.206.85.117' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
13 package(s) needed for security, out of 22 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-0-4-93 ~]$
```

- Commands for accessing your private instance from public one

```
[ec2-user@ip-10-0-4-93 ~]$ ssh 10.0.1.50

The authenticity of host '10.0.1.50 (10.0.1.50)' can't be established.
ECDSA key fingerprint is SHA256:XYrGJ+zNef5ByUh2B2+6I2HZweocHqoRL4m/tIV9ifI.
ECDSA key fingerprint is MD5:ff:e4:7d:36:62:29:65:c8:52:51:cf:00:1e:dd:cc:06.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '10.0.1.50' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-10-0-1-50 ~]$


```

- Commands for testing ping to `8.8.8.8` from private instance

```
ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8): 56 data bytes
64 bytes from 8.8.8.8: icmp_seq=0 ttl=250 time=17.419 ms
64 bytes from 8.8.8.8: icmp_seq=1 ttl=250 time=23.084 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=250 time=22.664 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=250 time=16.662 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=250 time=18.338 ms
64 bytes from 8.8.8.8: icmp_seq=5 ttl=250 time=16.843 ms
64 bytes from 8.8.8.8: icmp_seq=6 ttl=250 time=23.283 ms
^C
```

- Any extra challenges faced?

Had to re-create some recources. It tooke me some time to figure it out. 
I better stop deleting them :-)

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)
