# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
# Creating an internet gateway
$ aws ec2 create-internet-gateway \
> --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=devopsacademy-igw}]'
{
    "InternetGateway": {
        "Attachments": [],
        "InternetGatewayId": "igw-0bbcbc961906aef6d",
        "OwnerId": "192643247659",
        "Tags": [
            {
                "Key": "Name",
                "Value": "devopsacademy-igw"
            }
        ]
    }
}

# Attaching internet gateway to VPC
$ aws ec2 attach-internet-gateway \
> --internet-gateway-id igw-0bbcbc961906aef6d \
> --vpc-id vpc-0d4d5380eac332f8b
```

- Any extra challenges faced?  
None

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)
