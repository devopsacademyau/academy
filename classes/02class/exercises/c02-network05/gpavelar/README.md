# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:

```bash
## Creating internet Gateway
## This command allow you create many internet gateways using the same TAG NAME...
aws ec2 create-internet-gateway --tag-specifications 'ResourceType="internet-gateway",Tags=[{Key="Name",Value="devopsacademy-igw"}]'
# Output
INTERNETGATEWAY igw-04518145207146fe7   478433196210
TAGS    Name    devopsacademy-igw

# It is not yet attached to any VPC

## vpc-id = vpc-074c260483405f2bb
## internet-gateway-id = igw-04518145207146fe7
## Attach InternetGateway to VPC

aws ec2 attach-internet-gateway --vpc-id vpc-074c260483405f2bb --internet-gateway-id igw-04518145207146fe7

## Describe Internet Gateway
aws ec2 describe-internet-gateways

# Output
INTERNETGATEWAYS        igw-04518145207146fe7   478433196210
ATTACHMENTS     available       vpc-074c260483405f2bb
TAGS    Name    devopsacademy-igw

# Now it's attached to our previous vpc.
```

- Any extra challenges faced?

  > 1. Decide which ResourceType to use in --tag-specifications parameter to give a custom name for my vpc. I hope I had chose the right one.

  > 2. Is there any way to attach vpc using its name/tag?

---

Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)
