# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
# Layout Plan
- Availability Zone A 
- us-east-1a
public-a = 10.88.1.0/24
private-a = 10.88.11.0/24

- Availability Zone B
- us-east-1b
public-b = 10.88.2.0/24
private-b = 10.88.12.0/24

- Availability Zone C
- us-east-1c
public-c = 10.88.3.0/24
private-c = 10.88.13.0/24

# Commands used.

aws ec2 create-subnet \
> --vpc-id vpc-0d8edf6a0d1104524 \
> --cidr-block 10.88.1.0/24 \
> --availability-zone us-east-1a \
> --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-a}]' \
> --region us-east-1

{
    "Subnet": {
        "AvailabilityZone": "us-east-1a",
        "AvailabilityZoneId": "use1-az4",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.88.1.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-005acc9c005fd6a97",
        "VpcId": "vpc-0d8edf6a0d1104524",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "public-a"
            }
        ],
        "SubnetArn": "arn:aws:ec2:us-east-1:152848913167:subnet/subnet-005acc9c005fd6a97",
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
> --vpc-id vpc-0d8edf6a0d1104524 \
> --cidr-block 10.88.11.0/24 \
> --availability-zone us-east-1a \
> --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private-a}]' \
> --region us-east-1
{
    "Subnet": {
        "AvailabilityZone": "us-east-1a",
        "AvailabilityZoneId": "use1-az4",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.88.11.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-04b06cb9a346fc451",
        "VpcId": "vpc-0d8edf6a0d1104524",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "private-a"
            }
        ],
        "SubnetArn": "arn:aws:ec2:us-east-1:152848913167:subnet/subnet-04b06cb9a346fc451",
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
> --vpc-id vpc-0d8edf6a0d1104524 \
> --cidr-block 10.88.2.0/24 \
> --availability-zone us-east-1b \
> --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-b}]' \
> --region us-east-1

{
    "Subnet": {
        "AvailabilityZone": "us-east-1b",
        "AvailabilityZoneId": "use1-az6",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.88.2.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-081154d2a94ce50e8",
        "VpcId": "vpc-0d8edf6a0d1104524",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "public-b"
            }
        ],
        "SubnetArn": "arn:aws:ec2:us-east-1:152848913167:subnet/subnet-081154d2a94ce50e8",
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
> --vpc-id vpc-0d8edf6a0d1104524 \
> --cidr-block 10.88.12.0/24 \
> --availability-zone us-east-1b \
> --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private-b}]' \
> --region us-east-1

{
    "Subnet": {
        "AvailabilityZone": "us-east-1b",
        "AvailabilityZoneId": "use1-az6",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.88.12.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0eba4cdd68c757843",
        "VpcId": "vpc-0d8edf6a0d1104524",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "private-b"
            }
        ],
        "SubnetArn": "arn:aws:ec2:us-east-1:152848913167:subnet/subnet-0eba4cdd68c757843",
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
> --vpc-id vpc-0d8edf6a0d1104524 \
> --cidr-block 10.88.3.0/24 \
> --availability-zone us-east-1c \
> --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-c}]' \
> --region us-east-1

{
    "Subnet": {
        "AvailabilityZone": "us-east-1c",
        "AvailabilityZoneId": "use1-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.88.3.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0efa6d40949e5ab93",
        "VpcId": "vpc-0d8edf6a0d1104524",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "public-c"
            }
        ],
        "SubnetArn": "arn:aws:ec2:us-east-1:152848913167:subnet/subnet-0efa6d40949e5ab93",
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
> --vpc-id vpc-0d8edf6a0d1104524 \
> --cidr-block 10.88.13.0/24 \
> --availability-zone us-east-1c \
> --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private-c}]' \
> --region us-east-1

{
    "Subnet": {
        "AvailabilityZone": "us-east-1c",
        "AvailabilityZoneId": "use1-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.88.13.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-006952000ee81815b",
        "VpcId": "vpc-0d8edf6a0d1104524",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "private-c"
            }
        ],
        "SubnetArn": "arn:aws:ec2:us-east-1:152848913167:subnet/subnet-006952000ee81815b",
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
None so far. However, since I cannot use the region `ap-southeast-2` due to the previous error message, I chosed the `us-east-1`.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)