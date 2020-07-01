# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
### ---------Route table for public subnets-----------------------------
aws ec2 create-route-table \
 --vpc-id vpc-081afcee350babdf5
>The command returns:
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-068b99ba337982448",
        "Routes": [
            {
                "DestinationCidrBlock": "172.16.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-081afcee350babdf5",
        "OwnerId": "438549961569"
    }
}
 aws ec2 create-tags \
  --resources rtb-068b99ba337982448  \
  --tags Key=Name,Value=devopsacademy-rt-public

### --------Route table for private subnets-----------------------------
aws ec2 create-route-table \
 --vpc-id vpc-081afcee350babdf5
>The command returns:
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0be3314a7ac571297",
        "Routes": [
            {
                "DestinationCidrBlock": "172.16.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-081afcee350babdf5",
        "OwnerId": "438549961569"
    }
}
aws ec2 create-tags  \
--resources rtb-0be3314a7ac571297  --tags Key=Name,Value=devopsacademy-rt-private

```

- Commands for associating the route tables with subnets:
```
### -----------Public Subnets-Route table-----------------------------
aws ec2 associate-route-table \
--route-table-id rtb-068b99ba337982448 \
--subnet-id subnet-062c79f06460c35c1
{
    "AssociationId": "rtbassoc-0856a2a5f433452e7",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table \
--route-table-id rtb-068b99ba337982448 \
--subnet-id subnet-03bbda2e7e877d1fb
{
    "AssociationId": "rtbassoc-0166bae5e793884cf",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table \
--route-table-id rtb-068b99ba337982448 \
--subnet-id subnet-01f03b15624652fc3
{
    "AssociationId": "rtbassoc-0b88855fde47695a9",
    "AssociationState": {
        "State": "associated"
    }
}

### -----------Private Subnets-Route table-----------------------------
aws ec2 associate-route-table \
--route-table-id rtb-0be3314a7ac571297 \
--subnet-id subnet-04abf35901ad7a22a
{
    "AssociationId": "rtbassoc-0edc102ba2a3b3a00",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table \
--route-table-id rtb-0be3314a7ac571297 \
--subnet-id subnet-07a6d5aa2747fa2c2
{
    "AssociationId": "rtbassoc-04a3159a86cfd741e",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table \
--route-table-id rtb-0be3314a7ac571297 \
--subnet-id subnet-01012aa11829f1b88
{
    "AssociationId": "rtbassoc-0fd72747588243f24",
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

aws ec2 create-route /
 --route-table-id rtb-068b99ba337982448 /
 --destination-cidr-block 0.0.0.0/0 /
 --gateway-id igw-036a26c6352dfb84f

aws ec2 create-route /
 --route-table-id rtb-0be3314a7ac571297 /
 --destination-cidr-block 0.0.0.0/0 /
 --gateway-id nat-07e041dcaef2485c0

```
Add your commands and their outputs here
```

- Answer the following questions:
  - How did you accomplish both instructions?
    ```
    By recreating NAT gateway after deletion in the last exercise and finding commands in the AWS documentation.
    ```

  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    The public subnets can have direct access to the whole Internet through the gateway.It just means that the destination for the route is 0.0.0.0/0, which represents all IPv4 addresses.
    
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    The private route table associated subnets will not have direct access to the internet.They need to be routed to the NAT gateway present on public subnets and through this they can access the Internet.Adding 0.0.0.0 means that the destination for the route is 0.0.0.0/0, which represents all IPv4 addresses.
    
    ```
    
  - What is the difference of IGW and NGW?
    ```
    An Internet Gateway (IGW) is a logical connection between an Amazon VPC and the Internet.An Internet Gateway allows resources within your VPC to access the internet, and vice versa[provided route tables are configured].Only one can be associated with each VPC. 
    
    NAT Gateway allows resources in a private subnet to access the internet.It only works one way. The internet at large cannot get through your NAT to your private resources unless you explicitly allow it.
    You'll need one in each AZ since they only operate in a single AZ

 
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    No, the destination route to the VPC network cannot be deleted .It is for locally routable traffic
     
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    Nothing happens. Route table by itself wont be of much use if not associated with any subnets
    
    ```


- Any extra challenges faced? 
Creating the NAT Gateway and finding commands for routes.


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)
