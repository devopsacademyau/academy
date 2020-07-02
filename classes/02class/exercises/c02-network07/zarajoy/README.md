# c02-network07

## Commands Execution Output

- Commands for creating the route tables:

https://docs.aws.amazon.com/cli/latest/reference/ec2/create-route-table.html

From previous exercises:

VpcId: vpc-09d2f2719d50d1f7f

InternetGatewayId: igw-062abdced9341d7f8

|SubnetID | Subnet Address | Host Address Range | Public/Private | SubnetID |
|-|-|-|-|-|
|1|192.168.0.0/19|192.168.0.1 - 192.168.31.254|Private-a|subnet-07cd3a9c8c7c3634e|
|2|192.168.32.0/19|192.168.32.1 - 192.168.63.254|Private-b|subnet-078316faa4ed0b47e|
|3|192.168.64.0/19|192.168.64.1 - 192.168.95.254|Private-c|subnet-0dd32a6ae556bf2dc|
|4|192.168.96.0/19|192.168.96.1 - 192.168.127.254|Public-a|subnet-0907f22726c996fd5|
|5|192.168.128.0/19 |192.168.128.1 - 192.168.159.254|Public-b|subnet-0abbcb057289b670d|
|6|192.168.160.0/19|192.168.160.1 - 192.168.191.254|Public-c|subnet-00649d5b0632cc2be|

```
#private route table
z@bacon:~$ aws ec2 create-route-table --vpc-id vpc-09d2f2719d50d1f7f
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0f8fb399d2a29b2fa",
        "Routes": [
            {
                "DestinationCidrBlock": "192.168.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-09d2f2719d50d1f7f",
        "OwnerId": "512742231244"
    }
}
z@bacon:~$ aws ec2 create-tags --resources rtb-0f8fb399d2a29b2fa --tags Key=Name,Value=devopsacademy-rt-private
#public route table
z@bacon:~$ aws ec2 create-route-table --vpc-id vpc-09d2f2719d50d1f7f
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-07a9d3ac37a9cb8e0",
        "Routes": [
            {
                "DestinationCidrBlock": "192.168.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-09d2f2719d50d1f7f",
        "OwnerId": "512742231244"
    }
}
z@bacon:~$ aws ec2 create-tags --resources rtb-07a9d3ac37a9cb8e0 --tags Key=Name,Value=devopsacademy-rt-public
z@bacon:~$ aws ec2 describe-route-tables 
{
    "RouteTables": [
        {
            "Associations": [],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-07a9d3ac37a9cb8e0",
            "Routes": [
                {
                    "DestinationCidrBlock": "192.168.0.0/16",
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
            "VpcId": "vpc-09d2f2719d50d1f7f",
            "OwnerId": "512742231244"
        },
        {
            "Associations": [
                {
                    "Main": true,
                    "RouteTableAssociationId": "rtbassoc-0d8f7ff4ac2245581",
                    "RouteTableId": "rtb-0c01cabc038580d4c",
                    "AssociationState": {
                        "State": "associated"
                    }
                }
            ],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-0c01cabc038580d4c",
            "Routes": [
                {
                    "DestinationCidrBlock": "192.168.0.0/16",
                    "GatewayId": "local",
                    "Origin": "CreateRouteTable",
                    "State": "active"
                }
            ],
            "Tags": [],
            "VpcId": "vpc-09d2f2719d50d1f7f",
            "OwnerId": "512742231244"
        },
        {
            "Associations": [
                {
                    "Main": true,
                    "RouteTableAssociationId": "rtbassoc-145d006d",
                    "RouteTableId": "rtb-02960564",
                    "AssociationState": {
                        "State": "associated"
                    }
                }
            ],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-02960564",
            "Routes": [
                {
                    "DestinationCidrBlock": "172.31.0.0/16",
                    "GatewayId": "local",
                    "Origin": "CreateRouteTable",
                    "State": "active"
                },
                {
                    "DestinationCidrBlock": "0.0.0.0/0",
                    "GatewayId": "igw-01a2bd65",
                    "Origin": "CreateRoute",
                    "State": "active"
                }
            ],
            "Tags": [],
            "VpcId": "vpc-ce545da9",
            "OwnerId": "512742231244"
        },
        {
            "Associations": [],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-0f8fb399d2a29b2fa",
            "Routes": [
                {
                    "DestinationCidrBlock": "192.168.0.0/16",
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
            "VpcId": "vpc-09d2f2719d50d1f7f",
            "OwnerId": "512742231244"
        }
    ]
}

```

