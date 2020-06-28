# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
# Create VPC

$ aws ec2 create-vpc \
    --cidr-block 172.16.0.0/16 \
    --no-amazon-provided-ipv6-cidr-block \
    --instance-tenancy default

Vpc:
  CidrBlock: 172.16.0.0/16
  CidrBlockAssociationSet:
  - AssociationId: vpc-cidr-assoc-0749af9d844fac005
    CidrBlock: 172.16.0.0/16
    CidrBlockState:
      State: associated
  DhcpOptionsId: dopt-60210907
  InstanceTenancy: default
  Ipv6CidrBlockAssociationSet: []
  IsDefault: false
  OwnerId: '097922957316'
  State: pending
  VpcId: vpc-0ab8012d8ba301c77

# Set Tag
$ aws ec2 create-tags \
    --tags Key=Name,Value=devopsacademy-vpc \
    --resources vpc-0ab8012d8ba301c77

## Scripts to create subnets

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

# Create Internet Gateway for the public subnets

$ aws ec2 create-internet-gateway
InternetGateway:
  Attachments: []
  InternetGatewayId: igw-084a30d9182d99964
  OwnerId: '097922957316'
  Tags: []

# Attach the IGW to the VPC
$ aws ec2 attach-internet-gateway \
    --vpc-id vpc-0ab8012d8ba301c77 \
    --internet-gateway-id igw-084a30d9182d99964

# Create the route table which will allow connection to IGW
$ aws ec2 create-route-table \
    --vpc-id vpc-0ab8012d8ba301c77
    
RouteTable:
  Associations: []
  OwnerId: '097922957316'
  PropagatingVgws: []
  RouteTableId: rtb-097219c81a1e1c641
  Routes:
  - DestinationCidrBlock: 172.16.0.0/16
    GatewayId: local
    Origin: CreateRouteTable
    State: active
  Tags: []

# Map any external connection to the gateway
$ aws ec2 create-route \
        --route-table-id rtb-097219c81a1e1c641 \
        --destination-cidr-block 0.0.0.0/0 \
        --gateway-id igw-084a30d9182d99964

# Check the routes
$ aws ec2 describe-route-tables --route-table-id rtb-097219c81a1e1c641 
RouteTables:
- Associations: []
  OwnerId: '097922957316'
  PropagatingVgws: []
  RouteTableId: rtb-097219c81a1e1c641
  Routes:
  - DestinationCidrBlock: 172.16.0.0/16
    GatewayId: local
    Origin: CreateRouteTable
    State: active
  - DestinationCidrBlock: 0.0.0.0/0
    GatewayId: igw-084a30d9182d99964
    Origin: CreateRoute
    State: active
  Tags: []
  VpcId: vpc-0ab8012d8ba301c77

# Associate the created routet table to the public subnets

$ aws ec2 describe-subnets \
    --filters "Name=tag:Name,Values=public-a,public-b,public-c" \
    --output text \
    --query 'Subnets[*].{Id:SubnetId}' \
    | xargs -I % sh -c "echo Associating route to %; aws ec2 associate-route-table --subnet-id % --route-table-id rtb-097219c81a1e1c641"

Associating route to subnet-0d0ccd942d0d65099
AssociationId: rtbassoc-00f635cb720a51bc9
AssociationState:
  State: associated
Associating route to subnet-05c30e57750cccbc9
AssociationId: rtbassoc-0f916f423a0a3e22a
AssociationState:
  State: associated
Associating route to subnet-07a8fa273813e36f6
AssociationId: rtbassoc-009db4028ee49bcc7
AssociationState:
  State: associated

# Modify the subnets to map public ip for new nodes inside the public subnets
$ aws ec2 describe-subnets \
    --filters "Name=tag:Name,Values=public-a,public-b,public-c" \
    --output text \
    --query 'Subnets[*].{Id:SubnetId}' \
    | xargs -I % sh -c "echo Modifying subnet to %; aws ec2 modify-subnet-attribute --subnet-id % --map-public-ip-on-launch"
    
Modifying subnet to subnet-0d0ccd942d0d65099
Modifying subnet to subnet-05c30e57750cccbc9
Modifying subnet to subnet-07a8fa273813e36f6  
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