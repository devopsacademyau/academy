# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
$ aws ec2 create-route-table --vpc-id vpc-027019faaf6756407
RouteTable:
  Associations: []
  OwnerId: '097922957316'
  PropagatingVgws: []
  RouteTableId: rtb-0f5b2e7a42466bb7d
  Routes:
  - DestinationCidrBlock: 172.16.0.0/16
    GatewayId: local
    Origin: CreateRouteTable
    State: active
  Tags: []
  VpcId: vpc-027019faaf6756407

$ aws ec2 create-route-table --vpc-id vpc-027019faaf6756407
RouteTable:
  Associations: []
  OwnerId: '097922957316'
  PropagatingVgws: []
  RouteTableId: rtb-052fcb082cda29d1a
  Routes:
  - DestinationCidrBlock: 172.16.0.0/16
    GatewayId: local
    Origin: CreateRouteTable
    State: active
  Tags: []
  VpcId: vpc-027019faaf6756407

$ aws ec2 create-tags --resources rtb-0f5b2e7a42466bb7d --tags Key=Name,Value=devopsacademy-rt-public

$ aws ec2 create-tags --resources rtb-052fcb082cda29d1a --tags Key=Name,Value=devopsacademy-rt-private
```

- Commands for associating the route tables with subnets:
```
$ aws ec2 describe-subnets \
    --filters "Name=tag:Name,Values=public-a,public-b,public-c" \
    --output text \
    --query 'Subnets[*].{Id:SubnetId}' \
    | xargs -I % sh -c "echo Associating route to %; aws ec2 associate-route-table --subnet-id % --route-table-id rtb-0f5b2e7a42466bb7d"

Associating route to subnet-0f82d6e49b9a6dafd
AssociationId: rtbassoc-0ad927a4e3d7ca044
AssociationState:
  State: associated
Associating route to subnet-0299eb6eb289cef54
AssociationId: rtbassoc-076779d3508ab73a8
AssociationState:
  State: associated
Associating route to subnet-00081f8504d5ddc6a
AssociationId: rtbassoc-0b46f602758cb1fba
AssociationState:
  State: associated

$ aws ec2 describe-subnets \
    --filters "Name=tag:Name,Values=private-a,private-b,private-c" \
    --output text \
    --query 'Subnets[*].{Id:SubnetId}' \
    | xargs -I % sh -c "echo Associating route to %; aws ec2 associate-route-table --subnet-id % --route-table-id rtb-052fcb082cda29d1a"

Associating route to subnet-0b24a09de741ecd50
AssociationId: rtbassoc-0b6665c3909e61259
AssociationState:
  State: associated
Associating route to subnet-07b322a0e17706efe
AssociationId: rtbassoc-04347f29b520c222d
AssociationState:
  State: associated
Associating route to subnet-0c5dffc0f45ea6115
AssociationId: rtbassoc-06afe77d97b0d1476
AssociationState:
  State: associated
```

- Commands for creating the following routes:

|route table|destination|target|
|-|-|-|
|devopsacademy-rt-public|0.0.0.0|`devopsacademy-igw`|
|devopsacademy-rt-private|0.0.0.0|`devopsacademy-ngw`|

```
## Public Route
$ aws ec2 create-route \
    --route-table-id rtb-0f5b2e7a42466bb7d \
    --destination-cidr-block 0.0.0.0/0 \
    --gateway-id igw-00a5f1dfa499d2daa

