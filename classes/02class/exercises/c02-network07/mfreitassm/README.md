# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
Public
aws ec2 create-route-table --vpc-id vpc-04426efcf5b2228a4
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0641fa494549c97b2",
        "Routes": [
            {
                "DestinationCidrBlock": "10.0.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-04426efcf5b2228a4",
        "OwnerId": "490308117505"
    }
}

aws ec2 create-tags --resources rtb-0641fa494549c97b2 --tags Key=Name,Value=devopsacademy-rt-public


Private
aws ec2 create-route-table --vpc-id vpc-04426efcf5b2228a4
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0ad9c840c31bb6fdd",
        "Routes": [
            {
                "DestinationCidrBlock": "10.0.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-04426efcf5b2228a4",
        "OwnerId": "490308117505"
    }
}

aws ec2 create-tags --resources rtb-0ad9c840c31bb6fdd --tags Key=Name,Value=devopsacademy-rt-private

Route Tables Created
aws ec2 describe-route-tables --filters "Name=vpc-id,Values=vpc-04426efcf5b2228a4" --query "RouteTables[*].{ID: RouteTableId,NAME: Tags[0].Value}"
[
    {
        "ID": "rtb-0641fa494549c97b2",
        "NAME": "devopsacademy-rt-public"
    },
    {
        "ID": "rtb-0ad9c840c31bb6fdd",
        "NAME": "devopsacademy-rt-private"
    }
]

```

- Commands for associating the route tables with subnets:
```
Public
aws ec2 describe-subnets --filters 'Name=tag:Name,Values=public*' --query "Subnets[*].{ID:SubnetId,NAME:Tags[0].Value}"

[
    {
        "ID": "subnet-0dd087be76dd34768",
        "NAME": "public-b"
    },
    {
        "ID": "subnet-0d89ed7884cbc116d",
        "NAME": "public-c"
    },
    {
        "ID": "subnet-0261e9e051f26f2c9",
        "NAME": "public-a"
    }
]

aws ec2 associate-route-table --route-table-id rtb-0641fa494549c97b2 --subnet-id subnet-0261e9e051f26f2c9

