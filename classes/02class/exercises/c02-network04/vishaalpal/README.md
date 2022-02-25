# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
# Create subnets in ap-southeast-2a
Commands:
aws ec2 create-subnet \
    --vpc-id vpc-0e9963972a29d0cc3 \
    --cidr-block 10.0.0.0/24 \
    --availability-zone ap-southeast-2a \
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private-a}]'

aws ec2 create-subnet \
    --vpc-id vpc-0e9963972a29d0cc3 \
    --cidr-block 10.0.10.0/24 \
    --availability-zone ap-southeast-2a \
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-a}]'

# Create subnets in ap-southeast-2b
Commands:
aws ec2 create-subnet \
    --vpc-id vpc-0e9963972a29d0cc3 \
    --cidr-block 10.0.1.0/24 \
    --availability-zone ap-southeast-2b \
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private-b}]'

aws ec2 create-subnet \
    --vpc-id vpc-0e9963972a29d0cc3 \
    --cidr-block 10.0.11.0/24 \
    --availability-zone ap-southeast-2b \
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-b}]'

# Create subnets in ap-southeast-2c
Commands:
aws ec2 create-subnet \
    --vpc-id vpc-0e9963972a29d0cc3 \
    --cidr-block 10.0.2.0/24 \
    --availability-zone ap-southeast-2c \
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private-c}]'

aws ec2 create-subnet \
    --vpc-id vpc-0e9963972a29d0cc3 \
    --cidr-block 10.0.12.0/24 \
    --availability-zone ap-southeast-2c \
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-c}]'

# Outputs for subnets in ap-southeast-2a
Outputs:
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.0.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0334b66f2ca1b1ed8",
        "VpcId": "vpc-0e9963972a29d0cc3",
        "OwnerId": "969496245957",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "private-a"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:969496245957:subnet/subnet-0334b66f2ca1b1ed8",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.10.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0fc530aa074c01084",
        "VpcId": "vpc-0e9963972a29d0cc3",
        "OwnerId": "969496245957",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "public-a"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:969496245957:subnet/subnet-0fc530aa074c01084",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}

# Outputs for subnets in ap-southeast-2b
Outputs:
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.1.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-053e30b1ddff38020",
        "VpcId": "vpc-0e9963972a29d0cc3",
        "OwnerId": "969496245957",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "private-b"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:969496245957:subnet/subnet-053e30b1ddff38020",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.11.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0f7b048ad6c02bc40",
        "VpcId": "vpc-0e9963972a29d0cc3",
        "OwnerId": "969496245957",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "public-b"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:969496245957:subnet/subnet-0f7b048ad6c02bc40",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}

# Outputs for subnets in ap-sotheast-2c
Outputs:
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.2.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0ae6959290396e787",
        "VpcId": "vpc-0e9963972a29d0cc3",
        "OwnerId": "969496245957",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "private-c"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:969496245957:subnet/subnet-0ae6959290396e787",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.12.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0d20c852d48328d79",
        "VpcId": "vpc-0e9963972a29d0cc3",
        "OwnerId": "969496245957",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "public-c"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:969496245957:subnet/subnet-0d20c852d48328d79",
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
