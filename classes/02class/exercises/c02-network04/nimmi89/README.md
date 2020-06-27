# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
172.16.0.0./16 : Subnets[172.16.0.0/19, 172.16.32.0/19]
                        [172.16.64.0./19, 172.19.96.0./19]
                        [172.16.128.0/19, 172.16.160.0/19]
                        [172.16.192.0/19, 172.16.224.0/19]

>>>Command to create a subnet with parameters vpc, az and cidr block
>Public Subnet A
aws ec2 create-subnet \
    --availability-zone ap-southeast-2a \
    --vpc-id vpc-081afcee350babdf5 \
    --cidr-block 172.16.0.0/19
>The command returns:
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "172.16.0.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "pending",
        "SubnetId": "subnet-062c79f06460c35c1",
        "VpcId": "vpc-081afcee350babdf5",
        "OwnerId": "438549961569",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:438549961569:subnet/subnet-062c79f06460c35c1"
    }
}
>>>Command to give a name to subnet[public subnet in AZ-a]
aws ec2 create-tags \
 --resources subnet-062c79f06460c35c1 \
 --tags Key=Name,Value=public-a

>>>Similarily,create 5 more subnets [Total 6 subnets in 3 AZs, 1 public-1private/AZ]
>Private Subnet A
aws ec2 create-subnet \
    --availability-zone ap-southeast-2a \
    --vpc-id vpc-081afcee350babdf5 \
    --cidr-block 172.16.32.0/19
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "172.16.32.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "pending",
        "SubnetId": "subnet-04abf35901ad7a22a",
        "VpcId": "vpc-081afcee350babdf5",
        "OwnerId": "438549961569",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:438549961569:subnet/subnet-04abf35901ad7a22a"
    }
}
aws ec2 create-tags \
 --resources subnet-04abf35901ad7a22a \
 --tags Key=Name,Value=private-a

>Public Subnet B
aws ec2 create-subnet \
    --availability-zone ap-southeast-2a \
    --vpc-id vpc-081afcee350babdf5 \
    --cidr-block 172.16.64.0/19
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "172.16.64.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "pending",
        "SubnetId": "subnet-03bbda2e7e877d1fb",
        "VpcId": "vpc-081afcee350babdf5",
        "OwnerId": "438549961569",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:438549961569:subnet/subnet-03bbda2e7e877d1fb"
    }
}
aws ec2 create-tags \
 --resources subnet-03bbda2e7e877d1fb \
 --tags Key=Name,Value=public-b

>Private Subnet B
aws ec2 create-subnet \
    --availability-zone ap-southeast-2a \
    --vpc-id vpc-081afcee350babdf5 \
    --cidr-block 172.16.96.0/19
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "172.16.96.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "pending",
        "SubnetId": "subnet-07a6d5aa2747fa2c2",
        "VpcId": "vpc-081afcee350babdf5",
        "OwnerId": "438549961569",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:438549961569:subnet/subnet-07a6d5aa2747fa2c2"
    }
}
aws ec2 create-tags \
 --resources subnet-07a6d5aa2747fa2c2 \
 --tags Key=Name,Value=private-b

>Public Subnet C
aws ec2 create-subnet \
    --availability-zone ap-southeast-2a \
    --vpc-id vpc-081afcee350babdf5 \
    --cidr-block 172.16.128.0/19
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "172.16.128.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "pending",
        "SubnetId": "subnet-01f03b15624652fc3",
        "VpcId": "vpc-081afcee350babdf5",
        "OwnerId": "438549961569",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:438549961569:subnet/subnet-01f03b15624652fc3"
    }
}
aws ec2 create-tags \
 --resources subnet-01f03b15624652fc3 \
 --tags Key=Name,Value=public-c

>Private Subnet C
aws ec2 create-subnet \
    --availability-zone ap-southeast-2a \
    --vpc-id vpc-081afcee350babdf5 \
    --cidr-block 172.16.160.0/19
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "172.16.160.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "pending",
        "SubnetId": "subnet-01012aa11829f1b88",
        "VpcId": "vpc-081afcee350babdf5",
        "OwnerId": "438549961569",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:438549961569:subnet/subnet-01012aa11829f1b88"
    }
}
aws ec2 create-tags \
 --resources subnet-01012aa11829f1b88 \
 --tags Key=Name,Value=private-c


```

- Any extra challenges faced? Dividing the network into 8 subnets and assuring that there are atleast 250 hosts available for every subnet.


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)
