# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
# Private Tier

$ aws ec2 create-subnet \
    --vpc-id vpc-0721e28436cea8410 \
    --cidr-block 10.11.1.0/24 \
    --availability-zone ap-southeast-2a

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.11.1.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "pending",
        "SubnetId": "subnet-062fa33492cd979a6",
        "VpcId": "vpc-0721e28436cea8410",
        "OwnerId": "149613515908",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:149613515908:subnet/subnet-062fa33492cd979a6"
    }
}

$ aws ec2 create-tags \
    --resources subnet-062fa33492cd979a6 --tags Key=Name,Value=private-a

$ aws ec2 create-subnet \
    --vpc-id vpc-0721e28436cea8410 \
    --cidr-block 10.11.2.0/24 \
    --availability-zone ap-southeast-2b

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.11.2.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "pending",
        "SubnetId": "subnet-078038e45d5365db6",
        "VpcId": "vpc-0721e28436cea8410",
        "OwnerId": "149613515908",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:149613515908:subnet/subnet-078038e45d5365db6"
    }
}

$ aws ec2 create-tags \
    --resources subnet-078038e45d5365db6 --tags Key=Name,Value=private-b

$ aws ec2 create-subnet \
    --vpc-id vpc-0721e28436cea8410 \
    --cidr-block 10.11.3.0/24 \
    --availability-zone ap-southeast-2c

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.11.3.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "pending",
        "SubnetId": "subnet-01ab2bdfc9ee4c1cd",
        "VpcId": "vpc-0721e28436cea8410",
        "OwnerId": "149613515908",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:149613515908:subnet/subnet-01ab2bdfc9ee4c1cd"
    }
}

$ aws ec2 create-tags \
    --resources subnet-01ab2bdfc9ee4c1cd --tags Key=Name,Value=private-c

# Public Tier

$ aws ec2 create-subnet \
    --vpc-id vpc-0721e28436cea8410 \
    --cidr-block 10.11.11.0/24 \
    --availability-zone ap-southeast-2a

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.11.11.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "pending",
        "SubnetId": "subnet-012cc488da2a78bcd",
        "VpcId": "vpc-0721e28436cea8410",
        "OwnerId": "149613515908",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:149613515908:subnet/subnet-012cc488da2a78bcd"
    }
}

$ aws ec2 create-tags \
    --resources subnet-012cc488da2a78bcd --tags Key=Name,Value=public-a

$ aws ec2 create-subnet \
    --vpc-id vpc-0721e28436cea8410 \
    --cidr-block 10.11.22.0/24 \
    --availability-zone ap-southeast-2b

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.11.22.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "pending",
        "SubnetId": "subnet-01c5db45e8f5eda43",
        "VpcId": "vpc-0721e28436cea8410",
        "OwnerId": "149613515908",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:149613515908:subnet/subnet-01c5db45e8f5eda43"
    }
}

$ aws ec2 create-tags \
    --resources subnet-01c5db45e8f5eda43 --tags Key=Name,Value=public-b

$ aws ec2 create-subnet \
    --vpc-id vpc-0721e28436cea8410 \
    --cidr-block 10.11.33.0/24 \
    --availability-zone ap-southeast-2c

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.11.33.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "pending",
        "SubnetId": "subnet-0f04d5a771b8895fd",
        "VpcId": "vpc-0721e28436cea8410",
        "OwnerId": "149613515908",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:149613515908:subnet/subnet-0f04d5a771b8895fd"
    }
}

$ aws ec2 create-tags \
    --resources subnet-0f04d5a771b8895fd --tags Key=Name,Value=public-c
```

- Any extra challenges faced?
I haven't found a way to create and tag subnets via AWS CLI in a single command, hence subnets were tagged in a separate command.

***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)