{
    "AssociationId": "rtbassoc-02a8fa2eb46ca36b0",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table --route-table-id rtb-0641fa494549c97b2 --subnet-id subnet-0dd087be76dd34768

{
    "AssociationId": "rtbassoc-0d4cd1c7fa6e6fdaf",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table --route-table-id rtb-0641fa494549c97b2 --subnet-id subnet-0d89ed7884cbc116d

{
    "AssociationId": "rtbassoc-044cc1f1f4caf4556",
    "AssociationState": {
        "State": "associated"
    }
}


Private
aws ec2 describe-subnets --filters 'Name=tag:Name,Values=private*' --query "Subnets[*].{ID:SubnetId,NAME:Tags[0].Value}"

[
    {
        "ID": "subnet-0c322e67d4fa55b86",
        "NAME": "private-b"
    },
    {
        "ID": "subnet-025d3b7977221ed27",
        "NAME": "private-c"
    },
    {
        "ID": "subnet-077d95081dbd28d26",
        "NAME": "private-a"
    }
]

aws ec2 associate-route-table --route-table-id rtb-0ad9c840c31bb6fdd --subnet-id subnet-077d95081dbd28d26
{
    "AssociationId": "rtbassoc-0356f37758c444be9",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table --route-table-id rtb-0ad9c840c31bb6fdd --subnet-id subnet-0c322e67d4fa55b86
{
    "AssociationId": "rtbassoc-011acfeb4cc95bcae",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table --route-table-id rtb-0ad9c840c31bb6fdd --subnet-id subnet-025d3b7977221ed27
{
    "AssociationId": "rtbassoc-01b6f1ec7446baefa",
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
creating route IGW
aws ec2 create-route --route-table-id rtb-0641fa494549c97b2 --destination-cidr-block 0.0.0.0/0 --gateway-id igw-05a432e0e12592247
{
    "Return": true
}

Creating ROut NGW
aws ec2 create-route --route-table-id rtb-0ad9c840c31bb6fdd --destination-cidr-block 0.0.0.0/0 --gateway-id nat-08c0c5ed60d56a9d1
{
    "Return": true
}

aws ec2 describe-route-tables

{
    "RouteTables": [
        {
            "Associations": [
                {
                    "Main": true,
                    "RouteTableAssociationId": "rtbassoc-0d41b8bbd8876f667",
                    "RouteTableId": "rtb-01d148637167afcb1",
                    "AssociationState": {
                        "State": "associated"
                    }
                }
            ],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-01d148637167afcb1",
            "Routes": [
                {
                    "DestinationCidrBlock": "10.0.0.0/16",
                    "GatewayId": "local",
                    "Origin": "CreateRouteTable",
                    "State": "active"
                }
            ],
            "Tags": [],
            "VpcId": "vpc-04426efcf5b2228a4",
            "OwnerId": "490308117505"
        },
        {
            "Associations": [
                {
                    "Main": false,
                    "RouteTableAssociationId": "rtbassoc-044cc1f1f4caf4556",
                    "RouteTableId": "rtb-0641fa494549c97b2",
                    "SubnetId": "subnet-0d89ed7884cbc116d",
                    "AssociationState": {
                        "State": "associated"
                    }
                },
                {
                    "Main": false,
                    "RouteTableAssociationId": "rtbassoc-02a8fa2eb46ca36b0",
                    "RouteTableId": "rtb-0641fa494549c97b2",
                    "SubnetId": "subnet-0261e9e051f26f2c9",
                    "AssociationState": {
                        "State": "associated"
                    }
                },
                {
                    "Main": false,
                    "RouteTableAssociationId": "rtbassoc-0d4cd1c7fa6e6fdaf",
                    "RouteTableId": "rtb-0641fa494549c97b2",
                    "SubnetId": "subnet-0dd087be76dd34768",
                    "AssociationState": {
                        "State": "associated"
                    }
                }
            ],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-0641fa494549c97b2",
            "Routes": [
                {
                    "DestinationCidrBlock": "10.0.0.0/16",
                    "GatewayId": "local",
                    "Origin": "CreateRouteTable",
                    "State": "active"
                },
                {
                    "DestinationCidrBlock": "0.0.0.0/0",
                    "GatewayId": "igw-05a432e0e12592247",
                    "Origin": "CreateRoute",
                    "State": "active"
                }
            ],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "devopsacademy-rt-public"
                }
            ],
            "VpcId": "vpc-04426efcf5b2228a4",
            "OwnerId": "490308117505"
        },
        {
            "Associations": [
                {
                    "Main": false,
                    "RouteTableAssociationId": "rtbassoc-01b6f1ec7446baefa",
                    "RouteTableId": "rtb-0ad9c840c31bb6fdd",
                    "SubnetId": "subnet-025d3b7977221ed27",
                    "AssociationState": {
                        "State": "associated"
                    }
                },
                {
                    "Main": false,
                    "RouteTableAssociationId": "rtbassoc-011acfeb4cc95bcae",
                    "RouteTableId": "rtb-0ad9c840c31bb6fdd",
                    "SubnetId": "subnet-0c322e67d4fa55b86",
                    "AssociationState": {
                        "State": "associated"
                    }
                },
                {
                    "Main": false,
                    "RouteTableAssociationId": "rtbassoc-0356f37758c444be9",
                    "RouteTableId": "rtb-0ad9c840c31bb6fdd",
                    "SubnetId": "subnet-077d95081dbd28d26",
                    "AssociationState": {
                        "State": "associated"
                    }
                }
            ],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-0ad9c840c31bb6fdd",
            "Routes": [
                {
                    "DestinationCidrBlock": "10.0.0.0/16",
                    "GatewayId": "local",
                    "Origin": "CreateRouteTable",
                    "State": "active"
                },
                {
                    "DestinationCidrBlock": "0.0.0.0/0",
                    "NatGatewayId": "nat-08c0c5ed60d56a9d1",
                    "Origin": "CreateRoute",
                    "State": "blackhole"
                }
            ],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "devopsacademy-rt-private"
                }
            ],
            "VpcId": "vpc-04426efcf5b2228a4",
            "OwnerId": "490308117505"
        },
        {
            "Associations": [
                {
                    "Main": true,
                    "RouteTableAssociationId": "rtbassoc-b73c61ce",
                    "RouteTableId": "rtb-90ea79f6",
                    "AssociationState": {
                        "State": "associated"
                    }
                }
            ],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-90ea79f6",
            "Routes": [
                {
                    "DestinationCidrBlock": "172.31.0.0/16",
                    "GatewayId": "local",
                    "Origin": "CreateRouteTable",
                    "State": "active"
                },
                {
                    "DestinationCidrBlock": "0.0.0.0/0",
                    "GatewayId": "igw-44a1be20",
                    "Origin": "CreateRoute",
                    "State": "active"
                }
            ],
            "Tags": [],
            "VpcId": "vpc-ac525bcb",
            "OwnerId": "490308117505"
        }
    ]
}
```

- Answer the following questions:
  - How did you accomplish both instructions?
    ```
    Using thoses commands above  by AWS CLI.
    ```

  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    0.0.0.0/0 represents all possible IP addresses. In the context of the way routing tables get set up by default on AWS, 0.0.0.0/0 is effectively "all non local addresses". This is because another route presumably exists in the routing table to route the VPC subnet to the local network on the VPC.
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    0.0.0.0/0 represents all possible IP addresses. In the context of the way routing tables get set up by default on AWS, 0.0.0.0/0 is effectively "all non local addresses". This is because another route presumably exists in the routing table to route the VPC subnet to the local network on the VPC.
    ```
    
  - What is the difference of IGW and NGW?
    ```
	A NAT device forwards traffic from the instances in the private subnet to the internet or other AWS services, and then sends the response back to the instances. It only works one way. The internet at large cannot get through your NAT to your private resources unless you explicitly allow it. While Internet Gateway is used to allow resources in your VPC to access internet. It is not a physical device. Only one can be associated with each VPC.
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    No, because it's a local route and if you delete it then the local machines can't connect to each other in AWS.
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    it will automatically associate with a main route table for the VPC.
    ```


- Any extra challenges faced?
No

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)