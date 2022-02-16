# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
$ aws ec2 create-route-table --vpc-id vpc-09666fb121d6ae087 --tag-specifications "ResourceType=route-table,Tags=[{Key=Name,Value=public-rt}]"
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-02e4a076bd583fa77",
        "Routes": [
            {
                "DestinationCidrBlock": "10.0.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [
            {
                "Key": "Name",
                "Value": "public-rt"
            }
        ],
        "VpcId": "vpc-09666fb121d6ae087",
        "OwnerId": "639247960747"
    }
}

$ aws ec2 create-route-table --vpc-id vpc-09666fb121d6ae087 --tag-specifications "ResourceType=route-table,Tags=[{Key=Name,Value=private-rt}]"
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0f6176a4145150dc8",
        "Routes": [
            {
                "DestinationCidrBlock": "10.0.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [
            {
                "Key": "Name",
                "Value": "private-rt"
            }
        ],
        "VpcId": "vpc-09666fb121d6ae087",
        "OwnerId": "639247960747"
    }
}
```

- Commands for associating the route tables with subnets:
```
$ aws ec2 associate-route-table --route-table-id rtb-02e4a076bd583fa77 --subnet-id subnet-087f588f03b7ad0c1
{
    "AssociationId": "rtbassoc-0e7fd67e45f0affb3",
    "AssociationState": {
        "State": "associated"
    }
}
$ aws ec2 associate-route-table --route-table-id rtb-02e4a076bd583fa77 --subnet-id subnet-0107b34e3b96bb976
{
    "AssociationId": "rtbassoc-0f9ab2c46caf76904",
    "AssociationState": {
        "State": "associated"
    }
}
$ aws ec2 associate-route-table --route-table-id rtb-02e4a076bd583fa77 --subnet-id subnet-06eefdc5343faf87a
{
    "AssociationId": "rtbassoc-0f3f0767e17bde3e9",
    "AssociationState": {
        "State": "associated"
    }
}

$ aws ec2 associate-route-table --route-table-id rtb-0f6176a4145150dc8 --subnet-id subnet-0a05ed9c8336c5f07
{
    "AssociationId": "rtbassoc-0b96a4378f6cdc489",
    "AssociationState": {
        "State": "associated"
    }
}
$ aws ec2 associate-route-table --route-table-id rtb-0f6176a4145150dc8 --subnet-id subnet-0821e0f8c96cb9e26
{
    "AssociationId": "rtbassoc-025ee68bba3d19b53",
    "AssociationState": {
        "State": "associated"
    }
}
$ aws ec2 associate-route-table --route-table-id rtb-0f6176a4145150dc8 --subnet-id subnet-0c6b1ac3ae8ee39a3
{
    "AssociationId": "rtbassoc-016dd7cdb4711de10",
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
$ aws ec2 create-route --route-table-id rtb-02e4a076bd583fa77 --destination-cidr-block 0.0.0.0/0 --gateway-id igw-0b81c8807adff0ac7
{
    "Return": true
}
aws ec2 create-route --route-table-id rtb-0f6176a4145150dc8 --destination-cidr-block 0.0.0.0/0 --gateway-id nat-0f46d7abd2b989005
{
    "Return": true
}
```

- Answer the following questions:
  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    0.0.0.0 is the default route (ie. any traffic destined to a network that is not specified in another route table entry will be routed via the default route)
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    Traffic in the private subnets should be NATed to remain private: You can use a NAT gateway so that instances in a private subnet can connect to services outside your VPC but external services cannot initiate a connection with those instances. 
    ```
    
  - What is the difference of IGW and NGW?
    ```
    Internet gateways allow instaces with a public IP address access to the internet, a NAT gateway allows instances without a public IP address access to the internet (via NAT).
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    You cannot, you can only charge the target. This route defines where intra-VPC traffic is routed (ie. traffic between subnets within the VPC). You can only change the target of this route, for example under scenarios where a firewall appliance may take care of routing. 
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    The route table has no effect, it must be assosciated with subnets. 
    ```


- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)