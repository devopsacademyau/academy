# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
> aws ec2 create-route-table --vpc-id vpc-0d4cd22a6e87c698a

  {
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0fd5ed557011acb84",
        "Routes": [
            {
                "DestinationCidrBlock": "10.10.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-0d4cd22a6e87c698a",
        "OwnerId": "823151257518"
    }
  }

> aws ec2 create-tags --resources rtb-0fd5ed557011acb84 --tags Key=Name,Value=devopsacademy-rt-public

> aws ec2 describe-route-tables --route-table-id rtb-0fd5ed557011acb84

  {
    "RouteTables": [
        {
            "Associations": [],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-0fd5ed557011acb84",
            "Routes": [
                {
                    "DestinationCidrBlock": "10.10.0.0/16",
                    "GatewayId": "local",
                    "Origin": "CreateRouteTable",
                    "State": "active"
                }
            ],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "devopsacademy-rt-public"
                }
            ],
            "VpcId": "vpc-0d4cd22a6e87c698a",
            "OwnerId": "823151257518"
        }
    ]
 }

> aws ec2 create-route-table --vpc-id vpc-0d4cd22a6e87c698a

  {
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-03a20d785036313b5",
        "Routes": [
            {
                "DestinationCidrBlock": "10.10.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-0d4cd22a6e87c698a",
        "OwnerId": "823151257518"
    }
  }

> aws ec2 create-tags --resources rtb-03a20d785036313b5 --tags Key=Name,Value=devopsacademy-rt-private

> aws ec2 describe-route-tables --route-table-id rtb-03a20d785036313b5

  {
    "RouteTables": [
        {
            "Associations": [],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-03a20d785036313b5",
            "Routes": [
                {
                    "DestinationCidrBlock": "10.10.0.0/16",
                    "GatewayId": "local",
                    "Origin": "CreateRouteTable",
                    "State": "active"
                }
            ],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "devopsacademy-rt-private"
                }
            ],
            "VpcId": "vpc-0d4cd22a6e87c698a",
            "OwnerId": "823151257518"
        }
    ]
  }

```

- Commands for associating the route tables with subnets:
```
>  aws ec2 associate-route-table --route-table-id rtb-0fd5ed557011acb84 --subnet-id subnet-0ccb8adf5a16bde13

  {
    "AssociationId": "rtbassoc-0fb2d556b5bded335",
    "AssociationState": {
        "State": "associated"
    }
  }

> aws ec2 associate-route-table --route-table-id rtb-0fd5ed557011acb84 --subnet-id subnet-0556c9832d80fb6bc
  
  {
    "AssociationId": "rtbassoc-07e1582dc9e2a78a6",
    "AssociationState": {
        "State": "associated"
    }
  }

> aws ec2 associate-route-table --route-table-id rtb-0fd5ed557011acb84 --subnet-id subnet-0d0623557a39ffd39
  
  {
    "AssociationId": "rtbassoc-0e8c33d1123e48540",
    "AssociationState": {
        "State": "associated"
    }
  }

> aws ec2 associate-route-table --route-table-id rtb-03a20d785036313b5 --subnet-id subnet-0b3e389c94ec4d340
  
  {
    "AssociationId": "rtbassoc-0c73d75df270b56a4",
    "AssociationState": {
        "State": "associated"
    }
  }

> aws ec2 associate-route-table --route-table-id rtb-03a20d785036313b5 --subnet-id subnet-07762642349e66471

  {
    "AssociationId": "rtbassoc-06f0ff3ffaa2404c9",
    "AssociationState": {
        "State": "associated"
    }
  }


>  aws ec2 associate-route-table --route-table-id rtb-03a20d785036313b5 --subnet-id subnet-066d0e3900a53d2b8

  {
    "AssociationId": "rtbassoc-041c3c83b0813f544",
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
>  aws ec2 create-route --route-table-id rtb-0fd5ed557011acb84 --destination-cidr-block 0.0.0.0/0 --gateway-id igw-0d2c772e61b970c7e
 
   {
      "Return": true
    }


> aws ec2 create-route --route-table-id rtb-03a20d785036313b5 --destination-cidr-block 0.0.0.0/0 --nat-gateway-id nat-0c703e1570588ef4d

  {
      "Return": true
  }

```

- Answer the following questions:
  - How did you accomplish both instructions?
    ```
   Internet Gateway already exist. As NAT Gateway was deleted, recreated the NAT Gateway again. 
    ```

  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    0.0.0.0/0 is added to the IGW Public Route table because 0.0.0.0/0 refers to entire IPV4 network. Hence, if the resources in Public subnet didnt find any route internally, it
    will be routed to IGW to go to Internet/outside.
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    All resources in the Private subnet will be routed to 0.0.0.0/0 (entire IPV4 address/ Internet) if there is no local route to route the traffic. 
    Resources in Private network wont have any Public IP, and the route other than local traffic is routed to NAT Gateway to toute it to Internet world. 
    Every Public subnet should have their own NAT GAteway to route traffic to outside world, whereas, there is only one Inetrnet Gateway per VPC. 
    ```
    
  - What is the difference of IGW and NGW?
    ```
    IGW is a logical connection between Amazon VPC and Internet. Attaching an IGW to a VPC allows instances with public IPs to access the internet. 
    If a VPC does not have an Internet Gateway, then the resources in the VPC cannot be accessed from the Internet.

    NGW allows resources in a private subnet (Instances with no Public IP) to access the internet. It works only one way, that is, resources in Internet cant get through NAT gatewayi
    to access private resources. NGW is fully managed service, and need to create one NGW per AZ as NGW wont span AZs. Also, security groups cant be associated with NGW and it is always one way.
    ``
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    No, Default VPC network route has local traffic rules to route local traffic. Hence should not be deleted.
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    There is a value for route table only if this is assocaited. A route table by itself wont be referenced by any resources.
    ```


- Any extra challenges faced?
  Cant say that its a challenge. But the steps to create routes, route table, IGW and NGW are tedious.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network07/README.md)