- Commands for associating the route tables with subnets:

https://docs.aws.amazon.com/cli/latest/reference/ec2/associate-route-table.html


```
#associate private subnets with private route table
z@bacon:~$ aws ec2 associate-route-table --route-table-id rtb-0f8fb399d2a29b2fa --subnet-id subnet-07cd3a9c8c7c3634e
{
    "AssociationId": "rtbassoc-0ba2e1f6be213f4c7",
    "AssociationState": {
        "State": "associated"
    }
}
z@bacon:~$ aws ec2 associate-route-table --route-table-id rtb-0f8fb399d2a29b2fa --subnet-id subnet-078316faa4ed0b47e
{
    "AssociationId": "rtbassoc-0c7878774eb89e9d0",
    "AssociationState": {
        "State": "associated"
    }
}
z@bacon:~$ aws ec2 associate-route-table --route-table-id rtb-0f8fb399d2a29b2fa --subnet-id subnet-0dd32a6ae556bf2dc
{
    "AssociationId": "rtbassoc-0709dfc26f34376e8",
    "AssociationState": {
        "State": "associated"
    }
}
z@bacon:~$ aws ec2 describe-route-tables --route-table-ids rtb-0f8fb399d2a29b2fa
{
    "RouteTables": [
        {
            "Associations": [
                {
                    "Main": false,
                    "RouteTableAssociationId": "rtbassoc-0709dfc26f34376e8",
                    "RouteTableId": "rtb-0f8fb399d2a29b2fa",
                    "SubnetId": "subnet-0dd32a6ae556bf2dc",
                    "AssociationState": {
                        "State": "associated"
                    }
                },
                {
                    "Main": false,
                    "RouteTableAssociationId": "rtbassoc-0c7878774eb89e9d0",
                    "RouteTableId": "rtb-0f8fb399d2a29b2fa",
                    "SubnetId": "subnet-078316faa4ed0b47e",
                    "AssociationState": {
                        "State": "associated"
                    }
                },
                {
                    "Main": false,
                    "RouteTableAssociationId": "rtbassoc-0ba2e1f6be213f4c7",
                    "RouteTableId": "rtb-0f8fb399d2a29b2fa",
                    "SubnetId": "subnet-07cd3a9c8c7c3634e",
                    "AssociationState": {
                        "State": "associated"
                    }
                }
            ],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-0f8fb399d2a29b2fa",
            "Routes": [
                {
                    "DestinationCidrBlock": "192.168.0.0/16",
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
            "VpcId": "vpc-09d2f2719d50d1f7f",
            "OwnerId": "512742231244"
        }
    ]
}
#associate public subnets with public route table
z@bacon:~$ aws ec2 associate-route-table --route-table-id rtb-07a9d3ac37a9cb8e0 --subnet-id subnet-0907f22726c996fd5
{
    "AssociationId": "rtbassoc-0fef00ef8a9b54683",
    "AssociationState": {
        "State": "associated"
    }
}
z@bacon:~$ aws ec2 associate-route-table --route-table-id rtb-07a9d3ac37a9cb8e0 --subnet-id subnet-0abbcb057289b670d
{
    "AssociationId": "rtbassoc-0e023ca49445d24bf",
    "AssociationState": {
        "State": "associated"
    }
}
z@bacon:~$ aws ec2 associate-route-table --route-table-id rtb-07a9d3ac37a9cb8e0 --subnet-id subnet-00649d5b0632cc2be
{
    "AssociationId": "rtbassoc-0bcdf6dae4c22038c",
    "AssociationState": {
        "State": "associated"
    }
}
z@bacon:~$ aws ec2 describe-route-tables --route-table-ids rtb-07a9d3ac37a9cb8e0
{
    "RouteTables": [
        {
            "Associations": [
                {
                    "Main": false,
                    "RouteTableAssociationId": "rtbassoc-0e023ca49445d24bf",
                    "RouteTableId": "rtb-07a9d3ac37a9cb8e0",
                    "SubnetId": "subnet-0abbcb057289b670d",
                    "AssociationState": {
                        "State": "associated"
                    }
                },
                {
                    "Main": false,
                    "RouteTableAssociationId": "rtbassoc-0bcdf6dae4c22038c",
                    "RouteTableId": "rtb-07a9d3ac37a9cb8e0",
                    "SubnetId": "subnet-00649d5b0632cc2be",
                    "AssociationState": {
                        "State": "associated"
                    }
                },
                {
                    "Main": false,
                    "RouteTableAssociationId": "rtbassoc-0fef00ef8a9b54683",
                    "RouteTableId": "rtb-07a9d3ac37a9cb8e0",
                    "SubnetId": "subnet-0907f22726c996fd5",
                    "AssociationState": {
                        "State": "associated"
                    }
                }
            ],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-07a9d3ac37a9cb8e0",
            "Routes": [
                {
                    "DestinationCidrBlock": "192.168.0.0/16",
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
            "VpcId": "vpc-09d2f2719d50d1f7f",
            "OwnerId": "512742231244"
        }
    ]
}
```

