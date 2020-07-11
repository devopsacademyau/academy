# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
Availability Zone -  ap-southeast-2a

private subnet [CIDR - 10.0.1.0/24]
> aws ec2 create-subnet --vpc-id vpc-076a05ec0f3be4895  --availability-zone ap-southeast-2a --cidr-block 10.0.1.0/24 
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.1.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0b93b57d95a2de8d4",
        "VpcId": "vpc-076a05ec0f3be4895",
        "OwnerId": "361529347535",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:361529347535:subnet/subnet-0b93b57d95a2de8d4"
    }
}

> aws ec2 create-tags --resources subnet-0b93b57d95a2de8d4 --tags Key=Name,Value=private-subnet-2a

>   aws ec2 describe-subnets --filters "Name=subnet-id,Values=subnet-0b93b57d95a2de8d4"

{
    "Subnets": [
        {
            "AvailabilityZone": "ap-southeast-2a",
            "AvailabilityZoneId": "apse2-az1",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.1.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-0b93b57d95a2de8d4",
            "VpcId": "vpc-076a05ec0f3be4895",
            "OwnerId": "361529347535",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "private-subnet-2a"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:361529347535:subnet/subnet-0b93b57d95a2de8d4"
        }
    ]
}

public subnet [CIDR - 10.0.101.0/24]
> aws ec2 create-subnet --vpc-id vpc-076a05ec0f3be4895  --availability-zone ap-southeast-2a --cidr-block 10.0.101.0/24

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.101.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0ff0ad4440d0df64e",
        "VpcId": "vpc-076a05ec0f3be4895",
        "OwnerId": "361529347535",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:361529347535:subnet/subnet-0ff0ad4440d0df64e"
    }
}
> aws ec2 create-tags --resources subnet-0ff0ad4440d0df64e --tags Key=Name,Value=public-subnet-2a

> aws ec2 describe-subnets --filters "Name=subnet-id,Values=subnet-0ff0ad4440d0df64e"

{
    "Subnets": [
        {
            "AvailabilityZone": "ap-southeast-2a",
            "AvailabilityZoneId": "apse2-az1",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.101.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-0ff0ad4440d0df64e",
            "VpcId": "vpc-076a05ec0f3be4895",
            "OwnerId": "361529347535",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "public-subnet-2a"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:361529347535:subnet/subnet-0ff0ad4440d0df64e"
        }
    ]
}


Availability Zone -  ap-southeast-2b
Private subnet [CIDR - 10.0.2.0/24]                   
> aws ec2 create-subnet --vpc-id vpc-076a05ec0f3be4895  --availability-zone ap-southeast-2b --cidr-block 10.0.2.0/24
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.2.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0b76d0885b48f0cfa",
        "VpcId": "vpc-076a05ec0f3be4895",
        "OwnerId": "361529347535",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:361529347535:subnet/subnet-0b76d0885b48f0cfa"
    }
}

> aws ec2 create-tags --resources subnet-0b76d0885b48f0cfa --tags Key=Name,Value=private-subnet-2b

> aws ec2 describe-subnets --filters "Name=subnet-id,Values=subnet-0b76d0885b48f0cfa"

{
    "Subnets": [
        {
            "AvailabilityZone": "ap-southeast-2b",
            "AvailabilityZoneId": "apse2-az3",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.2.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-0b76d0885b48f0cfa",
            "VpcId": "vpc-076a05ec0f3be4895",
            "OwnerId": "361529347535",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "private-subnet-2b"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:361529347535:subnet/subnet-0b76d0885b48f0cfa"
        }
    ]
}

Public subnet [CIDR - 10.0.201.0/24]     

> aws ec2 create-subnet --vpc-id vpc-076a05ec0f3be4895  --availability-zone ap-southeast-2b --cidr-block 10.0.201.0/24
raghunadhpokkalath@raghunadhs-MBP ~ % aws ec2 create-subnet --vpc-id vpc-076a05ec0f3be4895  --availability-zone ap-southeast-2b --cidr-block 10.0.201.0/24
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.201.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0f3eb7a49a103114e",
        "VpcId": "vpc-076a05ec0f3be4895",
        "OwnerId": "361529347535",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:361529347535:subnet/subnet-0f3eb7a49a103114e"
    }
}

> aws ec2 create-tags --resources subnet-0f3eb7a49a103114e --tags Key=Name,Value=public-subnet-2b

> aws ec2 describe-subnets --filters "Name=subnet-id,Values=subnet-0f3eb7a49a103114e"
{
    "Subnets": [
        {
            "AvailabilityZone": "ap-southeast-2b",
            "AvailabilityZoneId": "apse2-az3",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.201.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-0f3eb7a49a103114e",
            "VpcId": "vpc-076a05ec0f3be4895",
            "OwnerId": "361529347535",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "public-subnet-2b"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:361529347535:subnet/subnet-0f3eb7a49a103114e"
        }
    ]
}

Availability Zone -  ap-southeast-2c
Private subnet [CIDR - 10.0.3.0/24]                   
> aws ec2 create-subnet --vpc-id vpc-076a05ec0f3be4895  --availability-zone ap-southeast-2c --cidr-block 10.0.3.0/24
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.3.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0e22678e3713193d2",
        "VpcId": "vpc-076a05ec0f3be4895",
        "OwnerId": "361529347535",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:361529347535:subnet/subnet-0e22678e3713193d2"
    }
}
> aws ec2 create-tags --resources subnet-0e22678e3713193d2 --tags Key=Name,Value=private-subnet-2c

> aws ec2 describe-subnets --filters "Name=subnet-id,Values=subnet-0e22678e3713193d2"
{
    "Subnets": [
        {
            "AvailabilityZone": "ap-southeast-2c",
            "AvailabilityZoneId": "apse2-az2",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.3.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-0e22678e3713193d2",
            "VpcId": "vpc-076a05ec0f3be4895",
            "OwnerId": "361529347535",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "private-subnet-2c"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:361529347535:subnet/subnet-0e22678e3713193d2"
        }
    ]
}

Public subnet [CIDR - 10.0.210.0/24]     

> aws ec2 create-subnet --vpc-id vpc-076a05ec0f3be4895  --availability-zone ap-southeast-2c --cidr-block 10.0.210.0/24
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.210.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0b2095e1b5117df04",
        "VpcId": "vpc-076a05ec0f3be4895",
        "OwnerId": "361529347535",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:361529347535:subnet/subnet-0b2095e1b5117df04"
    }
}
> aws ec2 create-tags --resources subnet-0b2095e1b5117df04 --tags Key=Name,Value=public-subnet-2c

> aws ec2 describe-subnets --filters "Name=subnet-id,Values=subnet-0b2095e1b5117df04"

{
    "Subnets": [
        {
            "AvailabilityZone": "ap-southeast-2c",
            "AvailabilityZoneId": "apse2-az2",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.210.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-0b2095e1b5117df04",
            "VpcId": "vpc-076a05ec0f3be4895",
            "OwnerId": "361529347535",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "public-subnet-2c"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:361529347535:subnet/subnet-0b2095e1b5117df04"
        }
    ]
}
```

- Any extra challenges faced?
```
Finding out the command to filter subnet after creation
```
<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)