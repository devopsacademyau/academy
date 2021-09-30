# c02-network04

## Commands Execution Output

- Create 2 subnets (private and public) per Availability Zone (6 subnets in total)
- name: <private/public>- -- e.g.: `private-a` `private-b`
- VPC: use the VPC created on last exercise
- AZ: refer to the name -- e.g.: subnet `private-a` will be `Availability Zone A` `ap-southeast-2a`
- IPv4 CIDR: make it room for at least 250 hosts

```
aws ec2 create-subnet --vpc-id vpc-0437c9e5d4deb0d46 --cidr-block 10.128.10.0/24 --availability-zone ap-southeast-2a --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=tk-dojo-public-a}]'
aws ec2 create-subnet --vpc-id vpc-0437c9e5d4deb0d46 --cidr-block 10.128.20.0/24 --availability-zone ap-southeast-2a --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=tk-dojo-private-a}]'

aws ec2 create-subnet --vpc-id vpc-0437c9e5d4deb0d46 --cidr-block 10.128.11.0/24 --availability-zone ap-southeast-2b --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=tk-dojo-public-b}]'
aws ec2 create-subnet --vpc-id vpc-0437c9e5d4deb0d46 --cidr-block 10.128.21.0/24 --availability-zone ap-southeast-2b --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=tk-dojo-private-b}]'

aws ec2 create-subnet --vpc-id vpc-0437c9e5d4deb0d46 --cidr-block 10.128.12.0/24 --availability-zone ap-southeast-2c --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=tk-dojo-public-c}]'
aws ec2 create-subnet --vpc-id vpc-0437c9e5d4deb0d46 --cidr-block 10.128.22.0/24 --availability-zone ap-southeast-2c --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=tk-dojo-private-c}]'
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)