$ aws ec2 describe-route-tables --route-table-id rtb-0f5b2e7a42466bb7d
RouteTables:
- Associations:
  - AssociationState:
      State: associated
    Main: false
    RouteTableAssociationId: rtbassoc-0ad927a4e3d7ca044
    RouteTableId: rtb-0f5b2e7a42466bb7d
    SubnetId: subnet-0f82d6e49b9a6dafd
  - AssociationState:
      State: associated
    Main: false
    RouteTableAssociationId: rtbassoc-0b46f602758cb1fba
    RouteTableId: rtb-0f5b2e7a42466bb7d
    SubnetId: subnet-00081f8504d5ddc6a
  - AssociationState:
      State: associated
    Main: false
    RouteTableAssociationId: rtbassoc-076779d3508ab73a8
    RouteTableId: rtb-0f5b2e7a42466bb7d
    SubnetId: subnet-0299eb6eb289cef54
  OwnerId: '097922957316'
  PropagatingVgws: []
  RouteTableId: rtb-0f5b2e7a42466bb7d
  Routes:
  - DestinationCidrBlock: 172.16.0.0/16
    GatewayId: local
    Origin: CreateRouteTable
    State: active
  - DestinationCidrBlock: 0.0.0.0/0
    GatewayId: igw-00a5f1dfa499d2daa
    Origin: CreateRoute
    State: active
  Tags:
  - Key: Name
    Value: devopsacademy-rt-public
  VpcId: vpc-027019faaf6756407


## Private Route
$ aws ec2 create-route \
    --route-table-id rtb-052fcb082cda29d1a \
    --destination-cidr-block 0.0.0.0/0 \
    --nat-gateway-id nat-031bda4107f3ba82b

$ aws ec2 describe-route-tables --route-table-id rtb-052fcb082cda29d1a
RouteTables:
- Associations:
  - AssociationState:
      State: associated
    Main: false
    RouteTableAssociationId: rtbassoc-06afe77d97b0d1476
    RouteTableId: rtb-052fcb082cda29d1a
    SubnetId: subnet-0c5dffc0f45ea6115
  - AssociationState:
      State: associated
    Main: false
    RouteTableAssociationId: rtbassoc-0b6665c3909e61259
    RouteTableId: rtb-052fcb082cda29d1a
    SubnetId: subnet-0b24a09de741ecd50
  - AssociationState:
      State: associated
    Main: false
    RouteTableAssociationId: rtbassoc-04347f29b520c222d
    RouteTableId: rtb-052fcb082cda29d1a
    SubnetId: subnet-07b322a0e17706efe
  OwnerId: '097922957316'
  PropagatingVgws: []
  RouteTableId: rtb-052fcb082cda29d1a
  Routes:
  - DestinationCidrBlock: 172.16.0.0/16
    GatewayId: local
    Origin: CreateRouteTable
    State: active
  - DestinationCidrBlock: 0.0.0.0/0
    NatGatewayId: nat-031bda4107f3ba82b
    Origin: CreateRoute
    State: active
  Tags:
  - Key: Name
    Value: devopsacademy-rt-private
  VpcId: vpc-027019faaf6756407
```

- Answer the following questions:
  - How did you accomplish both instructions?
    ```
    Route table & Route

    First, I created two route tables for the VPC using the command aws ec2 create-route table. Next, I needed to associate the route tables for each subnet group (public and private). AWS CLI does not provide an instruction to associate a route table for multiple subnets at once but we can accomplish that combining two commands (list subnets + associate route-table) using pipe operator `|`.

    Last, I create a route from destination 0.0.0.0 to IGW on public route-table and NGW on private route-table.
    ```

  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    The route 0.0.0.0 indicates that all traffic must be redirected to IGW. Hence, instances under this subnet with a public IP will be able to access the internet.
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    The route 0.0.0.0 indicates that all traffic must be redirected to NGW. Hence, instances under this subnet will be able to access the internet.
    ```
    
  - What is the difference of IGW and NGW?
    ```
    Both resources allow subnets to access the internet but with a different purpose.
    NGW is mostly used for private subnets where they need to access the internet. It works in one way only (subnet -> internet). In other words, a subnet under NGW can access the internet, but the resource itself cannot be accessed from the internet unless explicitly allowed.
    On the other hand, IGW is mostly used for public subnets where the subnets need to access the internet and vice-versa. Also, each subnet must have a public IP address. 
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    No, you cannot. This is the main route which controls the routing for all subnets that are not explicitly associated.
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    All subnets must have a route table associated. If we do not associate one, AWS will use the default route table.
    ```


- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)