# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
## Private
```
aws --region us-east-1 ec2 create-subnet --vpc-id vpc-0e4bde4129898095b \
--cidr-block 192.168.0.0/24 \
--tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=private-a}]" \
--availability-zone-id use1-az1

aws --region us-east-1 ec2 create-subnet --vpc-id vpc-0e4bde4129898095b \
--cidr-block 192.168.1.0/24 \
--tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=private-b}]" \
--availability-zone-id use1-az2

aws --region us-east-1 ec2 create-subnet --vpc-id vpc-0e4bde4129898095b \
--cidr-block 192.168.2.0/24 \
--tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=private-c}]" \
--availability-zone-id use1-az3
```
## Public
```
aws --region us-east-1 ec2 create-subnet --vpc-id vpc-0e4bde4129898095b \
--cidr-block 192.168.3.0/24 \
--tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=publica}]" \ 
--availability-zone-id use1-az1

aws --region us-east-1 ec2 create-subnet --vpc-id vpc-0e4bde4129898095b \
--cidr-block 192.168.4.0/24 \
--tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=publicb}]" \
--availability-zone-id use1-az2

aws --region us-east-1 ec2 create-subnet --vpc-id vpc-0e4bde4129898095b \
--cidr-block 192.168.5.0/24 \
--tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=publicc}]" \
--availability-zone-id use1-az3
```


- Any extra challenges faced?
No

***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)