# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
$ aws ec2 create-internet-gateway

{
    "InternetGateway": {
        "Attachments": [],
        "InternetGatewayId": "igw-089944037834c5e28",
        "Tags": []
    }
}

$ aws ec2 create-tags \
    --resources igw-089944037834c5e28 --tags Key=Name,Value=devopsacademy-igw

$ aws ec2 attach-internet-gateway --internet-gateway-id igw-089944037834c5e28 --vpc-id vpc-0721e28436cea8410
```

- Any extra challenges faced?
Couldn't create IGW + its tag in just one go.

***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)
