# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```bash
## I ll be following the steps form class 01 - aws 101
## and redo from network 06
## ALLOCATE IP
aws ec2 allocate-address --domain vpc
# Output
eipalloc-0105c2f6ebd6c0453      vpc     ap-southeast-2  13.238.79.83    amazon

# Create NAT GATEWAY
aws ec2 create-nat-gateway --allocation-id eipalloc-0105c2f6ebd6c0453  --subnet-id subnet-08da4676baf658cb2 --tag-specifications 'ResourceType="natgateway",Tags=[{Key="Name",Value="devopsacademy-ngw"}]'
# Output
e3efb0ec-f5d9-4a50-b4f5-5ae1feb4907d
NATGATEWAY      2020-07-13T14:20:22+00:00       nat-0cc01a553e9ca12a1   pending subnet-08da4676baf658cb2        vpc-074c260483405f2bb
NATGATEWAYADDRESSES     eipalloc-0105c2f6ebd6c0453
TAGS    Name    devopsacademy-ngw

## Public subnets IDs: subnet-0f867dac87c7e75b4, subnet-01ef5462d19df360c, subnet-01ac1852278e631c7


## Run instance on my private subnet and public security group (SG)
## SG = sg-0cff452c56f306f2c
## subnet id = subnet-01ac1852278e631c7

aws ec2 run-instances \
  --image-id ami-020d764f9372da231 \
  --count 1 \
  --instance-type t2.micro \
  --key-name devops-class \
  --subnet-id subnet-08da4676baf658cb2 \
  --security-group-ids sg-0cff452c56f306f2c

## Output
478433196210    r-0d4381ea04a13d4f5
INSTANCES       0       x86_64  d071664f-ecd3-40ee-b005-77831ee40e24    False   xen     ami-020d764f9372da231   i-0c376d78ec13e6c76     t2.micro
        devops-class    2020-07-13T14:23:36+00:00       ip-10-0-1-10.ap-southeast-2.compute.internal    10.0.1.10               /dev/xvda       ebs
     True            subnet-08da4676baf658cb2        hvm     vpc-074c260483405f2bb
CAPACITYRESERVATIONSPECIFICATION        open
CPUOPTIONS      1       1
METADATAOPTIONS enabled 1       optional        pending
MONITORING      disabled
NETWORKINTERFACES               interface       06:87:e0:3d:43:4a       eni-0fdb24c8478d694bd   478433196210    10.0.1.10       True    in-use  subnet-08da4676baf658cb2        vpc-074c260483405f2bb
ATTACHMENT      2020-07-13T14:23:36+00:00       eni-attach-0018a77ee4792c7ac    True    0       attaching
GROUPS  sg-0cff452c56f306f2c    public-sg
PRIVATEIPADDRESSES      True    10.0.1.10
PLACEMENT       ap-southeast-2a         default
SECURITYGROUPS  sg-0cff452c56f306f2c    public-sg
STATE   0       pending
STATEREASON     pending pending


## Describe instance
aws ec2 describe-instances \
    --instance-ids i-0c376d78ec13e6c76  --output json

# Output
RESERVATIONS    478433196210    r-0d4381ea04a13d4f5
INSTANCES       0       x86_64  d071664f-ecd3-40ee-b005-77831ee40e24    False   True    xen     ami-020d764f9372da231   i-0c376d78ec13e6c76     t2.micro        devops-class    2020-07-13T14:23:36+00:00       ip-10-0-1-10.ap-southeast-2.compute.internal    10.0.1.10               /dev/xvda       ebs
     True            subnet-08da4676baf658cb2        hvm     vpc-074c260483405f2bb
BLOCKDEVICEMAPPINGS     /dev/xvda
EBS     2020-07-13T14:23:37+00:00       True    attached        vol-0cc890bdfe14a38c0
CAPACITYRESERVATIONSPECIFICATION        open
CPUOPTIONS      1       1
HIBERNATIONOPTIONS      False
METADATAOPTIONS enabled 1       optional        applied
MONITORING      disabled
NETWORKINTERFACES               interface       06:87:e0:3d:43:4a       eni-0fdb24c8478d694bd   478433196210    10.0.1.10       True    in-use  subnet-08da4676baf658cb2        vpc-074c260483405f2bb
ATTACHMENT      2020-07-13T14:23:36+00:00       eni-attach-0018a77ee4792c7ac    True    0       attached
GROUPS  sg-0cff452c56f306f2c    public-sg
PRIVATEIPADDRESSES      True    10.0.1.10
PLACEMENT       ap-southeast-2a         default
SECURITYGROUPS  sg-0cff452c56f306f2c    public-sg
STATE   16      running
```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```bash

## Private subnets IDs: subnet-08da4676baf658cb2, subnet-09383d1e51392c852, subnet-0d78ad19a4b86f369

## private security group = sg-0d571c8f620bcc7e0
## private subnet = subnet-0d78ad19a4b86f369
## ENI eni-03cf44676961d7903

## Run instance
aws ec2 run-instances \
  --image-id ami-020d764f9372da231 \
  --count 1 \
  --instance-type t2.micro \
  --key-name devops-class \
  --security-group-ids sg-0d571c8f620bcc7e0
  --network-interfaces '[{"NetworkInterfaceId":"eni-03cf44676961d7903","DeviceIndex":0}]'

# Output
78433196210    r-0848a74d9db4e1ee8
INSTANCES       0       x86_64  89fa1d73-aed8-4425-87eb-1bbc529b7c72    False   xen     ami-020d764f9372da231   i-07137ae0f1e0cfe26     t2.micro
        devops-class    2020-07-13T14:29:44+00:00       ip-10-0-1-17.ap-southeast-2.compute.internal    10.0.1.17               /dev/xvda       ebs
     True            subnet-08da4676baf658cb2        hvm     vpc-074c260483405f2bb
CAPACITYRESERVATIONSPECIFICATION        open
CPUOPTIONS      1       1
METADATAOPTIONS enabled 1       optional        pending
MONITORING      disabled
NETWORKINTERFACES       my network interface    interface       06:30:76:8d:ed:e8       eni-03cf44676961d7903   478433196210    10.0.1.17       True
    in-use  subnet-08da4676baf658cb2        vpc-074c260483405f2bb
ATTACHMENT      2020-07-13T14:29:44+00:00       eni-attach-0bbf4f729d6a5f533    False   0       attaching
GROUPS  sg-00e6b83ea1dccd737
PRIVATEIPADDRESSES      True    10.0.1.17
PLACEMENT       ap-southeast-2a         default
SECURITYGROUPS  sg-00e6b83ea1dccd737
STATE   0       pending
STATEREASON     pending pending

# or
## Attach network interface to an instance
# aws ec2 attach-network-interface --network-interface-id <eni-isntance> --instance-id <instance_id> --device-index 0


```

- Commands for accessing your public instance using ssh

```bash
## I already added my SSH Agent.
ssh -A ec2-user@<ip>

# Output
```

- Commands for accessing your private instance from public one

```bash

## Ssh
ssh ec2-user@<private-instance-ip>

# Output
```

- Commands for testing ping to `8.8.8.8` from private instance

```bash
## Testing ping
ping 8.8.8.8

# output
Add your commands and their outputs here
```

- Any extra challenges faced?

  > 1. Know that there is a option on EC2 run-instances command that allow run instance using ENI. `--network-interfaces`. Format of this option as well.

  > 2. Check what is missing that my connection was not working. So, I created everything again rs.

---

Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)
