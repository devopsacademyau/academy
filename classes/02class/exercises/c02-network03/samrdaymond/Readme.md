# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
Add your commands and their outputs here
```
sam.daymond@contino.io@Sams-MacBook-Pro academy % aws ec2 create-vpc --cidr-block 172.16.0.0/16 --no-amazon-provided-ipv6-cidr-block --instance-tenancy default
{
    "Vpc": {
        "CidrBlock": "172.16.0.0/16",
        "DhcpOptionsId": "dopt-3f26dd58",
        "State": "pending",
        "VpcId": "vpc-082db14641294a216",
        "OwnerId": "152848913167",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-06b2b5da85af22c5b",
                "CidrBlock": "172.16.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false
    }
}

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)