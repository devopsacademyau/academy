# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
aws ec2 create-subnet \
    --vpc-id vpc-006e658f8ec8f0a05 \
    --cidr-block 10.0.0.0/24 \
    --availability-zone ap-southeast-2a \
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private-a}]'

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.0.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-07e4439ba3280262e",
        "VpcId": "vpc-006e658f8ec8f0a05",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "private-a"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-07e4439ba3280262e",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}


aws ec2 create-subnet \
    --vpc-id vpc-006e658f8ec8f0a05 \
    --cidr-block 10.0.1.0/24 \
    --availability-zone ap-southeast-2b \
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private-b}]'

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.1.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-08e0ead279d21311e",
        "VpcId": "vpc-006e658f8ec8f0a05",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "private-b"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-08e0ead279d21311e",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}


aws ec2 create-subnet \
    --vpc-id vpc-006e658f8ec8f0a05 \
    --cidr-block 10.0.2.0/24 \
    --availability-zone ap-southeast-2c \
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private-c}]'

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.2.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-05436d97cf3a5281f",
        "VpcId": "vpc-006e658f8ec8f0a05",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "private-c"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-05436d97cf3a5281f",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}


aws ec2 create-subnet \
    --vpc-id vpc-006e658f8ec8f0a05 \
    --cidr-block 10.0.10.0/24 \
    --availability-zone ap-southeast-2a \
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-a}]'

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.10.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-057d0c0eadef15896",
        "VpcId": "vpc-006e658f8ec8f0a05",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "public-a"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-057d0c0eadef15896",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}


aws ec2 create-subnet \
    --vpc-id vpc-006e658f8ec8f0a05 \
    --cidr-block 10.0.11.0/24 \
    --availability-zone ap-southeast-2b \
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-b}]'

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.11.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0284b265fe107dbcc",
        "VpcId": "vpc-006e658f8ec8f0a05",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "public-b"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-0284b265fe107dbcc",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}


aws ec2 create-subnet \
    --vpc-id vpc-006e658f8ec8f0a05 \
    --cidr-block 10.0.12.0/24 \
    --availability-zone ap-southeast-2c \
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-c}]'

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.12.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-02ac9cc170d001a82",
        "VpcId": "vpc-006e658f8ec8f0a05",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "public-c"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-02ac9cc170d001a82",
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

Placing single quotes around the tag specifications' brackets as zsh was interpretting them differently to aws cli. 

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)