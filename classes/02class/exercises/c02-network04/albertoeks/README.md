# c02-network04

## Commands Execution Output

- Commands for creating the subnets:

```yaml
# find VPC from previous exercise
$ aws ec2 describe-vpcs
{
    "Vpcs": [
        {
            "CidrBlock": "172.31.0.0/16",
            "DhcpOptionsId": "dopt-5e83a939",
            "State": "available",
            "VpcId": "vpc-c6aba3a1",
            "OwnerId": "059642851259",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-6566930e",
                    "CidrBlock": "172.31.0.0/16",
                    "CidrBlockState": {
                        "State": "associated"
                    }
                }
            ],
            "IsDefault": true
        },
        {
            "CidrBlock": "10.0.0.0/16",
            "DhcpOptionsId": "dopt-5e83a939",
            "State": "available",
            "VpcId": "vpc-0cd0952e1f57efa55",
            "OwnerId": "059642851259",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-082d9379773a4ec47",
                    "CidrBlock": "10.0.0.0/16",
                    "CidrBlockState": {
                        "State": "associated"
                    }
                }
            ],
            "IsDefault": false
        }
    ]
}

# VPC from previous exercise = vpc-0cd0952e1f57efa55
# create first public subnet
aws ec2 create-subnet --vpc-id vpc-0cd0952e1f57efa55 --cidr-block 10.0.0.0/19 --region ap-southeast-2 --availability-zone ap-southeast-2a
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "10.0.0.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-00eabffe5c5d7aafb",
        "VpcId": "vpc-0cd0952e1f57efa55",
        "OwnerId": "059642851259",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:059642851259:subnet/subnet-00eabffe5c5d7aafb"
    }
}
# name it as public-a
aws ec2 create-tags --tags Key=Name,Value=public-a --resources subnet-00eabffe5c5d7aafb

# create second public subnet
aws ec2 create-subnet --vpc-id vpc-0cd0952e1f57efa55 --cidr-block 10.0.32.0/19 --region ap-southeast-2 --availability-zone ap-southeast-2b
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "10.0.32.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-098d218d2576712de",
        "VpcId": "vpc-0cd0952e1f57efa55",
        "OwnerId": "059642851259",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:059642851259:subnet/subnet-098d218d2576712de"
    }
}

# name it as public-b
aws ec2 create-tags --tags Key=Name,Value=public-b --resources subnet-098d218d2576712de

# create third public subnet
aws ec2 create-subnet --vpc-id vpc-0cd0952e1f57efa55 --cidr-block 10.0.64.0/19 --region ap-southeast-2 --availability-zone ap-southeast-2c
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "10.0.64.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0598547c446e8448c",
        "VpcId": "vpc-0cd0952e1f57efa55",
        "OwnerId": "059642851259",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:059642851259:subnet/subnet-0598547c446e8448c"
    }
}

# name it as public-c
aws ec2 create-tags --tags Key=Name,Value=public-c --resources subnet-0598547c446e8448c

# create first private subnet
aws ec2 create-subnet --vpc-id vpc-0cd0952e1f57efa55 --cidr-block 10.0.96.0/19 --region ap-southeast-2 --availability-zone ap-southeast-2a
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "10.0.96.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-082b7aaf108745a7a",
        "VpcId": "vpc-0cd0952e1f57efa55",
        "OwnerId": "059642851259",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:059642851259:subnet/subnet-082b7aaf108745a7a"
    }
}

# name it as private-a
aws ec2 create-tags --tags Key=Name,Value=private-a --resources subnet-082b7aaf108745a7a

# create second private subnet
aws ec2 create-subnet --vpc-id vpc-0cd0952e1f57efa55 --cidr-block 10.0.128.0/19 --region ap-southeast-2 --availability-zone ap-southeast-2b
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "10.0.128.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-07b6fb70a5d6c1de7",
        "VpcId": "vpc-0cd0952e1f57efa55",
        "OwnerId": "059642851259",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:059642851259:subnet/subnet-07b6fb70a5d6c1de7"
    }
}

# name it as private-b
aws ec2 create-tags --tags Key=Name,Value=private-b --resources subnet-07b6fb70a5d6c1de7

# create third private subnet
aws ec2 create-subnet --vpc-id vpc-0cd0952e1f57efa55 --cidr-block 10.0.160.0/19 --region ap-southeast-2 --availability-zone ap-southeast-2c
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "10.0.160.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0b0d213ffa83d7bff",
        "VpcId": "vpc-0cd0952e1f57efa55",
        "OwnerId": "059642851259",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:059642851259:subnet/subnet-0b0d213ffa83d7bff"
    }
}

# name it as private-c
aws ec2 create-tags --tags Key=Name,Value=private-c --resources subnet-0b0d213ffa83d7bff


```

- Any extra challenges faced?
There was no challenge at this time.

***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)