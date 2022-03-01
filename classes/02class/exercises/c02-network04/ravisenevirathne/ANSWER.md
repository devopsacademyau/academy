# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
aws ec2 create-subnet \
    --vpc-id vpc-09b37d389cf1e7937 \
    --cidr-block 10.10.1.0/24 \
    --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=Private-a}]" \
    --availability-zone ap-southeast-2a

aws ec2 create-subnet \
    --vpc-id vpc-09b37d389cf1e7937 \
    --cidr-block 10.10.2.0/24 \
    --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=Private-b}]" \
    --availability-zone ap-southeast-2b

aws ec2 create-subnet \
    --vpc-id vpc-09b37d389cf1e7937 \
    --cidr-block 10.10.3.0/24 \
    --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=Private-c}]" \
    --availability-zone ap-southeast-2c


aws ec2 create-subnet \
    --vpc-id vpc-09b37d389cf1e7937 \
    --cidr-block 10.10.11.0/24 \
    --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=Public-a}]" \
    --availability-zone ap-southeast-2a

aws ec2 create-subnet \
    --vpc-id vpc-09b37d389cf1e7937 \
    --cidr-block 10.10.12.0/24 \
    --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=Public-b}]" \
    --availability-zone ap-southeast-2b

aws ec2 create-subnet \
    --vpc-id vpc-09b37d389cf1e7937 \
    --cidr-block 10.10.13.0/24 \
    --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=Public-c}]" \
    --availability-zone ap-southeast-2c


*************Outputs when creating subnets****************

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.10.1.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0bdd0e96fc5faab89",
        "VpcId": "vpc-09b37d389cf1e7937",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "Private-a"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-0bdd0e96fc5faab89",
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
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.10.2.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0463f77a3449970a8",
        "VpcId": "vpc-09b37d389cf1e7937",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "Private-b"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-0463f77a3449970a8",
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
        "CidrBlock": "10.10.3.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-08128ac68483f4041",
        "VpcId": "vpc-09b37d389cf1e7937",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "Private-c"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-08128ac68483f4041",
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
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.10.11.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0518abea8303fc4cb",
        "VpcId": "vpc-09b37d389cf1e7937",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "Public-a"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-0518abea8303fc4cb",
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
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.10.12.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-00683b41e4c5abc2f",
        "VpcId": "vpc-09b37d389cf1e7937",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "Public-b"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-00683b41e4c5abc2f",
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
        "CidrBlock": "10.10.13.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0065f35ae776589fc",
        "VpcId": "vpc-09b37d389cf1e7937",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "Tags": [
            {
                "Key": "Name",
                "Value": "Public-c"
            }
        ],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-0065f35ae776589fc",
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

There are lots of repititive codes when creating multiple subnets using AWS cli. So there's a high chance for user mistakes.


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)