# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```yaml
# create gateway
aws ec2 create-internet-gateway 

{
    "InternetGateway": {
        "Attachments": [],
        "InternetGatewayId": "igw-0737fb5611732f8a9",
        "OwnerId": "152848913167",
        "Tags": []
    }
}

# name gateway
aws ec2 create-tags --resources igw-0737fb5611732f8a9 --tags Key=Name,Value=devopsacademy-igw

# link to vpc
aws ec2 attach-internet-gateway --internet-gateway-id igw-0737fb5611732f8a9 --vpc-id vpc-09b37d389cf1e7937
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)