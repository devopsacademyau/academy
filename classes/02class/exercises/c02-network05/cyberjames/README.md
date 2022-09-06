# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
# Create Internet Gateway
$ aws ec2 create-internet-gateway \
--tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=devopsacademy-igw}]' \
--region us-east-1

{
    "InternetGateway": {
        "Attachments": [],
        "InternetGatewayId": "igw-0ef45e51d478789ef",
        "OwnerId": "152848913167",
        "Tags": [
            {
                "Key": "Name",
                "Value": "devopsacademy-igw"
            }
        ]
    }
}

# Attach Internet Gateway to the VPC.
$ aws ec2 attach-internet-gateway \
--internet-gateway-id igw-0ef45e51d478789ef \
--vpc-id vpc-0d8edf6a0d1104524 \
--region us-east-1
```

- Any extra challenges faced?
None so far. However, since I cannot use the region `ap-southeast-2` due to the previous error message, I chosed the `us-east-1`.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)