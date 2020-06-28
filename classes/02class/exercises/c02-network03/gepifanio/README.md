# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
aws ec2 create-vpc \
    --cidr-block 10.0.0.0/16
    --instance-tenancy default
    --no-amazon-provided-ipv6-cidr-block

{
    "Vpc": {
        "CidrBlock": "10.0.0.0/16",
        "DhcpOptionsId": "dopt-3f381258",
        "State": "pending",
        "VpcId": "vpc-018717ea8ed22e6ae",
        "OwnerId": "873547843801",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-037d474c38c1ca313",
                "CidrBlock": "10.0.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false
    }
}

aws ec2 create-tags --resources vpc-018717ea8ed22e6ae --tags Key=Name,Value=devopsacademy-vpc

```

- Any extra challenges faced?

Yes, struggling myselft to create the VPC in the right region, realized that I needed to change the region with `aws configure` command first. Had to redo everthing. 

Also, the vpc creation dont allow you to name the vpc, makes no much sense.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)