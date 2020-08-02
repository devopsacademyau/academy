# c02-network04

```
VPC_ID   : vpc-064f8156856e7ef9e
CIDR     : 10.0.0.0/16
Public-a : 10.0.1.0/24 (251 hosts)
Public-b : 10.0.2.0/24 (251 hosts)
Public-c : 10.0.3.0/24 (251 hosts)
Private-a: 10.0.4.0/24 (251 hosts)
Private-b: 10.0.5.0/24 (251 hosts)
Private-c: 10.0.6.0/24 (251 hosts)

## Commands Execution Output

- Commands for creating the subnets:
```
Public-a
aws ec2 create-subnet --vpc-id vpc-064f8156856e7ef9e --cidr-block 10.0.1.0/24 --availability-zone ap-southeast-2a
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.1.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-00906c319bbfb11e2",
        "VpcId": "vpc-064f8156856e7ef9e",
        "OwnerId": "595178663294",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:595178663294:subnet/subnet-00906c319bbfb11e2"
    }
}
aws ec2 create-tags --resources subnet-00906c319bbfb11e2 --tags Key=Name,Value=public-a

Public-b
aws ec2 create-subnet --vpc-id vpc-064f8156856e7ef9e --cidr-block 10.0.2.0/24 --availability-zone ap-southeast-2b
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.2.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0c335a3ceb1cff52e",
        "VpcId": "vpc-064f8156856e7ef9e",
        "OwnerId": "595178663294",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:595178663294:subnet/subnet-0c335a3ceb1cff52e"
    }
}
aws ec2 create-tags --resources subnet-0c335a3ceb1cff52e --tags Key=Name,Value=public-b

Public-c
aws ec2 create-subnet --vpc-id vpc-064f8156856e7ef9e --cidr-block 10.0.3.0/24 --availability-zone ap-southeast-2c
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.3.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0b50b811ea125b4f2",
        "VpcId": "vpc-064f8156856e7ef9e",
        "OwnerId": "595178663294",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:595178663294:subnet/subnet-0b50b811ea125b4f2"
    }
}
aws ec2 create-tags --resources subnet-0b50b811ea125b4f2 --tags Key=Name,Value=public-c

Private-a
aws ec2 create-subnet --vpc-id vpc-064f8156856e7ef9e --cidr-block 10.0.4.0/24 --availability-zone ap-southeast-2a
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailabilityZoneId": "apse2-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.4.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0a1da7b9cc0df58f1",
        "VpcId": "vpc-064f8156856e7ef9e",
        "OwnerId": "595178663294",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:595178663294:subnet/subnet-0a1da7b9cc0df58f1"
    }
}
aws ec2 create-tags --resources subnet-0a1da7b9cc0df58f1 --tags Key=Name,Value=private-a

Private-b
aws ec2 create-subnet --vpc-id vpc-064f8156856e7ef9e --cidr-block 10.0.5.0/24 --availability-zone ap-southeast-2b
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailabilityZoneId": "apse2-az3",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.5.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-05454c5874fd52a03",
        "VpcId": "vpc-064f8156856e7ef9e",
        "OwnerId": "595178663294",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:595178663294:subnet/subnet-05454c5874fd52a03"
    }
}
aws ec2 create-tags --resources subnet-05454c5874fd52a03 --tags Key=Name,Value=private-b

Private-c
aws ec2 create-subnet --vpc-id vpc-064f8156856e7ef9e --cidr-block 10.0.6.0/24 --availability-zone ap-southeast-2c
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailabilityZoneId": "apse2-az2",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.6.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-08830fc6d95cf8c49",
        "VpcId": "vpc-064f8156856e7ef9e",
        "OwnerId": "595178663294",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-southeast-2:595178663294:subnet/subnet-08830fc6d95cf8c49"
    }
}
aws ec2 create-tags --resources subnet-08830fc6d95cf8c49 --tags Key=Name,Value=private-c
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)