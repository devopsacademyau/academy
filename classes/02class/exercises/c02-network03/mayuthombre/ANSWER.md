# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:

The following create-vpc example creates a VPC with the specified IPv4 CIDR block.

```
aws ec2 create-vpc \
    --cidr-block 10.0.0.0/16


Output
    {
        "Vpc": {
            "CidrBlock": "10.0.0.0/16",
            "DhcpOptionsId": "dopt-0cf09cc487be376e7",
            "State": "pending",
            "VpcId": "vpc-094b910bc57cf04b1",
            "OwnerId": "817734494987",
            "InstanceTenancy": "default",
            "Ipv6CidrBlockAssociationSet": [],
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-0c8b84347260e94bc",
                    "CidrBlock": "10.0.0.0/16",
                    "CidrBlockState": {
                        "State": "associated"
                    }
                }
            ],
            "IsDefault": false
        }
    }
```

Before we create tag first note down the VPC ID from the output above. Then run following command to tag the VPC. You should see no errors if command is executed successfully

```
aws ec2 create-tags \
    --resources vpc-094b910bc57cf04b1 --tags Key=Name,Value=devopsacademy-vpc
```



- Any extra challenges faced?

I tried running a combined command to create and tag VPC in single command as per AWS documentation. But it kept giving me error
    zsh: no matches found: Tags=[Key=Name]

Command I tried to execute
```
aws ec2 create-vpc \
    --cidr-block 10.0.0.0/16 \
    --tag-specification ResourceType=vpc,Tags=[{Key=Name,Value=devopsacademy-vpc}]
```

AWS documentation to Create VPC
https://docs.aws.amazon.com/cli/latest/reference/ec2/create-vpc.html

***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)