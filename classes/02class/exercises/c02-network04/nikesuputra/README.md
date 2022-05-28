# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
# Getting the information of AZ
$ aws ec2 describe-availability-zones --all-availability-zones
{
    "AvailabilityZones": [
        {
            "State": "available",
            "OptInStatus": "opt-in-not-required",
            "Messages": [],
            "RegionName": "ap-southeast-1",
            "ZoneName": "ap-southeast-1a",
            "ZoneId": "apse1-az2",
            "GroupName": "ap-southeast-1",
            "NetworkBorderGroup": "ap-southeast-1",
            "ZoneType": "availability-zone"
        },
        {
            "State": "available",
            "OptInStatus": "opt-in-not-required",
            "Messages": [],
            "RegionName": "ap-southeast-1",
            "ZoneName": "ap-southeast-1b",
            "ZoneId": "apse1-az1",
            "GroupName": "ap-southeast-1",
            "NetworkBorderGroup": "ap-southeast-1",
            "ZoneType": "availability-zone"
        },
        {
            "State": "available",
            "OptInStatus": "opt-in-not-required",
            "Messages": [],
            "RegionName": "ap-southeast-1",
            "ZoneName": "ap-southeast-1c",
            "ZoneId": "apse1-az3",
            "GroupName": "ap-southeast-1",
            "NetworkBorderGroup": "ap-southeast-1",
            "ZoneType": "availability-zone"
        }
    ]
}

# Creating private subnet on ap-southeast-1a
$ aws ec2 create-subnet \
> --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private-a}]' \
> --availability-zone ap-southeast-1a \
> --cidr-block 10.0.0.0/24 \
> --vpc-id vpc-0d4d5380eac332f8b
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-1a",
        "AvailabilityZoneId": "apse1-az2",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.0.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0082b16cc3ec20213",
        "VpcId": "vpc-0d4d5380eac332f8b",
        "OwnerId": "192643247659",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "private-a"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-1:192643247659:subnet/subnet-0082b16cc3ec20213",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}

# Creating public subnet on ap-southeast-1a
$ aws ec2 create-subnet \
> --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-a}]' \
> --availability-zone ap-southeast-1a \
> --cidr-block 10.0.1.0/24 \
> --vpc-id vpc-0d4d5380eac332f8b
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-1a",
        "AvailabilityZoneId": "apse1-az2",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.1.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0ac6ac8d810afda4c",
        "VpcId": "vpc-0d4d5380eac332f8b",
        "OwnerId": "192643247659",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "public-a"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-1:192643247659:subnet/subnet-0ac6ac8d810afda4c",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}

# Creating private subnet on ap-southeast-1b
$ aws ec2 create-subnet \
> --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private-b}]' \
> --availability-zone ap-southeast-1b \
> --cidr-block 10.0.10.0/24 \
> --vpc-id vpc-0d4d5380eac332f8b
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-1b",
        "AvailabilityZoneId": "apse1-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.10.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-04d9b3cfc476750e6",
        "VpcId": "vpc-0d4d5380eac332f8b",
        "OwnerId": "192643247659",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "private-b"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-1:192643247659:subnet/subnet-04d9b3cfc476750e6",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}

# Creating public subnet on ap-southeast-1b
$ aws ec2 create-subnet \
> --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-b}]' \
> --availability-zone ap-southeast-1b \
> --cidr-block 10.0.11.0/24 \
> --vpc-id vpc-0d4d5380eac332f8b
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-1b",
        "AvailabilityZoneId": "apse1-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.11.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0492d9f23cdf0c926",
        "VpcId": "vpc-0d4d5380eac332f8b",
        "OwnerId": "192643247659",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "public-b"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-1:192643247659:subnet/subnet-0492d9f23cdf0c926",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}

# Creating private subnet on ap-southeast-1c
$ aws ec2 create-subnet \
> --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private-c}]' \
> --availability-zone ap-southeast-1c \
> --cidr-block 10.0.20.0/24 \
> --vpc-id vpc-0d4d5380eac332f8b
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-1c",
        "AvailabilityZoneId": "apse1-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.20.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0a4ebdb87ceddb266",
        "VpcId": "vpc-0d4d5380eac332f8b",
        "OwnerId": "192643247659",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "private-c"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-1:192643247659:subnet/subnet-0a4ebdb87ceddb266",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}

# Creating public subnet on ap-southeast-1c
$ aws ec2 create-subnet \
> --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-c}]' \
> --availability-zone ap-southeast-1c \
> --cidr-block 10.0.21.0/24 \
> --vpc-id vpc-0d4d5380eac332f8b
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-1c",
        "AvailabilityZoneId": "apse1-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.21.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-003da505bc35efdab",
        "VpcId": "vpc-0d4d5380eac332f8b",
        "OwnerId": "192643247659",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "public-c"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-1:192643247659:subnet/subnet-003da505bc35efdab",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}
```

- Any extra challenges faced?  
The documentation of AWS for creating subnet was quite easy to understand, but deciding on cidr block to use for each subnet was quite confusing for me as I don't have clear understanding on this, so I decided to follow the example of subnet table [here](https://github.com/nikesuputra/academy/tree/master/classes/02class/aws-networking#aws-networking).

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)
