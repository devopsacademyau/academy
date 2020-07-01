# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
aws ec2 create-internet-gateway

{
    "InternetGateway": {
        "Attachments": [],
        "InternetGatewayId": "igw-00c6919aea3d2a973",
        "OwnerId": "873547843801",
        "Tags": []
    }
}

aws ec2 create-tags \
    --resources igw-00c6919aea3d2a973 \
    --tags Key=Name,Value=devopsacademy-vpc

aws ec2 attach-internet-gateway \
    --internet-gateway-id igw-00c6919aea3d2a973 \
    --vpc-id vpc-018717ea8ed22e6ae

```

- Any extra challenges faced?



<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)