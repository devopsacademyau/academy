# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
aws ec2 create-subnet \
    --vpc-id vpc-018717ea8ed22e6ae \
    --availability-zone ap-southeast-2a \
    --cidr-block 10.0.0.0/19

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "10.0.0.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0525ca8d01593ccbb",
        "VpcId": "vpc-018717ea8ed22e6ae",
        "OwnerId": "873547843801",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:873547843801:subnet/subnet-0525ca8d01593ccbb"
    }
}

aws ec2 create-tags \
    --resources subnet-0525ca8d01593ccbb \
    --tags Key=Name,Value=private-a

aws ec2 create-subnet \
    --vpc-id vpc-018717ea8ed22e6ae \
    --availability-zone ap-southeast-2b \
    --cidr-block 10.0.32.0/19

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "10.0.32.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0c59e8336e05250f4",
        "VpcId": "vpc-018717ea8ed22e6ae",
        "OwnerId": "873547843801",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:873547843801:subnet/subnet-0c59e8336e05250f4"
    }
}

aws ec2 create-tags \
    --resources subnet-0c59e8336e05250f4 \
    --tags Key=Name,Value=private-b

aws ec2 create-subnet \
    --vpc-id vpc-018717ea8ed22e6ae \
    --availability-zone ap-southeast-2c \
    --cidr-block 10.0.64.0/18

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 16379,
        "CidrBlock": "10.0.64.0/18",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0f7a92cd19aafc38f",
        "VpcId": "vpc-018717ea8ed22e6ae",
        "OwnerId": "873547843801",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:873547843801:subnet/subnet-0f7a92cd19aafc38f"
    }
}

aws ec2 create-tags \
    --resources subnet-0f7a92cd19aafc38f \
    --tags Key=Name,Value=private-c

aws ec2 create-subnet \
    --vpc-id vpc-018717ea8ed22e6ae \
    --availability-zone ap-southeast-2a \
    --cidr-block 10.0.128.0/18

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 16379,
        "CidrBlock": "10.0.128.0/18",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0c341aabdd7fc51d6",
        "VpcId": "vpc-018717ea8ed22e6ae",
        "OwnerId": "873547843801",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:873547843801:subnet/subnet-0c341aabdd7fc51d6"
    }
}

aws ec2 create-tags \
    --resources subnet-0c341aabdd7fc51d6 \
    --tags Key=Name,Value=public-a

aws ec2 create-subnet \
    --vpc-id vpc-018717ea8ed22e6ae \
    --availability-zone ap-southeast-2b \
    --cidr-block 10.0.192.0/19

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "10.0.192.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0300fc4a8e14db404",
        "VpcId": "vpc-018717ea8ed22e6ae",
        "OwnerId": "873547843801",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:873547843801:subnet/subnet-0300fc4a8e14db404"
    }
}

aws ec2 create-tags \
    --resources subnet-0300fc4a8e14db404 \
    --tags Key=Name,Value=public-b

aws ec2 create-subnet \
    --vpc-id vpc-018717ea8ed22e6ae \
    --availability-zone ap-southeast-2c \
    --cidr-block 10.0.224.0/19

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "10.0.224.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-08e6b80e60766149b",
        "VpcId": "vpc-018717ea8ed22e6ae",
        "OwnerId": "873547843801",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:873547843801:subnet/subnet-08e6b80e60766149b"
    }
}

aws ec2 create-tags \
    --resources subnet-08e6b80e60766149b \
    --tags Key=Name,Value=public-c

```

- Any extra challenges faced?


Yes, to find out the AZ and region options, confused as when you are creating the VPC it doenst allow you to pick the region and either the subnet. 


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)