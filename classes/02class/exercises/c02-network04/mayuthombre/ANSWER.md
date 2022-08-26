# c02-network04

## Commands Execution Output

- Commands for creating the subnets:

The following create-subnet example creates a subnet in the specified VPC with the specified IPv4 CIDR block.
```
aws ec2 create-subnet \
    --vpc-id vpc-0c6f909f7f7dd06d7 \
    --cidr-block 10.0.10.0/24 \
    --availability-zone us-west-1a

Output
   {
    "Subnet": {
        "AvailabilityZone": "us-west-1a",
        "AvailabilityZoneId": "usw1-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.10.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-08649a754f2612029",
        "VpcId": "vpc-0c6f909f7f7dd06d7",
        "OwnerId": "817734494987",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:us-west-1:817734494987:subnet/subnet-08649a754f2612029",
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
To add tag to the just created subnet, run the following command

```
aws ec2 create-tags \
    --resources subnet-08649a754f2612029 --tags Key=Name,Value=private-a
```

Similarly create 1 more private subnet and 2 public subnets

```
aws ec2 create-subnet \
    --vpc-id vpc-0c6f909f7f7dd06d7 \
    --cidr-block 10.0.11.0/24 \
    --availability-zone us-west-1b

Output
    {
        "Subnet": {
            "AvailabilityZone": "us-west-1b",
            "AvailabilityZoneId": "usw1-az1",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.11.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-04d14197299d80d8f",
            "VpcId": "vpc-0c6f909f7f7dd06d7",
            "OwnerId": "817734494987",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "SubnetArn": "arn:aws:ec2:us-west-1:817734494987:subnet/subnet-04d14197299d80d8f",
            "EnableDns64": false,
            "Ipv6Native": false,
            "PrivateDnsNameOptionsOnLaunch": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            }
        }
    }


aws ec2 create-tags \
    --resources subnet-04d14197299d80d8f --tags Key=Name,Value=private-b


aws ec2 create-subnet \
    --vpc-id vpc-0c6f909f7f7dd06d7 \
    --cidr-block 10.0.12.0/24 \
    --availability-zone us-west-1a

Output
    {
        "Subnet": {
            "AvailabilityZone": "us-west-1a",
            "AvailabilityZoneId": "usw1-az3",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.12.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-028f49f43c269bbb6",
            "VpcId": "vpc-0c6f909f7f7dd06d7",
            "OwnerId": "817734494987",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "SubnetArn": "arn:aws:ec2:us-west-1:817734494987:subnet/subnet-028f49f43c269bbb6",
            "EnableDns64": false,
            "Ipv6Native": false,
            "PrivateDnsNameOptionsOnLaunch": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            }
        }
    }

aws ec2 create-tags \
    --resources subnet-028f49f43c269bbb6 --tags Key=Name,Value=public-a


aws ec2 create-subnet \
    --vpc-id vpc-0c6f909f7f7dd06d7 \
    --cidr-block 10.0.13.0/24 \
    --availability-zone us-west-1b

Output
    {
        "Subnet": {
            "AvailabilityZone": "us-west-1b",
            "AvailabilityZoneId": "usw1-az1",
            "AvailableIpAddressCount": 251,
            "CidrBlock": "10.0.13.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-026d12e8bc5a2cb68",
            "VpcId": "vpc-0c6f909f7f7dd06d7",
            "OwnerId": "817734494987",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "SubnetArn": "arn:aws:ec2:us-west-1:817734494987:subnet/subnet-026d12e8bc5a2cb68",
            "EnableDns64": false,
            "Ipv6Native": false,
            "PrivateDnsNameOptionsOnLaunch": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            }
        }
    }

aws ec2 create-tags \
    --resources subnet-026d12e8bc5a2cb68 --tags Key=Name,Value=public-b


- Any extra challenges faced?
Similar to last exercise I couldn't get a single command to create and name the subnet. AWS documentation also did not help.

https://docs.aws.amazon.com/cli/latest/reference/ec2/create-subnet.html


***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)