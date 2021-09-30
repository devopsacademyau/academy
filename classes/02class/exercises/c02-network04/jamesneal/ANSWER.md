# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
aws ec2 create-subnet --vpc-id <vpc id> --cidr-block 10.0.1.0/24 --availability-zone ap-southeast-2a --tag-specifications 'ResourceType=subnet, Tags=[{Key=Name, Value=neljn-dojo-public-a}]'
aws ec2 create-subnet --vpc-id <vpc id> --cidr-block 10.0.4.0/24 --availability-zone ap-southeast-2a --tag-specifications 'ResourceType=subnet, Tags=[{Key=Name, Value=neljn-dojo-private-a}]'

aws ec2 create-subnet --vpc-id <vpc id> --cidr-block 10.0.2.0/24 --availability-zone ap-southeast-2b --tag-specifications 'ResourceType=subnet, Tags=[{Key=Name, Value=neljn-dojo-public-a}]'
aws ec2 create-subnet --vpc-id <vpc id> --cidr-block 10.0.3.0/24 --availability-zone ap-southeast-2b --tag-specifications 'ResourceType=subnet, Tags=[{Key=Name, Value=neljn-dojo-private-b}]'

aws ec2 create-subnet --vpc-id <vpc id> --cidr-block 10.0.5.0/24 --availability-zone ap-southeast-2c --tag-specifications 'ResourceType=subnet, Tags=[{Key=Name, Value=neljn-dojo-public-a}]'
aws ec2 create-subnet --vpc-id <vpc id> --cidr-block 10.0.6.0/24 --availability-zone ap-southeast-2c --tag-specifications 'ResourceType=subnet, Tags=[{Key=Name, Value=neljn-dojo-private-b}]'
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)