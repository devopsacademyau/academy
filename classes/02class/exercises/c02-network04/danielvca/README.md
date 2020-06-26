
# c02-network04

## Commands Execution Output

- Commands for creating the subnets:

**Private**
```
aws ec2 create-subnet \
--vpc-id vpc-0c2c93451cdd28192 --cidr-block 10.0.1.0/24 \
--availability-zone ap-southeast-2a

Subnet:
  AssignIpv6AddressOnCreation: false
  AvailabilityZone: ap-southeast-2a
  AvailabilityZoneId: apse2-az1
  AvailableIpAddressCount: 251
  CidrBlock: 10.0.1.0/24
  DefaultForAz: false
  Ipv6CidrBlockAssociationSet: []
  MapPublicIpOnLaunch: false
  OwnerId: '646093908012'
  State: pending
  SubnetArn: arn:aws:ec2:ap-southeast-2:646093908012:subnet/subnet-0452f4ddac49bb979
  SubnetId: subnet-0452f4ddac49bb979
  VpcId: vpc-0c2c93451cdd28192

aws ec2 create-tags --resources subnet-0452f4ddac49bb979 --tags Key=Name,Value=private-a

aws ec2 create-subnet \
--vpc-id vpc-0c2c93451cdd28192 --cidr-block 10.0.2.0/24 \
--availability-zone ap-southeast-2b

Subnet:
  AssignIpv6AddressOnCreation: false
  AvailabilityZone: ap-southeast-2b
  AvailabilityZoneId: apse2-az3
  AvailableIpAddressCount: 251
  CidrBlock: 10.0.2.0/24
  DefaultForAz: false
  Ipv6CidrBlockAssociationSet: []
  MapPublicIpOnLaunch: false
  OwnerId: '646093908012'
  State: pending
  SubnetArn: arn:aws:ec2:ap-southeast-2:646093908012:subnet/subnet-05097428296055071
  SubnetId: subnet-05097428296055071
  VpcId: vpc-0c2c93451cdd28192

aws ec2 create-tags --resources subnet-05097428296055071 --tags Key=Name,Value=private-b

aws ec2 create-subnet \
--vpc-id vpc-0c2c93451cdd28192 --cidr-block 10.0.3.0/24 \
--availability-zone ap-southeast-2c

Subnet:
  AssignIpv6AddressOnCreation: false
  AvailabilityZone: ap-southeast-2c
  AvailabilityZoneId: apse2-az2
  AvailableIpAddressCount: 251
  CidrBlock: 10.0.3.0/24
  DefaultForAz: false
  Ipv6CidrBlockAssociationSet: []
  MapPublicIpOnLaunch: false
  OwnerId: '646093908012'
  State: pending
  SubnetArn: arn:aws:ec2:ap-southeast-2:646093908012:subnet/subnet-0a73a0fdc29009a46
  SubnetId: subnet-0a73a0fdc29009a46
  VpcId: vpc-0c2c93451cdd28192
  
aws ec2 create-tags --resources subnet-0a73a0fdc29009a46 --tags Key=Name,Value=private-c
```
**Public**
```
aws ec2 create-subnet \
--vpc-id vpc-0c2c93451cdd28192 --cidr-block 10.0.4.0/24 \
--availability-zone ap-southeast-2a

Subnet:
  AssignIpv6AddressOnCreation: false
  AvailabilityZone: ap-southeast-2a
  AvailabilityZoneId: apse2-az1
  AvailableIpAddressCount: 251
  CidrBlock: 10.0.4.0/24
  DefaultForAz: false
  Ipv6CidrBlockAssociationSet: []
  MapPublicIpOnLaunch: false
  OwnerId: '646093908012'
  State: pending
  SubnetArn: arn:aws:ec2:ap-southeast-2:646093908012:subnet/subnet-091fd751e703a303b
  SubnetId: subnet-091fd751e703a303b
  VpcId: vpc-0c2c93451cdd28192
  
aws ec2 create-tags --resources subnet-091fd751e703a303b --tags Key=Name,Value=public-a


aws ec2 create-subnet \
--vpc-id vpc-0c2c93451cdd28192 --cidr-block 10.0.5.0/24 \
--availability-zone ap-southeast-2b

Subnet:
  AssignIpv6AddressOnCreation: false
  AvailabilityZone: ap-southeast-2b
  AvailabilityZoneId: apse2-az3
  AvailableIpAddressCount: 251
  CidrBlock: 10.0.5.0/24
  DefaultForAz: false
  Ipv6CidrBlockAssociationSet: []
  MapPublicIpOnLaunch: false
  OwnerId: '646093908012'
  State: pending
  SubnetArn: arn:aws:ec2:ap-southeast-2:646093908012:subnet/subnet-0d01c4b1f73f8bc78
  SubnetId: subnet-0d01c4b1f73f8bc78
  VpcId: vpc-0c2c93451cdd28192
  
aws ec2 create-tags --resources subnet-0d01c4b1f73f8bc78 --tags Key=Name,Value=public-b

aws ec2 create-subnet \
--vpc-id vpc-0c2c93451cdd28192 --cidr-block 10.0.6.0/24 \
--availability-zone ap-southeast-2c

Subnet:
  AssignIpv6AddressOnCreation: false
  AvailabilityZone: ap-southeast-2c
  AvailabilityZoneId: apse2-az2
  AvailableIpAddressCount: 251
  CidrBlock: 10.0.6.0/24
  DefaultForAz: false
  Ipv6CidrBlockAssociationSet: []
  MapPublicIpOnLaunch: false
  OwnerId: '646093908012'
  State: pending
  SubnetArn: arn:aws:ec2:ap-southeast-2:646093908012:subnet/subnet-0adbc66199ac20610
  SubnetId: subnet-0adbc66199ac20610
  VpcId: vpc-0c2c93451cdd28192
  
aws ec2 create-tags --resources subnet-0adbc66199ac20610 --tags Key=Name,Value=public-c
```
**Auto assing Public IP**
```
aws ec2 modify-subnet-attribute \
--subnet-id subnet-091fd751e703a303b \
--map-public-ip-on-launch

aws ec2 modify-subnet-attribute \
--subnet-id subnet-0d01c4b1f73f8bc78 \
--map-public-ip-on-launch

aws ec2 modify-subnet-attribute \
--subnet-id subnet-0adbc66199ac20610 \
--map-public-ip-on-launch
```
**Creating Internet Gateway , attach to VPN,  route table**
```
InternetGateway:  
Attachments: []  
InternetGatewayId: igw-0047722be38dccb86  
Tags: []


aws ec2 attach-internet-gateway \
--vpc-id vpc-0c2c93451cdd28192 \
--internet-gateway-id igw-0047722be38dccb86

aws ec2 create-route-table \
--vpc-id vpc-0c2c93451cdd28192

RouteTable:  
Associations: []  
OwnerId: '646093908012'  
PropagatingVgws: []  
RouteTableId: rtb-0117d88753e0834e8  
Routes:  
- DestinationCidrBlock: 10.0.0.0/16  
GatewayId: local  
Origin: CreateRouteTable  
State: active  
Tags: []  
VpcId: vpc-0c2c93451cdd28192

aws ec2 create-route \
--route-table-id rtb-0117d88753e0834e8 \
--destination-cidr-block 0.0.0.0/0 \
--gateway-id igw-0047722be38dccb86

```
**Making Public**

```
aws ec2 associate-route-table  \
--subnet-id subnet-091fd751e703a303b \
--route-table-id rtb-0117d88753e0834e8

aws ec2 associate-route-table  \
--subnet-id subnet-0d01c4b1f73f8bc78 \
--route-table-id rtb-0117d88753e0834e8

aws ec2 associate-route-table  \
--subnet-id subnet-0adbc66199ac20610 \
--route-table-id rtb-0117d88753e0834e8

```

![enter image description here](https://danielandrade.info/contino/awsnetwork.png)

Reference:
[https://cloudaffaire.com/how-to-create-a-custom-vpc-using-aws-cli/](https://cloudaffaire.com/how-to-create-a-custom-vpc-using-aws-cli/)

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)

> Written with [StackEdit](https://stackedit.io/).