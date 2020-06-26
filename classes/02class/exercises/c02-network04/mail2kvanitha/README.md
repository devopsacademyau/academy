# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
Add your commands and their outputs here
```
> aws ec2 describe-vpcs --vpc-ids vpc-0d4cd22a6e87c698a

     {
         "Vpcs": [
             {
                 "CidrBlock": "10.10.0.0/16",
                 "DhcpOptionsId": "dopt-9d2a63fa",
                 "State": "available",
                 "VpcId": "vpc-0d4cd22a6e87c698a",
                 "OwnerId": "823151257518",
                 "InstanceTenancy": "default",
                 "CidrBlockAssociationSet": [
                     {
                         "AssociationId": "vpc-cidr-assoc-0d2825d065b51eea3",
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

> aws ec2 create-subnet --availability-zone ap-southeast-2a --cidr-block 10.10.1.0/24 --vpc-id vpc-0d4cd22a6e87c698a

     {
         "Subnet": {
             "AvailabilityZone": "ap-southeast-2a",
             "AvailabilityZoneId": "apse2-az1",
             "AvailableIpAddressCount": 251,
             "CidrBlock": "10.10.1.0/24",
             "DefaultForAz": false,
             "MapPublicIpOnLaunch": false,
             "State": "pending",
             "SubnetId": "subnet-0b3e389c94ec4d340",
             "VpcId": "vpc-0d4cd22a6e87c698a",
             "OwnerId": "823151257518",
             "AssignIpv6AddressOnCreation": false,
             "Ipv6CidrBlockAssociationSet": [],
             "SubnetArn": "arn:aws:ec2:ap-southeast-2:823151257518:subnet/subnet-0b3e389c94ec4d340"
         }
     }

> aws ec2 create-tags --resources subnet-0b3e389c94ec4d340 --tags Key=Name,Value=private-a

> aws ec2 describe-subnets --subnet-ids subnet-0b3e389c94ec4d340

     {
         "Subnets": [
             {
                 "AvailabilityZone": "ap-southeast-2a",
                 "AvailabilityZoneId": "apse2-az1",
                 "AvailableIpAddressCount": 251,
                 "CidrBlock": "10.10.1.0/24",
                 "DefaultForAz": false,
                 "MapPublicIpOnLaunch": false,
                 "State": "available",
                 "SubnetId": "subnet-0b3e389c94ec4d340",
                 "VpcId": "vpc-0d4cd22a6e87c698a",
                 "OwnerId": "823151257518",
                 "AssignIpv6AddressOnCreation": false,
                 "Ipv6CidrBlockAssociationSet": [],
                 "Tags": [
                     {
                         "Key": "Name",
                         "Value": "private-a"
                     }
                 ],
                 "SubnetArn": "arn:aws:ec2:ap-southeast-2:823151257518:subnet/subnet-0b3e389c94ec4d340"
             }
         ]
     }

> aws ec2 create-subnet --availability-zone ap-southeast-2b --cidr-block 10.10.2.0/24 --vpc-id vpc-0d4cd22a6e87c698a

     {
         "Subnet": {
             "AvailabilityZone": "ap-southeast-2b",
             "AvailabilityZoneId": "apse2-az3",
             "AvailableIpAddressCount": 251,
             "CidrBlock": "10.10.2.0/24",
             "DefaultForAz": false,
             "MapPublicIpOnLaunch": false,
             "State": "pending",
             "SubnetId": "subnet-07762642349e66471",
             "VpcId": "vpc-0d4cd22a6e87c698a",
             "OwnerId": "823151257518",
             "AssignIpv6AddressOnCreation": false,
             "Ipv6CidrBlockAssociationSet": [],
             "SubnetArn": "arn:aws:ec2:ap-southeast-2:823151257518:subnet/subnet-07762642349e66471"
         }
     }

> aws ec2 create-tags --resources subnet-07762642349e66471 --tags Key=Name,Value=private-b

> aws ec2 describe-subnets --subnet-ids subnet-07762642349e66471

     {
         "Subnets": [
             {
                 "AvailabilityZone": "ap-southeast-2b",
                 "AvailabilityZoneId": "apse2-az3",
                 "AvailableIpAddressCount": 251,
                 "CidrBlock": "10.10.2.0/24",
                 "DefaultForAz": false,
                 "MapPublicIpOnLaunch": false,
                 "State": "available",
                 "SubnetId": "subnet-07762642349e66471",
                 "VpcId": "vpc-0d4cd22a6e87c698a",
                 "OwnerId": "823151257518",
                 "AssignIpv6AddressOnCreation": false,
                 "Ipv6CidrBlockAssociationSet": [],
                 "Tags": [
                     {
                         "Key": "Name",
                         "Value": "private-b"
                     }
                 ],
                 "SubnetArn": "arn:aws:ec2:ap-southeast-2:823151257518:subnet/subnet-07762642349e66471"
             }
         ]
     }

> aws ec2 create-subnet --availability-zone ap-southeast-2c --cidr-block 10.10.3.0/24 --vpc-id vpc-0d4cd22a6e87c698a

     {
         "Subnet": {
             "AvailabilityZone": "ap-southeast-2c",
             "AvailabilityZoneId": "apse2-az2",
             "AvailableIpAddressCount": 251,
             "CidrBlock": "10.10.3.0/24",
             "DefaultForAz": false,
             "MapPublicIpOnLaunch": false,
             "State": "pending",
             "SubnetId": "subnet-066d0e3900a53d2b8",
             "VpcId": "vpc-0d4cd22a6e87c698a",
             "OwnerId": "823151257518",
             "AssignIpv6AddressOnCreation": false,
             "Ipv6CidrBlockAssociationSet": [],
             "SubnetArn": "arn:aws:ec2:ap-southeast-2:823151257518:subnet/subnet-066d0e3900a53d2b8"
         }
     }

> aws ec2 create-tags --resources subnet-066d0e3900a53d2b8 --tags Key=Name,Value=private-c

> aws ec2 describe-subnets --subnet-ids subnet-066d0e3900a53d2b8

     {
         "Subnets": [
             {
                 "AvailabilityZone": "ap-southeast-2c",
                 "AvailabilityZoneId": "apse2-az2",
                 "AvailableIpAddressCount": 251,
                 "CidrBlock": "10.10.3.0/24",
                 "DefaultForAz": false,
                 "MapPublicIpOnLaunch": false,
                 "State": "available",
                 "SubnetId": "subnet-066d0e3900a53d2b8",
                 "VpcId": "vpc-0d4cd22a6e87c698a",
                 "OwnerId": "823151257518",
                 "AssignIpv6AddressOnCreation": false,
                 "Ipv6CidrBlockAssociationSet": [],
                 "Tags": [
                     {
                         "Key": "Name",
                         "Value": "private-c"
                     }
                 ],
                 "SubnetArn": "arn:aws:ec2:ap-southeast-2:823151257518:subnet/subnet-066d0e3900a53d2b8"
             }
         ]
     }

> aws ec2 create-subnet --availability-zone ap-southeast-2a --cidr-block 10.10.11.0/24 --vpc-id vpc-0d4cd22a6e87c698a

     {
         "Subnet": {
             "AvailabilityZone": "ap-southeast-2a",
             "AvailabilityZoneId": "apse2-az1",
             "AvailableIpAddressCount": 251,
             "CidrBlock": "10.10.11.0/24",
             "DefaultForAz": false,
             "MapPublicIpOnLaunch": false,
             "State": "pending",
             "SubnetId": "subnet-0ccb8adf5a16bde13",
             "VpcId": "vpc-0d4cd22a6e87c698a",
             "OwnerId": "823151257518",
             "AssignIpv6AddressOnCreation": false,
             "Ipv6CidrBlockAssociationSet": [],
             "SubnetArn": "arn:aws:ec2:ap-southeast-2:823151257518:subnet/subnet-0ccb8adf5a16bde13"
         }
     }

> aws ec2 create-tags --resources subnet-0ccb8adf5a16bde13 --tags Key=Name,Value=public-a

> aws ec2 describe-subnets --subnet-ids subnet-0ccb8adf5a16bde13

     {
         "Subnets": [
             {
                 "AvailabilityZone": "ap-southeast-2a",
                 "AvailabilityZoneId": "apse2-az1",
                 "AvailableIpAddressCount": 251,
                 "CidrBlock": "10.10.11.0/24",
                 "DefaultForAz": false,
                 "MapPublicIpOnLaunch": false,
                 "State": "available",
                 "SubnetId": "subnet-0ccb8adf5a16bde13",
                 "VpcId": "vpc-0d4cd22a6e87c698a",
                 "OwnerId": "823151257518",
                 "AssignIpv6AddressOnCreation": false,
                 "Ipv6CidrBlockAssociationSet": [],
                 "Tags": [
                     {
                         "Key": "Name",
                         "Value": "public-a"
                     }
                 ],
                 "SubnetArn": "arn:aws:ec2:ap-southeast-2:823151257518:subnet/subnet-0ccb8adf5a16bde13"
             }
         ]
     }

> aws ec2 create-subnet --availability-zone ap-southeast-2b --cidr-block 10.10.12.0/24 --vpc-id vpc-0d4cd22a6e87c698a

     {
         "Subnet": {
             "AvailabilityZone": "ap-southeast-2b",
             "AvailabilityZoneId": "apse2-az3",
             "AvailableIpAddressCount": 251,
             "CidrBlock": "10.10.12.0/24",
             "DefaultForAz": false,
             "MapPublicIpOnLaunch": false,
             "State": "pending",
             "SubnetId": "subnet-0556c9832d80fb6bc",
             "VpcId": "vpc-0d4cd22a6e87c698a",
             "OwnerId": "823151257518",
             "AssignIpv6AddressOnCreation": false,
             "Ipv6CidrBlockAssociationSet": [],
             "SubnetArn": "arn:aws:ec2:ap-southeast-2:823151257518:subnet/subnet-0556c9832d80fb6bc"
         }
     }

> aws ec2 create-tags --resources subnet-0556c9832d80fb6bc --tags Key=Name,Value=public-b

> aws ec2 describe-subnets --subnet-ids subnet-0556c9832d80fb6bc

     {
         "Subnets": [
             {
                 "AvailabilityZone": "ap-southeast-2b",
                 "AvailabilityZoneId": "apse2-az3",
                 "AvailableIpAddressCount": 251,
                 "CidrBlock": "10.10.12.0/24",
                 "DefaultForAz": false,
                 "MapPublicIpOnLaunch": false,
                 "State": "available",
                 "SubnetId": "subnet-0556c9832d80fb6bc",
                 "VpcId": "vpc-0d4cd22a6e87c698a",
                 "OwnerId": "823151257518",
                 "AssignIpv6AddressOnCreation": false,
                 "Ipv6CidrBlockAssociationSet": [],
                  "Tags": [
                     {
                         "Key": "Name",
                         "Value": "public-b"
                     }
                 ],
                 "SubnetArn": "arn:aws:ec2:ap-southeast-2:823151257518:subnet/subnet-0556c9832d80fb6bc"
             }
         ]
     }

> aws ec2 create-subnet --availability-zone ap-southeast-2c --cidr-block 10.10.13.0/24 --vpc-id vpc-0d4cd22a6e87c698a

     {
         "Subnet": {
             "AvailabilityZone": "ap-southeast-2c",
             "AvailabilityZoneId": "apse2-az2",
             "AvailableIpAddressCount": 251,
             "CidrBlock": "10.10.13.0/24",
             "DefaultForAz": false,
             "MapPublicIpOnLaunch": false,
             "State": "pending",
             "SubnetId": "subnet-0d0623557a39ffd39",
             "VpcId": "vpc-0d4cd22a6e87c698a",
             "OwnerId": "823151257518",
             "AssignIpv6AddressOnCreation": false,
             "Ipv6CidrBlockAssociationSet": [],
             "SubnetArn": "arn:aws:ec2:ap-southeast-2:823151257518:subnet/subnet-0d0623557a39ffd39"
         }
     }

> aws ec2 create-tags --resources subnet-0d0623557a39ffd39 --tags Key=Name,Value=public-c

> aws ec2 describe-subnets --subnet-ids subnet-0d0623557a39ffd39

     {
         "Subnets": [
             {
                 "AvailabilityZone": "ap-southeast-2c",
                 "AvailabilityZoneId": "apse2-az2",
                 "AvailableIpAddressCount": 251,
                 "CidrBlock": "10.10.13.0/24",
                 "DefaultForAz": false,
                 "MapPublicIpOnLaunch": false,
                 "State": "available",
                 "SubnetId": "subnet-0d0623557a39ffd39",
                 "VpcId": "vpc-0d4cd22a6e87c698a",
                 "OwnerId": "823151257518",
                 "AssignIpv6AddressOnCreation": false,
                 "Ipv6CidrBlockAssociationSet": [],
                 "Tags": [
                     {
                         "Key": "Name",
                         "Value": "public-c"
                     }
                 ],
                 "SubnetArn": "arn:aws:ec2:ap-southeast-2:823151257518:subnet/subnet-0d0623557a39ffd39"
             }
         ]
     }

- Any extra challenges faced?
No Challenges

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)
