# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
Add your commands and their outputs here
```
aws ec2 create-subnet --vpc-id vpc-0cc0c4eeb9c6504d7 --cidr-block 172.33.1.0/24 --availability-zone ap-southeast-2a --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=ab-private-a}]'

aws ec2 create-subnet --vpc-id vpc-0cc0c4eeb9c6504d7 --cidr-block 172.33.2.0/24 --availability-zone ap-southeast-2b --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=ab-private-b}]'

aws ec2 create-subnet --vpc-id vpc-0cc0c4eeb9c6504d7 --cidr-block 172.33.3.0/24 --availability-zone ap-southeast-2c --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=ab-private-c}]'

aws ec2 create-subnet --vpc-id vpc-0cc0c4eeb9c6504d7 --cidr-block 172.33.10.0/24 --availability-zone ap-southeast-2a --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=ab-public-a}]'

aws ec2 create-subnet --vpc-id vpc-0cc0c4eeb9c6504d7 --cidr-block 172.33.10.0/24 --availability-zone ap-southeast-2b --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=ab-public-b}]'

aws ec2 create-subnet --vpc-id vpc-0cc0c4eeb9c6504d7 --cidr-block 172.33.12.0/24 --availability-zone ap-southeast-2c --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=ab-public-c}]'

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)