# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
Add your commands and their outputs here


{
    "Vpc": {
        "CidrBlock": "172.16.0.0/16",
        "DhcpOptionsId": "dopt-3f26dd58",
        "State": "pending",
        "VpcId": "vpc-082db14641294a216",
        "OwnerId": "152848913167",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-06b2b5da85af22c5b",
                "CidrBlock": "172.16.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false
    }
}
networks to create
172.16.0.0  /19
172.16.32.0 /19
172.16.64.0 /19
172.16.96.0 /19
172.16.128.0 /19
172.16.160.0 /19

aws ec2 create-subnet --availability-zone ap-southeast-2a --vpc-id vpc-082db14641294a216 --cidr-block 172.16.0.0/19
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "172.16.0.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-03137b09e2b59edb3",
        "VpcId": "vpc-082db14641294a216",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-03137b09e2b59edb3",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}
aws ec2 create-tags --resources subnet-03137b09e2b59edb3  --tags Key=Name,Value=Public-A 

aws ec2 create-subnet --availability-zone ap-southeast-2a --vpc-id vpc-082db14641294a216 --cidr-block 172.16.32.0/19
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "172.16.32.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0da8dca2ee626f4f9",
        "VpcId": "vpc-082db14641294a216",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-0da8dca2ee626f4f9",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}
aws ec2 create-tags --resources subnet-0da8dca2ee626f4f9 --tags Key=Name,Value=Private-A

aws ec2 create-subnet --availability-zone ap-southeast-2b --vpc-id vpc-082db14641294a216 --cidr-block 172.16.64.0/19
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "172.16.64.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0fcaa65a0a797a895",
        "VpcId": "vpc-082db14641294a216",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-0fcaa65a0a797a895",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}
aws ec2 create-tags --resources subnet-0fcaa65a0a797a895 --tags Key=Name,Value=Public-B

aws ec2 create-subnet --availability-zone ap-southeast-2b --vpc-id vpc-082db14641294a216 --cidr-block 172.16.96.0/19
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "172.16.96.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-005e757c7a59ea2b7",
        "VpcId": "vpc-082db14641294a216",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-005e757c7a59ea2b7",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}
aws ec2 create-tags --resources subnet-005e757c7a59ea2b7 --tags Key=Name,Value=Private-B

aws ec2 create-subnet --availability-zone ap-southeast-2c --vpc-id vpc-082db14641294a216 --cidr-block 172.16.128.0/19
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "172.16.128.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-04e70b888049d1acc",
        "VpcId": "vpc-082db14641294a216",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-04e70b888049d1acc",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}
aws ec2 create-tags --resources subnet-04e70b888049d1acc --tags Key=Name,Value=Public-C

aws ec2 create-subnet --availability-zone ap-southeast-2c --vpc-id vpc-082db14641294a216 --cidr-block 172.16.160.0/19
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "172.16.160.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0ae23f7ec3bc3055f",
        "VpcId": "vpc-082db14641294a216",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-0ae23f7ec3bc3055f",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}
aws ec2 create-tags --resources subnet-0ae23f7ec3bc3055f --tags Key=Name,Value=Private-C

```

- Any extra challenges faced?



<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)