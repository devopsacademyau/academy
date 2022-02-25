# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
# Create the IGW
Command:
aws ec2 create-internet-gateway \
    --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=devopsacademy-igw}]'

Output:
{
    "InternetGateway": {
        "Attachments": [],
        "InternetGatewayId": "igw-032d97d397ea78b06",
        "OwnerId": "969496245957",
        "Tags": [
            {
                "Key": "Name",
                "Value": "devopsacademy-igw"
            }
        ]
    }
}

# Attach the IGW to VPC 
Command:
aws ec2 attach-internet-gateway \
    --internet-gateway-id igw-032d97d397ea78b06 \
    --vpc-id vpc-0e9963972a29d0cc3

Output:
➜  vishaalpal git:(vishaalpal/c02-network05) ✗ aws ec2 attach-internet-gateway \
    --internet-gateway-id igw-032d97d397ea78b06 \
    --vpc-id vpc-0e9963972a29d0cc3
➜  vishaalpal git:(vishaalpal/c02-network05) ✗ 

```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)

