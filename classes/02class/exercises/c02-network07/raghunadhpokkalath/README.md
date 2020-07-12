# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```

> aws ec2 create-route-table --vpc-id vpc-076a05ec0f3be4895
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-07198d403580f4358",
        "Routes": [
            {
                "DestinationCidrBlock": "10.0.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-076a05ec0f3be4895",
        "OwnerId": "361529347535"
    }
}
Tag Route Table as Public Route
> aws ec2 create-tags --resources rtb-07198d403580f4358 --tags Key=Name,Value=devopsacademy-rt-public


Create a second route table
> aws ec2 create-route-table --vpc-id vpc-076a05ec0f3be4895
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0e176ce823d9313dd",
        "Routes": [
            {
                "DestinationCidrBlock": "10.0.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-076a05ec0f3be4895",
        "OwnerId": "361529347535"
    }
}

Tag Route Table as Private Route
> aws ec2 create-tags --resources rtb-0e176ce823d9313dd --tags Key=Name,Value=devopsacademy-rt-private

```

- Commands for associating the route tables with subnets:
```
Associate All Public subnets  with public route table

> aws ec2 associate-route-table --route-table-id rtb-07198d403580f4358 --subnet-id subnet-0ff0ad4440d0df64e
{
    "AssociationId": "rtbassoc-0933ac4ba13913bdd",
    "AssociationState": {
        "State": "associated"
    }
}

> aws ec2 associate-route-table --route-table-id rtb-07198d403580f4358 --subnet-id subnet-0f3eb7a49a103114e

{
    "AssociationId": "rtbassoc-0cab2235fd12c8b91",
    "AssociationState": {
        "State": "associated"
    }
}

> aws ec2 associate-route-table --route-table-id rtb-07198d403580f4358 --subnet-id subnet-0b2095e1b5117df04

{
    "AssociationId": "rtbassoc-0769b8e88fb8c10b8",
    "AssociationState": {
        "State": "associated"
    }
}

Associate All Private subnets  with private route table
> aws ec2 associate-route-table --route-table-id rtb-0e176ce823d9313dd --subnet-id subnet-0b93b57d95a2de8d4
{
    "AssociationId": "rtbassoc-0bd5485e2775fd543",
    "AssociationState": {
        "State": "associated"
    }
}
> aws ec2 associate-route-table --route-table-id rtb-0e176ce823d9313dd --subnet-id subnet-0b76d0885b48f0cfa
{
    "AssociationId": "rtbassoc-0d6ffaba689efbcd9",
    "AssociationState": {
        "State": "associated"
    }
}
> aws ec2 associate-route-table --route-table-id rtb-0e176ce823d9313dd --subnet-id subnet-0e22678e3713193d2
{
    "AssociationId": "rtbassoc-0f19da863a5507368",
    "AssociationState": {
        "State": "associated"
    }
}
```

- Commands for creating the following routes:

|route table|destination|target|
|-|-|-|
|devopsacademy-rt-public|0.0.0.0|`devopsacademy-igw`|
|devopsacademy-rt-private|0.0.0.0|`devopsacademy-ngw`|
```
> aws ec2 create-route --route-table-id rtb-07198d403580f4358 --destination-cidr-block 0.0.0.0/0 --gateway-id igw-0bd0e5665974cd6f0	
{
    "Return": true
}

> aws ec2 create-route --route-table-id 

rtb-0e176ce823d9313dd --destination-cidr-block 0.0.0.0/0 --gateway-id nat-0601de07182584795
{
    "Return": true
}
```

- Answer the following questions:
  - How did you accomplish both instructions?
    ```
    Recreated the NAT gateway to add route as nat gateway deleted after Lab6
    ```

  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    0.0.0.0/0 represents all possible IP addresses which are non local adress.Calls which are not matching to local route will be routed to IGW
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    Private Subnet cant access interent directly we use NAT gateway in public subnet to achieve this . 0.0.0.0/0 represents all possible IP addresses which are non local adress.Calls which are not matching to local route will be routed to Nat gateway for internet access.
    ```
    
  - What is the difference of IGW and NGW?
    ```
     IGW to used by instance in public subnet to access the interenet .NGW allow instance from private subnet to connect to internet using NGW in public subnet 
    Nat Gateway works only one way we can connect to interent but interent cannot get through your NAT to your private resources unless you explicitly allow it
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
     You cant delete the destination route .This is the  local route used by VPC for communication and cant modify or delete
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
     Nothing will happen, the custom route table won't be used. By default, all the subnets are implicitly associated with the main route table.    
    ```


- Any extra challenges faced?
```
Had to recreate NGW as it was deleted after the lab6
```
<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)