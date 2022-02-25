# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
Command:
aws ec2 create-vpc \
    --cidr-block 10.0.0.0/16 \
    --instance-tenancy default \
    --tag-specifications ResourceType=vpc,Tags='{Key=Name,Value="devopsacademy-vpc"}' \
    --region ap-southeast-2

Output:
{
    "Vpc": {
        "CidrBlock": "10.0.0.0/16",
        "DhcpOptionsId": "dopt-0af63f5f36d56d830",
        "State": "pending",
        "VpcId": "vpc-0e9963972a29d0cc3",
        "OwnerId": "969496245957",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-004e647cb4b711733",
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
}
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)

