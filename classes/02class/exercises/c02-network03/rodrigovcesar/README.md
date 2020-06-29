# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
aws ec2 create-vpc --cidr-block 10.0.0.0/16 --instance-tenancy default 
{
    "Vpc": {
        "CidrBlock": "10.0.0.0/16",
        "DhcpOptionsId": "dopt-a57d56c2",
        "State": "pending",
        "VpcId": "vpc-03f503f58eb9f0512",
        "OwnerId": "102825027349",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-07059c9abbf5c0c54",
                "CidrBlock": "10.0.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false
    }
}

aws ec2 create-tags --tags Key=Name,Value=devopsacademy-vpc --resources vpc-03f503f58eb9f0512

aws ec2 describe-vpcs --vpc-id vpc-03f503f58eb9f0512
{
    "Vpcs": [
        {
            "CidrBlock": "10.0.0.0/16",
            "DhcpOptionsId": "dopt-a57d56c2",
            "State": "available",
            "VpcId": "vpc-03f503f58eb9f0512",
            "OwnerId": "102825027349",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-07059c9abbf5c0c54",
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

To create associate the name I needed a second command I found outside the AWS docs.


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)