# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```bash
## Create a VPC
AWS_VPC_ID=$(aws ec2 create-vpc \
--cidr-block 10.0.0.0/16 \
--query 'Vpc.{VpcId:VpcId}' \
--output text)

## Add a tag to the VPC
aws ec2 create-tags \
--resources $AWS_VPC_ID \
--tags "Key=Name,Value=devopsacademy-vpc"

❯ aws ec2 describe-vpcs \
    --vpc-ids $AWS_VPC_ID
{
    "Vpcs": [
        {
            "CidrBlock": "10.0.0.0/16",
            "DhcpOptionsId": "dopt-f5dbfc92",
            "State": "available",
            "VpcId": "vpc-01cbfa4cf653d82e3",
            "OwnerId": "978009416274",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-0080a5bff35f5cf87",
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
```
I looked for something like "vpc-name" to set the name of the VPC so I found an example tagging the VPC. I think this is the way to name it, I am not sure though.
```

Resources
[Create a VPC](https://cloudaffaire.com/how-to-create-a-custom-vpc-using-aws-cli/)

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)