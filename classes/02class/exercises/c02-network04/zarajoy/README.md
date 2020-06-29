# c02-network04

## Commands Execution Output


-Split VPC (192.168.0.0/16) 'devopsacademy-vpc' (192.168.0.0/16) into 6 subnets.

(000 001 010 100 011 100 110 111) 

You need +3 bits to make 6 subnets (can make upto 8 with 3 bits) so 16+3 = 19

|SubnetID | Subnet Address | Host Address Range | Broadcast Address |
|-|-|-|-|-|
|1|192.168.0.0/19|192.168.0.1 - 192.168.31.254|192.168.31.255
|2|192.168.32.0/19|192.168.32.1 - 192.168.63.254|192.168.63.255
|3|192.168.64.0/19|192.168.64.1 - 192.168.95.254|192.168.95.255
|4|192.168.96.0/19|192.168.96.1 - 192.168.127.254|192.168.127.255
|5|192.168.128.0/19 |192.168.128.1 - 192.168.159.254|192.168.159.255
|6|192.168.160.0/19|192.168.160.1 - 192.168.191.254|192.168.191.255
|7|192.168.192.0/19|192.168.192.1 - 192.168.223.254|192.168.223.255
|8|192.168.224.0/19|192.168.224.1 - 192.168.255.254|192.168.255.255

will use SubnetID 1-6. Each subnet has 8192 hosts.
- Commands for creating the subnets:
```
z@bacon:~$ aws ec2 describe-availability-zones --region ap-southeast-2
{
    "AvailabilityZones": [
        {
            "State": "available",
            "OptInStatus": "opt-in-not-required",
            "Messages": [],
            "RegionName": "ap-southeast-2",
            "ZoneName": "ap-southeast-2a",
            "ZoneId": "apse2-az3",
            "GroupName": "ap-southeast-2",
            "NetworkBorderGroup": "ap-southeast-2"
        },
        {
            "State": "available",
            "OptInStatus": "opt-in-not-required",
            "Messages": [],
            "RegionName": "ap-southeast-2",
            "ZoneName": "ap-southeast-2b",
            "ZoneId": "apse2-az1",
            "GroupName": "ap-southeast-2",
            "NetworkBorderGroup": "ap-southeast-2"
        },
        {
            "State": "available",
            "OptInStatus": "opt-in-not-required",
            "Messages": [],
            "RegionName": "ap-southeast-2",
            "ZoneName": "ap-southeast-2c",
            "ZoneId": "apse2-az2",
            "GroupName": "ap-southeast-2",
            "NetworkBorderGroup": "ap-southeast-2"
        }
    ]
}

# Private 2a
z@bacon:~$ aws ec2 create-subnet --vpc-id vpc-09d2f2719d50d1f7f --availability-zone ap-southeast-2a --cidr-block 192.168.0.0/19
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "192.168.0.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-07cd3a9c8c7c3634e",
        "VpcId": "vpc-09d2f2719d50d1f7f",
        "OwnerId": "512742231244",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:512742231244:subnet/subnet-07cd3a9c8c7c3634e"
    }
}
z@bacon:~$ aws ec2 create-tags --resources subnet-07cd3a9c8c7c3634e --tags Key=Name,Value=Private-a

# check that worked...

z@bacon:~$ aws ec2 describe-subnets --subnet-ids subnet-07cd3a9c8c7c3634e
{
    "Subnets": [
        {
            "AvailabilityZone": "ap-southeast-2a",
            "AvailabilityZoneId": "apse2-az3",
            "AvailableIpAddressCount": 8187,
            "CidrBlock": "192.168.0.0/19",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-07cd3a9c8c7c3634e",
            "VpcId": "vpc-09d2f2719d50d1f7f",
            "OwnerId": "512742231244",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "Private-a"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:512742231244:subnet/subnet-07cd3a9c8c7c3634e"
        }
    ]
}

# Private 2b
z@bacon:~$ aws ec2 create-subnet --vpc-id vpc-09d2f2719d50d1f7f --availability-zone ap-southeast-2b --cidr-block 192.168.32.0/19
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "192.168.32.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-078316faa4ed0b47e",
        "VpcId": "vpc-09d2f2719d50d1f7f",
        "OwnerId": "512742231244",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:512742231244:subnet/subnet-078316faa4ed0b47e"
    }
}
z@bacon:~$ aws ec2 create-tags --resources subnet-078316faa4ed0b47e --tags Key=Name,Value=Private-b

#Private 2c
z@bacon:~$ aws ec2 create-subnet --vpc-id vpc-09d2f2719d50d1f7f --availability-zone ap-southeast-2c --cidr-block 192.168.64.0/19
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "192.168.64.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0dd32a6ae556bf2dc",
        "VpcId": "vpc-09d2f2719d50d1f7f",
        "OwnerId": "512742231244",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:512742231244:subnet/subnet-0dd32a6ae556bf2dc"
    }
}
z@bacon:~$ aws ec2 create-tags --resources subnet-0dd32a6ae556bf2dc --tags Key=Name,Value=Private-c

#Public a
z@bacon:~$ aws ec2 create-subnet --vpc-id vpc-09d2f2719d50d1f7f --availability-zone ap-southeast-2a --cidr-block 192.168.96.0/19
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "192.168.96.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0907f22726c996fd5",
        "VpcId": "vpc-09d2f2719d50d1f7f",
        "OwnerId": "512742231244",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:512742231244:subnet/subnet-0907f22726c996fd5"
    }
}
z@bacon:~$ aws ec2 create-tags --resources subnet-0907f22726c996fd5 --tags Key=Name,Value=Public-a

#Public b
z@bacon:~$ aws ec2 create-subnet --vpc-id vpc-09d2f2719d50d1f7f --availability-zone ap-southeast-2b --cidr-block 192.168.128.0/19
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "192.168.128.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0abbcb057289b670d",
        "VpcId": "vpc-09d2f2719d50d1f7f",
        "OwnerId": "512742231244",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:512742231244:subnet/subnet-0abbcb057289b670d"
    }
}
z@bacon:~$ aws ec2 create-tags --resources subnet-0abbcb057289b670d --tags Key=Name,Value=Public-b

#Public c
z@bacon:~$ aws ec2 create-subnet --vpc-id vpc-09d2f2719d50d1f7f --availability-zone ap-southeast-2c --cidr-block 192.168.160.0/19
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 8187,
        "CidrBlock": "192.168.160.0/19",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-00649d5b0632cc2be",
        "VpcId": "vpc-09d2f2719d50d1f7f",
        "OwnerId": "512742231244",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:512742231244:subnet/subnet-00649d5b0632cc2be"
    }
}
z@bacon:~$ aws ec2 create-tags --resources subnet-00649d5b0632cc2be --tags Key=Name,Value=Public-c
z@bacon:~$ 


```

- Any extra challenges faced?
cant find a command that lists all subnets associated with a particular vpc. It would be helpful.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)