# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
# Creating Subnet: public-a ap-southeast-2a 172.16.10.0/24 vpc-0ab8012d8ba301c77
$ aws ec2 create-subnet \
    --availability-zone ap-southeast-2a \
    --cidr-block 172.16.10.0/24 \
    --vpc-id vpc-0ab8012d8ba301c77 \
    --output text \
    --query 'Subnet.SubnetId' \
    | xargs aws ec2 create-tags \
    --tags Key=Name,Value=public-a \
    --resources

# Creating Subnet: public-b ap-southeast-2b 172.16.11.0/24 vpc-0ab8012d8ba301c77
$ aws ec2 create-subnet \
    --availability-zone ap-southeast-2b \
    --cidr-block 172.16.11.0/24 \
    --vpc-id vpc-0ab8012d8ba301c77 \
    --output text \
    --query 'Subnet.SubnetId' \
    | xargs aws ec2 create-tags \
    --tags Key=Name,Value=public-b \
    --resources

# Creating Subnet: public-c ap-southeast-2c 172.16.12.0/24 vpc-0ab8012d8ba301c77
$ aws ec2 create-subnet \
    --availability-zone ap-southeast-2c \
    --cidr-block 172.16.12.0/24 \
    --vpc-id vpc-0ab8012d8ba301c77 \
    --output text \
    --query 'Subnet.SubnetId' \
    | xargs aws ec2 create-tags \
    --tags Key=Name,Value=public-c \
    --resources

# Creating Subnet: private-a ap-southeast-2a 172.16.20.0/24 vpc-0ab8012d8ba301c77
$ aws ec2 create-subnet \
    --availability-zone ap-southeast-2a \
    --cidr-block 172.16.20.0/24 \
    --vpc-id vpc-0ab8012d8ba301c77 \
    --output text \
    --query 'Subnet.SubnetId' \
    | xargs aws ec2 create-tags \
    --tags Key=Name,Value=private-a \
    --resources

# Creating Subnet: private-b ap-southeast-2b 172.16.21.0/24 vpc-0ab8012d8ba301c77
$ aws ec2 create-subnet \
    --availability-zone ap-southeast-2b \
    --cidr-block 172.16.21.0/24 \
    --vpc-id vpc-0ab8012d8ba301c77 \
    --output text \
    --query 'Subnet.SubnetId' \
    | xargs aws ec2 create-tags \
    --tags Key=Name,Value=private-b \
    --resources

# Creating Subnet: private-c ap-southeast-2c 172.16.22.0/24 vpc-0ab8012d8ba301c77
$ aws ec2 create-subnet \
    --availability-zone ap-southeast-2c \
    --cidr-block 172.16.22.0/24 \
    --vpc-id vpc-0ab8012d8ba301c77 \
    --output text \
    --query 'Subnet.SubnetId' \
    | xargs aws ec2 create-tags \
    --tags Key=Name,Value=private-c \
    --resources
```

### Material Used:

- [Create an IPv4 VPC and subnets using AWS CLI](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-subnets-commands-example.html)

- To help during tests and to clean up the resources created. I created a [bash script](scripts.sh) which execute all commands.

---

- Any extra challenges faced?

    - None

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)