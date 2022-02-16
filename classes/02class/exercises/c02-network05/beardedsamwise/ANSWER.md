# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
$ aws ec2 create-internet-gateway \
    --tag-specifications "ResourceType=internet-gateway,Tags=[{Key=Name,Value=class02}]"
{
    "InternetGateway": {
        "Attachments": [],
        "InternetGatewayId": "igw-0b81c8807adff0ac7",
        "OwnerId": "639247960747",
        "Tags": [
            {
                "Key": "Name",
                "Value": "class02"
            }
        ]
    }
}

aws ec2 attach-internet-gateway \
    --internet-gateway-id igw-0b81c8807adff0ac7 \
    --vpc-id vpc-09666fb121d6ae087
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)