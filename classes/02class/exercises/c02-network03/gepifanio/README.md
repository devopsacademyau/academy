# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
aws ec2 create-vpc \
    --cidr-block 10.0.0.0/16
    --instance-tenancy default

{
    "Vpc": {
        "CidrBlock": "10.0.0.0/16",
        "DhcpOptionsId": "dopt-d786e8af",
        "State": "pending",
        "VpcId": "vpc-07d40c0436aaf08f7",
        "OwnerId": "873547843801",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-0b4fbe498d5949404",
                "CidrBlock": "10.0.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false
    }
}

aws ec2 create-tags --resources vpc-07d40c0436aaf08f7 --tags Key=Name,Value=devopsacademy-vpc

```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)