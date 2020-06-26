# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
> aws ec2 create-internet-gateway

    {
        "InternetGateway": {
            "Attachments": [],
            "InternetGatewayId": "igw-0831ac4f89910706b",
            "Tags": []
        }
    }

> aws ec2 create-tags \
    --resources igw-0831ac4f89910706b \
    --tags Key=Name,Value=devopsacademy-igw

> aws ec2 attach-internet-gateway \
    --internet-gateway-id igw-0831ac4f89910706b \
    --vpc-id vpc-007774900b7f4c596

> aws ec2 describe-internet-gateways \
    --filters Name=attachment.vpc-id,Values=vpc-007774900b7f4c596

    {
        "InternetGateways": [
            {
                "Attachments": [
                    {
                        "State": "available",
                        "VpcId": "vpc-007774900b7f4c596"
                    }
                ],
                "InternetGatewayId": "igw-0831ac4f89910706b",
                "OwnerId": "907095435092",
                "Tags": [
                    {
                        "Key": "Name",
                        "Value": "devopsacademy-igw"
                    }
                ]
            }
        ]
    }

```

- Any extra challenges faced?
```
- Naming the IGW had to be done as a separate step.
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)