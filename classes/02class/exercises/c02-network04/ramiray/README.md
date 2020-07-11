# c02-network04

## Commands Execution Output

## Subnet used in this exercise :

Subnet address	
172.16.0.0/21 - Private a							
172.16.8.0/21 - Private b		
172.16.16.0/20 - Private c 		
172.16.32.0/19 - Public a	
172.16.64.0/18 - Public b 		
172.16.128.0/17 - Public c 


- Commands for creating the subnets:
```
aws ec2 describe-vpcs --vpc-ids vpc-0351acfbc7aed9c1f
{
    "Vpcs": [
        {
            "VpcId": "vpc-0351acfbc7aed9c1f",
            "InstanceTenancy": "default",
            "Tags": [
                {
                    "Value": "devopsacademy-vpc",
                    "Key": "Name"
                }
            ],
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-0ab167c08ad1170cb",
                    "CidrBlock": "172.16.0.0/16",
                    "CidrBlockState": {
                        "State": "associated"
                    }
                }
            ],
            "State": "available",
            "DhcpOptionsId": "dopt-1ff7df78",
            "CidrBlock": "172.16.0.0/16",
            "IsDefault": false
        }
    ]
}

Private##:

2a: 

aws ec2 create-subnet --vpc-id vpc-0351acfbc7aed9c1f --availability-zone ap-southeast-2a --cidr-block 172.16.0.0/21
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailableIpAddressCount": 2043,
        "DefaultForAz": false,
        "Ipv6CidrBlockAssociationSet": [],
        "VpcId": "vpc-0351acfbc7aed9c1f",
        "State": "available",
        "MapPublicIpOnLaunch": false,
        "SubnetId": "subnet-06cf55d01bbed75dc",
        "CidrBlock": "172.16.0.0/21",
        "AssignIpv6AddressOnCreation": false
    }
}

aws ec2 create-tags --resources subnet-06cf55d01bbed75dc --tags Key=Name,Value=private-a

2b:

 aws ec2 create-subnet --vpc-id vpc-0351acfbc7aed9c1f --availability-zone ap-southeast-2b --cidr-block 172.16.8.0/21
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailableIpAddressCount": 2043,
        "DefaultForAz": false,
        "Ipv6CidrBlockAssociationSet": [],
        "VpcId": "vpc-0351acfbc7aed9c1f",
        "State": "available",
        "MapPublicIpOnLaunch": false,
        "SubnetId": "subnet-09ab1036f015f0f39",
        "CidrBlock": "172.16.8.0/21",
        "AssignIpv6AddressOnCreation": false
    }
}

aws ec2 create-tags --resources subnet-09ab1036f015f0f39  --tags Key=Name,Value=private-b

2c : 


aws ec2 create-subnet --vpc-id vpc-0351acfbc7aed9c1f --availability-zone ap-southeast-2c --cidr-block 172.16.16.0/20
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c",
        "AvailableIpAddressCount": 4091,
        "DefaultForAz": false,
        "Ipv6CidrBlockAssociationSet": [],
        "VpcId": "vpc-0351acfbc7aed9c1f",
        "State": "available",
        "MapPublicIpOnLaunch": false,
        "SubnetId": "subnet-0068f18136abefc12",
        "CidrBlock": "172.16.16.0/20",
        "AssignIpv6AddressOnCreation": false
    }
}

aws ec2 create-tags --resources subnet-0068f18136abefc12  --tags Key=Name,Value=private-c


Public ##:

2a :

aws ec2 create-subnet --vpc-id vpc-0351acfbc7aed9c1f --availability-zone ap-southeast-2a --cidr-block 172.16.32.0/19
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2a",
        "AvailableIpAddressCount": 8187,
        "DefaultForAz": false,
        "Ipv6CidrBlockAssociationSet": [],
        "VpcId": "vpc-0351acfbc7aed9c1f",
        "State": "available",
        "MapPublicIpOnLaunch": false,
        "SubnetId": "subnet-04c9d82c36567dcc6",
        "CidrBlock": "172.16.32.0/19",
        "AssignIpv6AddressOnCreation": false
    }
}

aws ec2 create-tags --resources subnet-04c9d82c36567dcc6 --tags Key=Name,Value=public-a

2b: 
aws ec2 create-subnet --vpc-id vpc-0351acfbc7aed9c1f --availability-zone ap-southeast-2b --cidr-block 172.16.64.0/18
{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2b",
        "AvailableIpAddressCount": 16379,
        "DefaultForAz": false,
        "Ipv6CidrBlockAssociationSet": [],
        "VpcId": "vpc-0351acfbc7aed9c1f",
        "State": "available",
        "MapPublicIpOnLaunch": false,
        "SubnetId": "subnet-0ad9dc31135c0f2d8",
        "CidrBlock": "172.16.64.0/18",
        "AssignIpv6AddressOnCreation": false
    }
}

aws ec2 create-tags --resources subnet-0ad9dc31135c0f2d8 --tags Key=Name,Value=public-b


2c
aws ec2 create-subnet --vpc-id vpc-0351acfbc7aed9c1f --availability-zone ap-southeast-2c --cidr-block 172.16.128.0/17

{
    "Subnet": {
        "AvailabilityZone": "ap-southeast-2c", 
        "AvailableIpAddressCount": 32763, 
        "DefaultForAz": false, 
        "Ipv6CidrBlockAssociationSet": [], 
        "VpcId": "vpc-0351acfbc7aed9c1f", 
        "State": "available", 
        "MapPublicIpOnLaunch": false, 
        "SubnetId": "subnet-05c88eab395f32a51", 
        "CidrBlock": "172.16.128.0/17", 
        "AssignIpv6AddressOnCreation": false
    }
}

aws ec2 create-tags --resources subnet-05c88eab395f32a51  --tags Key=Name,Value=public-c

```

- Any extra challenges faced?
 No challenges faced. 

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)