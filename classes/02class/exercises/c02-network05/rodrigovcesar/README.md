# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
Add your commands and their outputs here


aws ec2 create-internet-gateway \
--output text \
--query 'InternetGateway.InternetGatewayId' \
| xargs aws ec2 create-tags \
--tags Key=Name,Value=devopsacademy-igw \
--resources \


aws ec2 describe-internet-gateways \
--filters "Name=tag-value,Values=devopsacademy-igw" \
--query "InternetGateways[0].InternetGatewayId" --output text \
| xargs aws ec2 attach-internet-gateway \
--vpc-id vpc-03f503f58eb9f0512 \
--internet-gateway-id

```

-Check the results

```
aws ec2 describe-internet-gateways 
{
    "InternetGateways": [
        {
            "Attachments": [
                {
                    "State": "available",
                    "VpcId": "vpc-03f503f58eb9f0512"
                }
            ],
            "InternetGatewayId": "igw-0825d1894af2ed24c",
            "OwnerId": "102825027349",
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "devopsacademy-igw"
                }
            ]
        },
        {
            "Attachments": [
                {
                    "State": "available",
                    "VpcId": "vpc-56424b31"
                }
            ],
            "InternetGatewayId": "igw-2bb2ad4f",
            "OwnerId": "102825027349",
            "Tags": []
        }
    ]
}

```

- Any extra challenges faced?
I tried to unify the commands, not much familiar with bash in Linux yet, but replicating the same logic what I used in the previous exercise and use the "describe" command to grab the id by the tag and attaching it to the vpc. 


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)