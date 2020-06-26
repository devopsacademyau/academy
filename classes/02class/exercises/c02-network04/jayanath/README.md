# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
## Create the subnets
    Subnet CIDRs
    192.168.0.0/19
    192.168.32.0/19
    192.168.64.0/19
    192.168.96.0/19
    192.168.128.0/19
    192.168.160.0/19
    192.168.192.0/18 - not using this one
## Keeping 192.168.192.0/18 range out to have /19 cidrs for all 6 subnets :-)

## private-a -------------------------------------------------------------------------------------

> aws ec2 create-subnet \
    --vpc-id vpc-007774900b7f4c596 \
    --availability-zone ap-southeast-2a \
    --cidr-block 192.168.0.0/19

    {
        "Subnet": {
            "AvailabilityZone": "ap-southeast-2a",
            "AvailabilityZoneId": "apse2-az1",
            "AvailableIpAddressCount": 8187,
            "CidrBlock": "192.168.0.0/19",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "pending",
            "SubnetId": "subnet-0ee93ecd696d65414",
            "VpcId": "vpc-007774900b7f4c596",
            "OwnerId": "907095435092",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:907095435092:subnet/subnet-0ee93ecd696d65414"
        }
    }

> aws ec2 create-tags \
    --resources subnet-0ee93ecd696d65414 \
    --tags Key=Name,Value=private-a

## private-b -------------------------------------------------------------------------------------

> aws ec2 create-subnet \
    --vpc-id vpc-007774900b7f4c596 \
    --availability-zone ap-southeast-2b \
    --cidr-block 192.168.32.0/19

    {
        "Subnet": {
            "AvailabilityZone": "ap-southeast-2b",
            "AvailabilityZoneId": "apse2-az3",
            "AvailableIpAddressCount": 8187,
            "CidrBlock": "192.168.32.0/19",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "pending",
            "SubnetId": "subnet-0cf2dc519f5bc9a2a",
            "VpcId": "vpc-007774900b7f4c596",
            "OwnerId": "907095435092",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:907095435092:subnet/subnet-0cf2dc519f5bc9a2a"
        }
    }

> aws ec2 create-tags \
    --resources subnet-0cf2dc519f5bc9a2a \
    --tags Key=Name,Value=private-b

## private-c -------------------------------------------------------------------------------------

> aws ec2 create-subnet \
    --vpc-id vpc-007774900b7f4c596 \
    --availability-zone ap-southeast-2c \
    --cidr-block 192.168.64.0/19

    {
        "Subnet": {
            "AvailabilityZone": "ap-southeast-2c",
            "AvailabilityZoneId": "apse2-az2",
            "AvailableIpAddressCount": 8187,
            "CidrBlock": "192.168.64.0/19",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "pending",
            "SubnetId": "subnet-0462adf3034ba9204",
            "VpcId": "vpc-007774900b7f4c596",
            "OwnerId": "907095435092",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:907095435092:subnet/subnet-0462adf3034ba9204"
        }
    }

> aws ec2 create-tags \
    --resources subnet-0462adf3034ba9204 \
    --tags Key=Name,Value=private-c

## public-a -------------------------------------------------------------------------------------

> aws ec2 create-subnet \
    --vpc-id vpc-007774900b7f4c596 \
    --availability-zone ap-southeast-2a \
    --cidr-block 192.168.96.0/19

    {
        "Subnet": {
            "AvailabilityZone": "ap-southeast-2a",
            "AvailabilityZoneId": "apse2-az1",
            "AvailableIpAddressCount": 8187,
            "CidrBlock": "192.168.96.0/19",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "pending",
            "SubnetId": "subnet-05ba54dadeae3a83c",
            "VpcId": "vpc-007774900b7f4c596",
            "OwnerId": "907095435092",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:907095435092:subnet/subnet-05ba54dadeae3a83c"
        }
    }

> aws ec2 create-tags \
    --resources subnet-05ba54dadeae3a83c \
    --tags Key=Name,Value=public-a

## public-b -------------------------------------------------------------------------------------

> aws ec2 create-subnet \
    --vpc-id vpc-007774900b7f4c596 \
    --availability-zone ap-southeast-2b \
    --cidr-block 192.168.128.0/19

    {
        "Subnet": {
            "AvailabilityZone": "ap-southeast-2b",
            "AvailabilityZoneId": "apse2-az3",
            "AvailableIpAddressCount": 8187,
            "CidrBlock": "192.168.128.0/19",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "pending",
            "SubnetId": "subnet-068196b22d394d652",
            "VpcId": "vpc-007774900b7f4c596",
            "OwnerId": "907095435092",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:907095435092:subnet/subnet-068196b22d394d652"
        }
    }

> aws ec2 create-tags \
    --resources subnet-068196b22d394d652 \
    --tags Key=Name,Value=public-b

## public-c -------------------------------------------------------------------------------------

> aws ec2 create-subnet \
    --vpc-id vpc-007774900b7f4c596 \
    --availability-zone ap-southeast-2c \
    --cidr-block 192.168.160.0/19

    {
        "Subnet": {
            "AvailabilityZone": "ap-southeast-2c",
            "AvailabilityZoneId": "apse2-az2",
            "AvailableIpAddressCount": 8187,
            "CidrBlock": "192.168.160.0/19",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "pending",
            "SubnetId": "subnet-0dd2fb54c9ea5f901",
            "VpcId": "vpc-007774900b7f4c596",
            "OwnerId": "907095435092",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:907095435092:subnet/subnet-0dd2fb54c9ea5f901"
        }
    }

> aws ec2 create-tags \
    --resources subnet-0dd2fb54c9ea5f901 \
    --tags Key=Name,Value=public-c

```

- Any extra challenges faced?
```
- Could not set subnet name during creation. Had to set it using create-tags command afterwords.
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)