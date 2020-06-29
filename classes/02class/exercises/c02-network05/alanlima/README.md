# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
$ aws ec2 create-internet-gateway
InternetGateway:
  Attachments: []
  InternetGatewayId: igw-0cea972837182480f
  OwnerId: '097922957316'
  Tags: []

$ aws ec2 create-tags \
    --tags Key=Name,Value=devopsacademy-igw \
    --resources igw-0cea972837182480f

# Attach the IGW to the VPC
$ aws ec2 attach-internet-gateway \
    --vpc-id vpc-034c2ccbba6ca0802 \
    --internet-gateway-id igw-0cea972837182480f

$ aws ec2 describe-internet-gateways --internet-gateway-id igw-0cea972837182480f
InternetGateways:
- Attachments:
  - State: available
    VpcId: vpc-034c2ccbba6ca0802
  InternetGatewayId: igw-0cea972837182480f
  OwnerId: '097922957316'
  Tags:
  - Key: Name
    Value: devopsacademy-igw
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)