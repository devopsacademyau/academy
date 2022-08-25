# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```yaml
# Create public
aws ec2 create-route-table --vpc-id vpc-09b37d389cf1e7937

{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-04b11397c0e9efcc9",
        "Routes": [
            {
                "DestinationCidrBlock": "10.10.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-09b37d389cf1e7937",
        "OwnerId": "152848913167"
    }
}

aws ec2 create-tags --resources rtb-04b11397c0e9efcc9 --tags Key=Name,Value=devopsacademy-rt-public

# Create Private
aws ec2 create-route-table --vpc-id vpc-09b37d389cf1e7937
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0db81fbbe94b86499",
        "Routes": [
            {
                "DestinationCidrBlock": "10.10.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-09b37d389cf1e7937",
        "OwnerId": "152848913167"
    }
}
aws ec2 create-tags --resources rtb-0db81fbbe94b86499 --tags Key=Name,Value=devopsacademy-rt-private
```

- Commands for associating the route tables with subnets:
```yaml
# Public
aws ec2 associate-route-table \
--route-table-id rtb-04b11397c0e9efcc9 \
--subnet-id subnet-08face2dbefdaa808
{
    "AssociationId": "rtbassoc-0200eebd81fa334ab",
    "AssociationState": {
        "State": "associated"
    }
}
aws ec2 associate-route-table \
--route-table-id rtb-04b11397c0e9efcc9 \
--subnet-id subnet-0ef15e9c2428f14ef
{
    "AssociationId": "rtbassoc-0d3ed9c65c73f4181",
    "AssociationState": {
        "State": "associated"
    }
}
aws ec2 associate-route-table \
  --route-table-id rtb-04b11397c0e9efcc9 \
  --subnet-id subnet-0d0f491d94bff88ab
{
    "AssociationId": "rtbassoc-07a4d475e16d793cc",
    "AssociationState": {
        "State": "associated"
    }
}
# Private
aws ec2 associate-route-table \
  --route-table-id rtb-0db81fbbe94b86499 \
  --subnet-id subnet-0bde38b7afdbd6944
{
    "AssociationId": "rtbassoc-09177d7d091c7484d",
    "AssociationState": {
        "State": "associated"
    }
}
aws ec2 associate-route-table \
  --route-table-id rtb-0db81fbbe94b86499 \
  --subnet-id subnet-03b578d034bedba67
{
    "AssociationId": "rtbassoc-094f6e3474bf89726",
    "AssociationState": {
        "State": "associated"
    }
}
aws ec2 associate-route-table \
  --route-table-id rtb-0db81fbbe94b86499 \
  --subnet-id subnet-0ce7ea7d1323b4908
{
    "AssociationId": "rtbassoc-097ce9968c1e6dc3b",
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

```yaml
aws ec2 create-route \
  --route-table-id rtb-04b11397c0e9efcc9 \
  --destination-cidr-block 0.0.0.0/0 \
  --gateway-id igw-0737fb5611732f8a9
{
    "Return": true
}

aws ec2 create-route \
  --route-table-id rtb-0db81fbbe94b86499 \
  --destination-cidr-block 0.0.0.0/0 \
  --gateway-id nat-0fb7961bd3c16eaaa
{
    "Return": true
}
```

- Answer the following questions:
  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    The destination route is 0.0.0.0/0 which represents all ipv4 addresses and is used to forward any traffic to the internet
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    The private subnets do not have access to internet directly so they must go via a NAT gateway in order to make external traffic available. Using 0.0.0.0/0 specifies all ipv4 addresses and so any non-local traffic would be routed via the NAT gateway to the internet.
    ```
    
  - What is the difference of IGW and NGW?
    ```
    Internet Gateways are used for public subnets to access the Internet, NAT Gateways are used for private subnets to access the Internet. NAT Gateways only allow outbound requests to be made from the private subnet, not inbound requests.
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    No, it's the local route and is required for traffic between subnets.
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    It will be automatically used if it is the main route. Otherwise it will not be used.
    ```


- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)