- Commands for creating the following routes:

|route table|destination|target|
|-|-|-|
|devopsacademy-rt-public|0.0.0.0|`devopsacademy-igw`|
|devopsacademy-rt-private|0.0.0.0|`devopsacademy-ngw`|

```
z@bacon:~$ aws ec2 create-route  --route-table-id rtb-07a9d3ac37a9cb8e0  --destination-cidr-block 0.0.0.0/0 --gateway-id igw-062abdced9341d7f8
{
    "Return": true
}
#redo c02-network06 as it states to delete NAT gateway once exercise is complete...
z@bacon:~$ aws ec2 allocate-address --domain vpc
{
    "PublicIp": "13.236.53.110",
    "AllocationId": "eipalloc-0a43fcd6fdd33cd2a",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "ap-southeast-2",
    "Domain": "vpc"
}
z@bacon:~$ aws ec2 create-nat-gateway --subnet-id subnet-00649d5b0632cc2be --allocation-id eipalloc-0a43fcd6fdd33cd2a
{
    "NatGateway": {
        "CreateTime": "2020-07-02T01:22:32.000Z",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-0a43fcd6fdd33cd2a"
            }
        ],
        "NatGatewayId": "nat-0f9b9a9f49bb2ddd7",
        "State": "pending",
        "SubnetId": "subnet-00649d5b0632cc2be",
        "VpcId": "vpc-09d2f2719d50d1f7f"
    }
}
z@bacon:~$ aws ec2 create-tags --resources nat-0f9b9a9f49bb2ddd7 --tags Key=Name,Value=DevopsAcademy-ngw
z@bacon:~$ aws ec2 describe-nat-gateways 
{
    "NatGateways": [
        {
            "CreateTime": "2020-07-02T01:22:32.000Z",
            "NatGatewayAddresses": [
                {
                    "AllocationId": "eipalloc-0a43fcd6fdd33cd2a",
                    "NetworkInterfaceId": "eni-02cd3777735d4f4df",
                    "PrivateIp": "192.168.168.93"
                }
            ],
            "NatGatewayId": "nat-0f9b9a9f49bb2ddd7",
            "State": "pending",
            "SubnetId": "subnet-00649d5b0632cc2be",
            "VpcId": "vpc-09d2f2719d50d1f7f",
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "DevopsAcademy-ngw"
                }
            ]
        }
    ]
}
z@bacon:~$ aws ec2 create-route  --route-table-id rtb-0f8fb399d2a29b2fa  --destination-cidr-block 0.0.0.0/0 --nat-gateway-id nat-0f9b9a9f49bb2ddd7
{
    "Return": true
}

```
- Answer the following questions:

  -How did you accomplish both instructions?
    ```
   attached existing IGW - recreated NATGW as shown in commands
    ```

  Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    The destination for the route is 0.0.0.0/0, which represents all IPv4 addresses
    ```

  Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    like the reasoning for the 0.0.0.0/0 route on iGW, adding 0.0.0.0/0 on the NATGW allows private resources access to all of the ipv4 addesses
    ```
    
  What is the difference of IGW and NGW?
    ```
    An Internet Gateway allows resources within your VPC to access the internet, and the internet to access your public subnet (and its resources)

  NAT Gateway allows resources in a private subnet to access the internet.
  It only works one way. The internet at large cannot get through your NAT to your private resources unless you explicitly allow it. A NAT gateway only exists in a single AZ so for all our 3 private subnets to access internet, we must have a NAT in each AZ.
    ```
    
  Can you delete the destination route to your VPC network? Why?
    ```
     No, every route table has to contain a local route to other resources in the VPC. It is added by default.
    ```
    
  What happens if you do not associate your route table with any subnets?
    ```
    Nothing. It has no rules to follow.
    ```


- Any extra challenges faced?
  ```
  Just having to recreate NAT gateway
  ```


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)