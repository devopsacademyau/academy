# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
```
# private subnet in AZ1
```
aws ec2 create-subnet --vpc-id vpc-0b4f29ed84bdb6fd1 --availability-zone-id ap-southeast-2a --tag-specifications 'ResourceType=subnet, Tags=[{Key=Name,Value=private-a}]' --cidr-block 10.0.1.0/24 --vpc-id vpc-0b4f29ed84bdb6fd1 --availability-zone-id apse2-az1 --region ap-southeast-2
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.1.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0b60fb1c511169e96",
        "VpcId": "vpc-0b4f29ed84bdb6fd1",
        "OwnerId": "594524864098",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "private-a"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:594524864098:subnet/subnet-0b60fb1c511169e96",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}

# public subnet in AZ1

aws ec2 create-subnet --vpc-id vpc-0b4f29ed84bdb6fd1 --availability-zone-id ap-southeast-2a --tag-specifications 'ResourceType=subnet, Tags=[{Key=Name,Value=public-a}]' --cidr-block 10.0.2.0/24 --vpc-id vpc-0b4f29ed84bdb6fd1 --availability-zone-id apse2-az1 --region ap-southeast-2
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.2.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-087448560f71a7f82",
        "VpcId": "vpc-0b4f29ed84bdb6fd1",
        "OwnerId": "594524864098",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "public-a"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:594524864098:subnet/subnet-087448560f71a7f82",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}

# public subnet in AZ3

aws ec2 create-subnet --vpc-id vpc-0b4f29ed84bdb6fd1 --tag-specifications 'ResourceType=subnet, Tags=[{Key=Name,Value=public-b}]' --cidr-block 10.0.3.0/24 --vpc-id vpc-0b4f29ed84bdb6fd1 --availability-zone-id apse2-az3 --region ap-southeast-2
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.3.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0a5ea33c07de5ab90",
        "VpcId": "vpc-0b4f29ed84bdb6fd1",
        "OwnerId": "594524864098",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "public-b"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:594524864098:subnet/subnet-0a5ea33c07de5ab90",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}

# private subnet in AZ3
aws ec2 create-subnet --vpc-id vpc-0b4f29ed84bdb6fd1 --tag-specifications 'ResourceType=subnet, Tags=[{Key=Name,Value=private-b}]' --cidr-block 10.0.4.0/24 --vpc-id vpc-0b4f29ed84bdb6fd1 --availability-zone-id apse2-az3 --region ap-southeast-2
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.4.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-025cf8ed5b10f2d11",
        "VpcId": "vpc-0b4f29ed84bdb6fd1",
        "OwnerId": "594524864098",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "private-b"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:594524864098:subnet/subnet-025cf8ed5b10f2d11",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}

public subnet in AZ2
aws ec2 create-subnet --vpc-id vpc-0b4f29ed84bdb6fd1 --tag-specifications 'ResourceType=subnet, Tags=[{Key=Name,Value=public-c}]' --cidr-block 10.0.5.0/24 --vpc-id vpc-0b4f29ed84bdb6fd1 --availability-zone-id apse2-az2 --region ap-southeast-2
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.5.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0d759e1f9d4f37a3a",
        "VpcId": "vpc-0b4f29ed84bdb6fd1",
        "OwnerId": "594524864098",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "public-c"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:594524864098:subnet/subnet-0d759e1f9d4f37a3a",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}

private subnet in AZ2
aws ec2 create-subnet --vpc-id vpc-0b4f29ed84bdb6fd1 --tag-specifications 'ResourceType=subnet, Tags=[{Key=Name,Value=private-c}]' --cidr-block 10.0.6.0/24 --vpc-id vpc-0b4f29ed84bdb6fd1 --availability-zone-id apse2-az2 --region ap-southeast-2
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.6.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-06b67d10b41e626df",
        "VpcId": "vpc-0b4f29ed84bdb6fd1",
        "OwnerId": "594524864098",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "private-c"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:594524864098:subnet/subnet-06b67d10b41e626df",
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
```
The aws cli uses the default region set in configuration which was a bit of a challenge as it kept listing only AZs in the default region
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)
