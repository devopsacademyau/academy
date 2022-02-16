# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
aws ec2 create-subnet \
    --vpc-id vpc-09666fb121d6ae087 \
    --cidr-block 10.0.0.0/24 \
    --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=public-a}]" \
    --availability-zone ap-southeast-2a 
    
aws ec2 create-subnet \
    --vpc-id vpc-09666fb121d6ae087 \
    --cidr-block 10.0.1.0/24 \
    --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=public-b}]" \
    --availability-zone ap-southeast-2b

aws ec2 create-subnet \
    --vpc-id vpc-09666fb121d6ae087 \
    --cidr-block 10.0.2.0/24 \
    --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=public-c}]" \
    --availability-zone ap-southeast-2c

aws ec2 create-subnet \
    --vpc-id vpc-09666fb121d6ae087 \
    --cidr-block 10.0.10.0/24 \
    --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=private-a}]" \
    --availability-zone ap-southeast-2a

aws ec2 create-subnet \
    --vpc-id vpc-09666fb121d6ae087 \
    --cidr-block 10.0.11.0/24 \
    --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=private-b}]" \
    --availability-zone ap-southeast-2b

aws ec2 create-subnet \
    --vpc-id vpc-09666fb121d6ae087 \
    --cidr-block 10.0.12.0/24 \
    --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=private-c}]" \
    --availability-zone ap-southeast-2c
```

- Output of all subnets:

```
$ aws ec2 describe-subnets --filters "Name=vpc-id,Values=vpc-09666fb121d6ae087"

{
    "Subnets": [
        {
            "AvailabilityZone": "ap-southeast-2a",
            "AvailabilityZoneId": "apse2-az3",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.0.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "MapCustomerOwnedIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-087f588f03b7ad0c1",
            "VpcId": "vpc-09666fb121d6ae087",
            "OwnerId": "639247960747",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "public-a"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:639247960747:subnet/subnet-087f588f03b7ad0c1",
            "EnableDns64": false,
            "Ipv6Native": false,
            "PrivateDnsNameOptionsOnLaunch": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            }
        },
        {
            "AvailabilityZone": "ap-southeast-2b",
            "AvailabilityZoneId": "apse2-az1",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.1.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "MapCustomerOwnedIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-0107b34e3b96bb976",
            "VpcId": "vpc-09666fb121d6ae087",
            "OwnerId": "639247960747",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "public-b"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:639247960747:subnet/subnet-0107b34e3b96bb976",
            "EnableDns64": false,
            "Ipv6Native": false,
            "PrivateDnsNameOptionsOnLaunch": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            }
        },
        {
            "AvailabilityZone": "ap-southeast-2c",
            "AvailabilityZoneId": "apse2-az2",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.2.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "MapCustomerOwnedIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-06eefdc5343faf87a",
            "VpcId": "vpc-09666fb121d6ae087",
            "OwnerId": "639247960747",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "public-c"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:639247960747:subnet/subnet-06eefdc5343faf87a",
            "EnableDns64": false,
            "Ipv6Native": false,
            "PrivateDnsNameOptionsOnLaunch": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            }
        },
        {
            "AvailabilityZone": "ap-southeast-2a",
            "AvailabilityZoneId": "apse2-az3",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.10.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "MapCustomerOwnedIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-0a05ed9c8336c5f07",
            "VpcId": "vpc-09666fb121d6ae087",
            "OwnerId": "639247960747",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "private-a"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:639247960747:subnet/subnet-0a05ed9c8336c5f07",
            "EnableDns64": false,
            "Ipv6Native": false,
            "PrivateDnsNameOptionsOnLaunch": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            }
        },
        {
            "SubnetId": "subnet-0a05ed9c8336c5f07",
            "VpcId": "vpc-09666fb121d6ae087",
            "OwnerId": "639247960747",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "private-a"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:639247960747:subnet/subnet-0a05ed9c8336c5f07",
            "EnableDns64": false,
            "Ipv6Native": false,
            "PrivateDnsNameOptionsOnLaunch": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            }
        },
        {
            "AvailabilityZone": "ap-southeast-2c",
            "AvailabilityZoneId": "apse2-az2",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.12.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "MapCustomerOwnedIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-0c6b1ac3ae8ee39a3",
            "VpcId": "vpc-09666fb121d6ae087",
            "OwnerId": "639247960747",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "private-c"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:639247960747:subnet/subnet-0c6b1ac3ae8ee39a3",
            "EnableDns64": false,
            "Ipv6Native": false,
            "PrivateDnsNameOptionsOnLaunch": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            }
        },
        {
            "AvailabilityZone": "ap-southeast-2b",
            "AvailabilityZoneId": "apse2-az1",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.11.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "MapCustomerOwnedIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-0821e0f8c96cb9e26",
            "VpcId": "vpc-09666fb121d6ae087",
            "OwnerId": "639247960747",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "private-b"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:639247960747:subnet/subnet-0821e0f8c96cb9e26",
            "EnableDns64": false,
            "Ipv6Native": false,
            "PrivateDnsNameOptionsOnLaunch": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            }
        }
    ]
}
```


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)