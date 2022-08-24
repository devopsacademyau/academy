# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
$ aws ec2 create-route-table \
--vpc-id vpc-0d8edf6a0d1104524 \
--tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=devopsacademy-rt-public}]' \
--region us-east-1

{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-094ab76ecca4c3b5a",
        "Routes": [
            {
                "DestinationCidrBlock": "10.88.0.0/16",
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
        "VpcId": "vpc-0d8edf6a0d1104524",
        "OwnerId": "152848913167"
    }
}

$ aws ec2 create-route-table \
--vpc-id vpc-0d8edf6a0d1104524 \
--tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=devopsacademy-rt-private}]' \
--region us-east-1

{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0d9d69ba43692c23d",
        "Routes": [
            {
                "DestinationCidrBlock": "10.88.0.0/16",
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
        "VpcId": "vpc-0d8edf6a0d1104524",
        "OwnerId": "152848913167"
    }
}
```

- Commands for associating the route tables with subnets:
```
$ for a in \
subnet-005acc9c005fd6a97 \
subnet-081154d2a94ce50e8 \
subnet-0efa6d40949e5ab93; \
do \
aws ec2 associate-route-table \
--route-table-id rtb-094ab76ecca4c3b5a \
--subnet-id  $a \
--region us-east-1 ; \
done

{
    "AssociationId": "rtbassoc-091c56ae65d388879",
    "AssociationState": {
        "State": "associated"
    }
}
{
    "AssociationId": "rtbassoc-0ae741308f3404bed",
    "AssociationState": {
        "State": "associated"
    }
}
{
    "AssociationId": "rtbassoc-0b5f8fa1c3c7264bb",
    "AssociationState": {
        "State": "associated"
    }
}

$ for a in \
subnet-04b06cb9a346fc451 \
subnet-0eba4cdd68c757843 \
subnet-006952000ee81815b; \
do \
aws ec2 associate-route-table \
--route-table-id rtb-0d9d69ba43692c23d \
--subnet-id $a \
--region us-east-1; \
done

{
    "AssociationId": "rtbassoc-021f3bec5e3339c0b",
    "AssociationState": {
        "State": "associated"
    }
}
{
    "AssociationId": "rtbassoc-0273aa6b345402c05",
    "AssociationState": {
        "State": "associated"
    }
}
{
    "AssociationId": "rtbassoc-096ccfaea2d7414b6",
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
$ aws ec2 create-route \
--route-table-id rtb-094ab76ecca4c3b5a \
--destination-cidr-block 0.0.0.0/0 \
--gateway-id igw-0ef45e51d478789ef \
--region us-east-1

{
    "Return": true
}

$ aws ec2 create-route \
--route-table-id rtb-0d9d69ba43692c23d \
--destination-cidr-block 0.0.0.0/0 \
--nat-gateway-id nat-052aa76040091599e \
--region us-east-1

{
    "Return": true
}
```

- Answer the following questions:
  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    To allow and route the traffic to internet through Internet gateway.
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    To allow and route the traffic from private subnet/network through NAT gateway. This allows internet access from instances on the private network.
    ```
    
  - What is the difference of IGW and NGW?
    ```
    The Internet Gateway (IGW) works two way: (1) It allows resources (i.e. ec2 instances) within the public subnets to access internet and (2) external resources (i.e instances sitting outside from your network) can communicate to your public subnet using the public address.

    The NGW doing the same as IGW but it only works one way where resources (i.e. instances) in the private subnet can access internet but external resources (i.e instances sitting outside from your network) cannot communicate to the resources in private subnet.
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    No you can't because it would affect the traffic within the subnets.
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    What would happen is that all your resources (i.e. ec2 instances) hosted within that subnets wouldn't be able to communicate to other resources internally and externally network.
    ```


- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)