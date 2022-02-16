# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
# create the VPC
aws ec2 create-vpc --cidr-block 10.0.0.0/16
{
    "Vpc": {
        "CidrBlock": "10.0.0.0/16",
        "DhcpOptionsId": "dopt-554a393c",
        "State": "pending",
        "VpcId": "vpc-09666fb121d6ae087",
        "OwnerId": "639247960747",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-01ffe4383d2b66aa3",
                "CidrBlock": "10.0.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false
    }
}

# tag the VPC
aws ec2 create-tags --resources vpc-09666fb121d6ae087 --tags Key=Name,Value=devopsacademy-vpc

# confirm the VPC is named and in default tenancy 
aws ec2 describe-vpcs --vpc-ids vpc-09666fb121d6ae087

{
    "Vpcs": [
        {
            "CidrBlock": "10.0.0.0/16",
            "DhcpOptionsId": "dopt-554a393c",
            "State": "available",
            "VpcId": "vpc-09666fb121d6ae087",
            "OwnerId": "639247960747",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-01ffe4383d2b66aa3",
                    "CidrBlock": "10.0.0.0/16",
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

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)