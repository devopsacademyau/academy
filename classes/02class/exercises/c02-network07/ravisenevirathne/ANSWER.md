# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
aws ec2 create-route-table \
    --vpc-id 	vpc-09b37d389cf1e7937 \
    --tag-specifications "ResourceType=route-table,Tags=[{Key=Name,Value=devopsacademy-rt-public-Ravi}]"

{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-08c1f9d2547e53bee",
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
                "Value": "devopsacademy-rt-public-Ravi"
            }
        ],
        "VpcId": "vpc-09b37d389cf1e7937",
        "OwnerId": "152848913167"
    }
}

aws ec2 create-route-table \
    --vpc-id 	vpc-09b37d389cf1e7937 \
    --tag-specifications "ResourceType=route-table,Tags=[{Key=Name,Value=devopsacademy-rt-private-Ravi}]"

{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-02f5ee18322f2e076",
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
                "Value": "devopsacademy-rt-private-Ravi"
            }
        ],
        "VpcId": "vpc-09b37d389cf1e7937",
        "OwnerId": "152848913167"
    }
}

```

- Commands for associating the route tables with subnets:
```
aws ec2 associate-route-table \
    --route-table-id rtb-08c1f9d2547e53bee \
    --subnet-id subnet-00683b41e4c5abc2f \
    --subnet-id subnet-0065f35ae776589fc

{
    "AssociationId": "rtbassoc-0f916e3a11487b3c3",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table \
    --route-table-id rtb-08c1f9d2547e53bee \
    --subnet-id subnet-00683b41e4c5abc2f
{
    "AssociationId": "rtbassoc-0c4e77d80435f0d70",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table \
    --route-table-id rtb-08c1f9d2547e53bee \
    --subnet-id subnet-00683b41e4c5abc2f
{
    "AssociationId": "rtbassoc-003385324699d53d8",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table \
    --route-table-id rtb-02f5ee18322f2e076 \
    --subnet-id subnet-0bdd0e96fc5faab89

aws ec2 associate-route-table \
    --route-table-id rtb-02f5ee18322f2e076 \
    --subnet-id subnet-0463f77a3449970a8

aws ec2 associate-route-table \
    --route-table-id rtb-02f5ee18322f2e076 \
    --subnet-id subnet-08128ac68483f4041
```

- Commands for creating the following routes:

|route table|destination|target|
|-|-|-|
|devopsacademy-rt-public|0.0.0.0|`devopsacademy-igw`|
|devopsacademy-rt-private|0.0.0.0|`devopsacademy-ngw`|

```
aws ec2 create-route \
  --route-table-id rtb-08c1f9d2547e53bee \
  --destination-cidr-block 0.0.0.0/0 \
  --gateway-id igw-02ee3289d87d80468
{
    "Return": true
}

aws ec2 create-route \
  --route-table-id rtb-02f5ee18322f2e076 \
  --destination-cidr-block 0.0.0.0/0 \
  --gateway-id nat-0afeb25e252dfc517
{
    "Return": true
}
```

- Answer the following questions:
  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    This is called default route and it is required to forward any traffic to the internet.
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    Adding default route to NGW allows internal resources in private subnets to reach internet. When using NAT gateway to send traffic to outside of VPC, only internal resources can initiate the connection. 
    ```
    
  - What is the difference of IGW and NGW?
    ```
    IGW allows resources in public subnets to access the internet. NGW allow resources in private subnets to access internet using NATing. NGW masquerades the private requests to the internet.
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    cannot delete destination route but you can change it to different destination
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    There will be no effect to network traffic flow. If there's no explicit routing table, the main routing table is used by default. 
    ```


- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)