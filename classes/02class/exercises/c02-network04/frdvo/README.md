# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```

$ aws ec2 create-subnet --availability-zone ap-southeast-2a --cidr-block 172.16.10.0/23 --vpc-id vpc-0a2b7db4956438d22
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 507,
        "CidrBlock": "172.16.10.0/23",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "pending",
        "SubnetId": "subnet-0ba23989d8f1b0768",
        "VpcId": "vpc-0a2b7db4956438d22",
        "OwnerId": "165765640813",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:165765640813:subnet/subnet-0ba23989d8f1b0768"
    }
}

$ aws ec2 create-tags --tags Key=Name,Value=private-a --resources subnet-0ba23989d8f1b0768

$ aws ec2 create-subnet --availability-zone ap-southeast-2a --cidr-block 172.16.110.0/23 --vpc-id vpc-0a2b7db4956438d22
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 507,
        "CidrBlock": "172.16.110.0/23",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-04843486979b4aeb2",
        "VpcId": "vpc-0a2b7db4956438d22",
        "OwnerId": "165765640813",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:165765640813:subnet/subnet-04843486979b4aeb2"
    }
}

$ aws ec2 create-tags --tags Key=Name,Value=public-a --resources subnet-04843486979b4aeb2

$ aws ec2 create-subnet --availability-zone ap-southeast-2b --cidr-block 172.16.20.0/23 --vpc-id vpc-0a2b7db4956438d22
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 507,
        "CidrBlock": "172.16.20.0/23",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "pending",
        "SubnetId": "subnet-0b9349fa56d76afb7",
        "VpcId": "vpc-0a2b7db4956438d22",
        "OwnerId": "165765640813",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:165765640813:subnet/subnet-0b9349fa56d76afb7"
    }
}

$ aws ec2 create-tags --tags Key=Name,Value=private-b --resources subnet-0b9349fa56d76afb7

$ aws ec2 create-subnet --availability-zone ap-southeast-2b --cidr-block 172.16.120.0/23 --vpc-id vpc-0a2b7db4956438d22
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 507,
        "CidrBlock": "172.16.120.0/23",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "pending",
        "SubnetId": "subnet-0dbb2205880974071",
        "VpcId": "vpc-0a2b7db4956438d22",
        "OwnerId": "165765640813",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:165765640813:subnet/subnet-0dbb2205880974071"
    }
}

$ aws ec2 create-tags --tags Key=Name,Value=public-b --resources subnet-0dbb2205880974071

$ aws ec2 create-subnet --availability-zone ap-southeast-2c --cidr-block 172.16.30.0/23 --vpc-id vpc-0a2b7db4956438d22
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 507,
        "CidrBlock": "172.16.30.0/23",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "pending",
        "SubnetId": "subnet-074a113f80e846338",
        "VpcId": "vpc-0a2b7db4956438d22",
        "OwnerId": "165765640813",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:165765640813:subnet/subnet-074a113f80e846338"
    }
}

$ aws ec2 create-tags --tags Key=Name,Value=private-c --resources subnet-074a113f80e846338

$ aws ec2 create-subnet --availability-zone ap-southeast-2c --cidr-block 172.16.130.0/23 --vpc-id vpc-0a2b7db4956438d22
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 507,
        "CidrBlock": "172.16.130.0/23",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "pending",
        "SubnetId": "subnet-01f6ba32065d77e19",
        "VpcId": "vpc-0a2b7db4956438d22",
        "OwnerId": "165765640813",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:165765640813:subnet/subnet-01f6ba32065d77e19"
    }
}

$ aws ec2 create-tags --tags Key=Name,Value=public-c --resources subnet-01f6ba32065d77e19

````

- Any extra challenges faced?

Not really challenge, but I would love to find a way to create these networks applying one file with all configurations.


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)