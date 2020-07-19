# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
aws ec2 create-vpc --cidr-block 10.0.0.0/16 --instance-tenancy default --no-amazon-provided-ipv6-cidr-block

{
    "Vpc": {
        "CidrBlock": "10.0.0.0/16",
        "DhcpOptionsId": "dopt-1972557e",
        "State": "pending",
        "VpcId": "vpc-064f8156856e7ef9e",
        "OwnerId": "595178663294",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-07c435f4826be3c46",
                "CidrBlock": "10.0.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false
    }
}

aws ec2 create-tags --resources vpc-064f8156856e7ef9e --tags 'Key=Name,Value=devopsacademy-vpc'
```

- Any extra challenges faced?

Cannot use tag-specifications on VPC yet so had to perform a second step.



<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)