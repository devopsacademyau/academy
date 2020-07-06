# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
aws ec2 create-subnet \
--availability-zone ap-southeast-2a \
--cidr-block 10.0.0.0/19 \
--vpc-id vpc-03f503f58eb9f0512 \
--output text \
--query 'Subnet.SubnetId' \
| xargs aws ec2 create-tags \
--tags Key=Name,Value=public-a \
--resources


aws ec2 create-subnet \
--availability-zone ap-southeast-2a \
--cidr-block 10.0.32.0/19 \
--vpc-id vpc-03f503f58eb9f0512 \
--output text \
--query 'Subnet.SubnetId' \
| xargs aws ec2 create-tags \
--tags Key=Name,Value=private-a \
--resources


aws ec2 create-subnet \
--availability-zone ap-southeast-2b \
--cidr-block 10.0.64.0/19 \
--vpc-id vpc-03f503f58eb9f0512 \
--output text \
--query 'Subnet.SubnetId' \
| xargs aws ec2 create-tags \
--tags Key=Name,Value=public-b \
--resources

aws ec2 create-subnet \
--availability-zone ap-southeast-2b \
--cidr-block 10.0.96.0/19 \
--vpc-id vpc-03f503f58eb9f0512 \
--output text \
--query 'Subnet.SubnetId' \
| xargs aws ec2 create-tags \
--tags Key=Name,Value=private-b \
--resources


aws ec2 create-subnet \
--availability-zone ap-southeast-2c \
--cidr-block 10.0.128.0/19 \
--vpc-id vpc-03f503f58eb9f0512 \
--output text \
--query 'Subnet.SubnetId' \
| xargs aws ec2 create-tags \
--tags Key=Name,Value=public-c \
--resources

aws ec2 create-subnet \
--availability-zone ap-southeast-2c \
--cidr-block 10.0.160.0/19 \
--vpc-id vpc-03f503f58eb9f0512 \
--output text \
--query 'Subnet.SubnetId' \
| xargs aws ec2 create-tags \
--tags Key=Name,Value=private-c \
--resources

```

- Any extra challenges faced?
I guess to undesrtand the query a bit and put the tags on the same command. I need to explore this more. For the creation of the subnet was pretty straight forward, just looking the main guide in the docs.


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)