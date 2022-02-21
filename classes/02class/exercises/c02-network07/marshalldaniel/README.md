# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
aws ec2 create-route-table \
  --vpc-id vpc-0a002c0e5a418e381 \
  --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=devopsacademy-rt-public},{Key=CreatedBy,Value=DMarshall}]' \
  --region ap-southeast-1

{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0b5e51fa2b519e99d",
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
                "Value": "devopsacademy-rt-public"
            },
            {
                "Key": "CreatedBy",
                "Value": "DMarshall"
            }
        ],
        "VpcId": "vpc-0a002c0e5a418e381",
        "OwnerId": "152848913167"
    }
}

aws ec2 create-route-table \
  --vpc-id vpc-0a002c0e5a418e381 \
  --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=devopsacademy-rt-private},{Key=CreatedBy,Value=DMarshall}]' \
  --region ap-southeast-1

{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0331c9b22bf75c214",
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
                "Value": "devopsacademy-rt-private"
            },
            {
                "Key": "CreatedBy",
                "Value": "DMarshall"
            }
        ],
        "VpcId": "vpc-0a002c0e5a418e381",
        "OwnerId": "152848913167"
    }
}

```

- Commands for associating the route tables with subnets:
```
aws ec2 associate-route-table \
  --route-table-id rtb-0b5e51fa2b519e99d \
  --subnet-id subnet-0e9f13962485ddfe9 \
  --region ap-southeast-1
{
    "AssociationId": "rtbassoc-0855a6e79893a26ce",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table \
  --route-table-id rtb-0b5e51fa2b519e99d \
  --subnet-id subnet-0c32a003ef9ed998f \
  --region ap-southeast-1
{
    "AssociationId": "rtbassoc-0e8254c927d539d50",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table \
  --route-table-id rtb-0b5e51fa2b519e99d \
  --subnet-id subnet-01c0de16779d7b063 \
  --region ap-southeast-1
{
    "AssociationId": "rtbassoc-00acec1770f0434c7",
    "AssociationState": {
        "State": "associated"
    }
}



aws ec2 associate-route-table \
  --route-table-id rtb-0331c9b22bf75c214 \
  --subnet-id subnet-014271f4eb5ba8d27 \
  --region ap-southeast-1

aws ec2 associate-route-table \
  --route-table-id rtb-0331c9b22bf75c214 \
  --subnet-id subnet-01350473399c087ad \
  --region ap-southeast-1

aws ec2 associate-route-table \
  --route-table-id rtb-0331c9b22bf75c214 \
  --subnet-id subnet-09570cdf39d20a371 \
  --region ap-southeast-1

{
    "AssociationId": "rtbassoc-0c32fe7138154a0e7",
    "AssociationState": {
        "State": "associated"
    }
}
{
    "AssociationId": "rtbassoc-051a07eff9d1130b9",
    "AssociationState": {
        "State": "associated"
    }
}
{
    "AssociationId": "rtbassoc-0ee7b0aca5209cee3",
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
aws ec2 create-route \
  --destination-cidr-block 0.0.0.0/0 \
  --gateway-id igw-0520dee4cc6a48efc \
  --route-table-id rtb-0b5e51fa2b519e99d \
  --region ap-southeast-1
{
    "Return": true
}

aws ec2 create-route \
  --destination-cidr-block 0.0.0.0/0 \
  --nat-gateway-id nat-042fd88a5655be00a \
  --route-table-id rtb-0331c9b22bf75c214 \
  --region ap-southeast-1
{
    "Return": true
}
```

- Answer the following questions:
  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    To provide a default route to resources using that route table. The default route uses the IGW to forward the traffic to the internet.
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    To provide a default route to resources using that route table. The default route uses the NAT Gateway to forward the traffic to the internet.
    ```
    
  - What is the difference of IGW and NGW?
    ```
    An IGW forwards traffic to the internet without performing any network address translation, so an EC2 instance for example will need to have a public IP address assigned to it, to be able to access the internet using an IGW. A NAT Gateway performs network address translation prior to forwarding traffic to the IGW, so an EC2 instance does NOT need to have a public IP address assigned to be able to access the internet, when using this.
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    Yes - this can be done if you do not want to have a default route. Only address destinations which reside in the known routes will be sent through the gateway.
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    No resources will use the routes assigned to the route table. By default, a route table is created and assigned to the VPC, which is then used by all of it's subnets, unless another route table is explicitly associated to it.
    ```


- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)