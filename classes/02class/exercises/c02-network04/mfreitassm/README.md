# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
aws ec2 create-subnet --vpc-id vpc-04426efcf5b2228a4 --cidr-block 10.0.0.0/24 --availability-zone ap-southeast-2a

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.0.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0261e9e051f26f2c9",
        "VpcId": "vpc-04426efcf5b2228a4",
        "OwnerId": "490308117505",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:490308117505:subnet/subnet-0261e9e051f26f2c9"
    }
}
aws ec2 create-tags --resources subnet-0261e9e051f26f2c9 --tags Key=Name,Value=public-a

aws ec2 create-subnet --vpc-id vpc-04426efcf5b2228a4 --cidr-block 10.0.1.0/24 --availability-zone ap-southeast-2a 
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.1.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-077d95081dbd28d26",
        "VpcId": "vpc-04426efcf5b2228a4",
        "OwnerId": "490308117505",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:490308117505:subnet/subnet-077d95081dbd28d26"
    }
}

aws ec2 create-tags --resources subnet-077d95081dbd28d26 --tags Key=Name,Value=private-a

-------------------------------------------------------------------------------------------
aws ec2 create-subnet --vpc-id vpc-04426efcf5b2228a4 --cidr-block 10.0.10.0/24 --availability-zone ap-southeast-2b
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.10.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0dd087be76dd34768",
        "VpcId": "vpc-04426efcf5b2228a4",
        "OwnerId": "490308117505",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:490308117505:subnet/subnet-0dd087be76dd34768"
    }
}
 
aws ec2 create-tags --resources subnet-0dd087be76dd34768 --tags Key=Name,Value=public-b

aws ec2 create-subnet --vpc-id vpc-04426efcf5b2228a4 --cidr-block 10.0.11.0/24 --availability-zone ap-southeast-2b 

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.11.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0c322e67d4fa55b86",
        "VpcId": "vpc-04426efcf5b2228a4",
        "OwnerId": "490308117505",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:490308117505:subnet/subnet-0c322e67d4fa55b86"
    }
}

aws ec2 create-tags --resources subnet-0c322e67d4fa55b86 --tags Key=Name,Value=private-b
------------------------------------------------------------------------------------------

aws ec2 create-subnet --vpc-id vpc-04426efcf5b2228a4 --cidr-block 10.0.20.0/24 --availability-zone ap-southeast-2c 
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.20.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0d89ed7884cbc116d",
        "VpcId": "vpc-04426efcf5b2228a4",
        "OwnerId": "490308117505",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:490308117505:subnet/subnet-0d89ed7884cbc116d"
    }
}

aws ec2 create-tags --resources subnet-0d89ed7884cbc116d --tags Key=Name,Value=public-c

aws ec2 create-subnet --vpc-id vpc-04426efcf5b2228a4 --cidr-block 10.0.21.0/24 --availability-zone ap-southeast-2c 
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.21.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-025d3b7977221ed27",
        "VpcId": "vpc-04426efcf5b2228a4",
        "OwnerId": "490308117505",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:490308117505:subnet/subnet-025d3b7977221ed27"
    }
}


aws ec2 create-tags --resources subnet-025d3b7977221ed27 --tags Key=Name,Value=private-c
-------------------------------------------------------------------------------------
aws ec2 describe-subnets --filters "Name=vpc-id,Values=vpc-04426efcf5b2228a4"
{
    "Subnets": [
        {
            "AvailabilityZone": "ap-southeast-2b",
            "AvailabilityZoneId": "apse2-az1",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.10.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-0dd087be76dd34768",
            "VpcId": "vpc-04426efcf5b2228a4",
            "OwnerId": "490308117505",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "public-b"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:490308117505:subnet/subnet-0dd087be76dd34768"
        },
        {
            "AvailabilityZone": "ap-southeast-2b",
            "AvailabilityZoneId": "apse2-az1",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.11.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-0c322e67d4fa55b86",
            "VpcId": "vpc-04426efcf5b2228a4",
            "OwnerId": "490308117505",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "private-b"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:490308117505:subnet/subnet-0c322e67d4fa55b86"
        },
        {
            "AvailabilityZone": "ap-southeast-2c",
            "AvailabilityZoneId": "apse2-az2",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.21.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-025d3b7977221ed27",
            "VpcId": "vpc-04426efcf5b2228a4",
            "OwnerId": "490308117505",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "private-c"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:490308117505:subnet/subnet-025d3b7977221ed27"
        },
        {
            "AvailabilityZone": "ap-southeast-2c",
            "AvailabilityZoneId": "apse2-az2",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.20.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-0d89ed7884cbc116d",
            "VpcId": "vpc-04426efcf5b2228a4",
            "OwnerId": "490308117505",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "public-c"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:490308117505:subnet/subnet-0d89ed7884cbc116d"
        },
        {
            "AvailabilityZone": "ap-southeast-2a",
            "AvailabilityZoneId": "apse2-az3",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.0.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-0261e9e051f26f2c9",
            "VpcId": "vpc-04426efcf5b2228a4",
            "OwnerId": "490308117505",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "public-a"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:490308117505:subnet/subnet-0261e9e051f26f2c9"
        },
        {
            "AvailabilityZone": "ap-southeast-2a",
            "AvailabilityZoneId": "apse2-az3",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.1.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-077d95081dbd28d26",
            "VpcId": "vpc-04426efcf5b2228a4",
            "OwnerId": "490308117505",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "private-a"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:490308117505:subnet/subnet-077d95081dbd28d26"
        }
    ]
}


```

- Any extra challenges faced?
No

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)