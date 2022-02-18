# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
aws ec2 create-internet-gateway \
    --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=devopsacademy-igw}]'

{
    "InternetGateway": {
        "Attachments": [],
        "InternetGatewayId": "igw-03ebad1a48c3635c3",
        "OwnerId": "152848913167",
        "Tags": [
            {
                "Key": "Name",
                "Value": "devopsacademy-igw"
            }
        ]
    }
}

aws ec2 attach-internet-gateway \
    --internet-gateway-id igw-03ebad1a48c3635c3 \
    --vpc-id vpc-006e658f8ec8f0a05
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)