# c02-network04

## Commands Execution Output

- Commands for creating the subnets:

# Check vpc
```yaml
aws ec2 describe-vpcs --vpc-ids vpc-09b37d389cf1e7937

{
    "Vpcs": [
        {
            "CidrBlock": "10.10.0.0/16",
            "DhcpOptionsId": "dopt-3f26dd58",
            "State": "available",
            "VpcId": "vpc-09b37d389cf1e7937",
            "OwnerId": "152848913167",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-0948ff9345ef44991",
                    "CidrBlock": "10.10.0.0/16",
                    "CidrBlockState": {
                        "State": "associated"
                    }
                }
            ],
            "IsDefault": false,
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "devopsacademy-vpc"
                }
            ]
        }
    ]
}
```


# Private-a
```yaml
aws ec2 create-subnet --vpc-id vpc-09b37d389cf1e7937 --availability-zone ap-southeast-2a --cidr-block 10.10.1.0/24 

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.10.1.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0bde38b7afdbd6944",
        "VpcId": "vpc-09b37d389cf1e7937",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-0bde38b7afdbd6944"
    }
}

aws ec2 create-tags --resources subnet-0bde38b7afdbd6944 --tags Key=Name,Value=private-a
```
# Private-b
```yaml
aws ec2 create-subnet --vpc-id vpc-09b37d389cf1e7937 --availability-zone ap-southeast-2b --cidr-block 10.10.2.0/24 

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.10.2.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-03b578d034bedba67",
        "VpcId": "vpc-09b37d389cf1e7937",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-03b578d034bedba67"
    }
}

aws ec2 create-tags --resources subnet-03b578d034bedba67 --tags Key=Name,Value=private-b
```
# Private-c
```yaml
aws ec2 create-subnet --vpc-id vpc-09b37d389cf1e7937 --availability-zone ap-southeast-2c --cidr-block 10.10.3.0/24 

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.10.3.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0ce7ea7d1323b4908",
        "VpcId": "vpc-09b37d389cf1e7937",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-0ce7ea7d1323b4908"
    }
}

aws ec2 create-tags --resources subnet-0ce7ea7d1323b4908 --tags Key=Name,Value=private-c
```

# Public-a
```yaml
aws ec2 create-subnet --vpc-id vpc-09b37d389cf1e7937 --availability-zone ap-southeast-2a --cidr-block 10.10.4.0/24 

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.10.4.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-08face2dbefdaa808",
        "VpcId": "vpc-09b37d389cf1e7937",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-08face2dbefdaa808"
    }
}

aws ec2 create-tags --resources subnet-08face2dbefdaa808 --tags Key=Name,Value=public-a
```
# Public-b
```yaml
aws ec2 create-subnet --vpc-id vpc-09b37d389cf1e7937 --availability-zone ap-southeast-2b --cidr-block 10.10.5.0/24 

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.10.5.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0ef15e9c2428f14ef",
        "VpcId": "vpc-09b37d389cf1e7937",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-0ef15e9c2428f14ef"
    }
}

aws ec2 create-tags --resources subnet-0ef15e9c2428f14ef --tags Key=Name,Value=public-b
```
# Public-c
```yaml
aws ec2 create-subnet --vpc-id vpc-09b37d389cf1e7937 --availability-zone ap-southeast-2c --cidr-block 10.10.6.0/24 

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.10.6.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0d0f491d94bff88ab",
        "VpcId": "vpc-09b37d389cf1e7937",
        "OwnerId": "152848913167",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:152848913167:subnet/subnet-0d0f491d94bff88ab"
    }
}

aws ec2 create-tags --resources subnet-0d0f491d94bff88ab --tags Key=Name,Value=public-c
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)