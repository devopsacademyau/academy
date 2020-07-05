
# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
aws ec2 create-internet-gateway
aws ec2 create-tags --resources igw-0047722be38dccb86 --tags Key=Name,Value=devopsacademy-igw

aws ec2 attach-internet-gateway \
--vpc-id vpc-0c2c93451cdd28192 \
--internet-gateway-id igw-0047722be38dccb86

InternetGateways:
- Attachments:
  - State: available
    VpcId: vpc-0c2c93451cdd28192
  InternetGatewayId: igw-0047722be38dccb86
  OwnerId: '646093908012'
  Tags:
  - Key: Name
    Value: devopsacademy-igw
```



<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)

> Written with [StackEdit](https://stackedit.io/).
