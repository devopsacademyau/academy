# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
aws ec2 create-internet-gateway --region ap-southeast-2 --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=devopsacademy-igw}]'
{
    "InternetGateway": {
        "Attachments": [],
        "InternetGatewayId": "igw-07501b54cce045dab",
        "OwnerId": "594524864098",
        "Tags": [
            {
                "Key": "Name",
                "Value": "devopsacademy-igw"
            }
        ]
    }
}

aws ec2 attach-internet-gateway --internet-gateway-id igw-07501b54cce045dab --vpc-id vpc-0b4f29ed84bdb6fd1 --region ap-southeast-2
```

- Any extra challenges faced?
**None**

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)
