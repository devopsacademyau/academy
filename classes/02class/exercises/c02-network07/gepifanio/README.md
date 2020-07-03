# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
aws ec2 create-route-table --vpc-id vpc-018717ea8ed22e6ae

{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0197b23e7bb554512",
        "Routes": [
            {
                "DestinationCidrBlock": "10.0.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-018717ea8ed22e6ae",
        "OwnerId": "873547843801"
    }
}

aws ec2 create-tags --resources rtb-0197b23e7bb554512 --tags Key=Name,Value=devopsacademy-rt-public


aws ec2 create-route-table --vpc-id vpc-018717ea8ed22e6ae

{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-09c2eb65883c6defd",
        "Routes": [
            {
                "DestinationCidrBlock": "10.0.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-018717ea8ed22e6ae",
        "OwnerId": "873547843801"
    }
}

aws ec2 create-tags --resources rtb-09c2eb65883c6defd --tags Key=Name,Value=devopsacademy-rt-private

```

- Commands for associating the route tables with subnets:
```
aws ec2 associate-route-table --route-table-id rtb-0197b23e7bb554512 --subnet-id subnet-0c341aabdd7fc51d6

{
    "AssociationId": "rtbassoc-047cb0ee73773723f",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table --route-table-id rtb-0197b23e7bb554512 --subnet-id subnet-0300fc4a8e14db404

{
    "AssociationId": "rtbassoc-012b601cf18e65e7a",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table --route-table-id rtb-0197b23e7bb554512 --subnet-id subnet-08e6b80e60766149b

{
    "AssociationId": "rtbassoc-005a23ec5569a5702",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table --route-table-id rtb-09c2eb65883c6defd --subnet-id subnet-0525ca8d01593ccbb

{
    "AssociationId": "rtbassoc-0f67bb80a3e1680aa",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table --route-table-id rtb-09c2eb65883c6defd --subnet-id subnet-0c59e8336e05250f4

{
    "AssociationId": "rtbassoc-0c3abcf80efb89630",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table --route-table-id rtb-09c2eb65883c6defd --subnet-id subnet-0f7a92cd19aafc38f

{
    "AssociationId": "rtbassoc-0ecc52cf3300e6719",
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
aws ec2 create-route --route-table-id rtb-0197b23e7bb554512 --destination-cidr-block 0.0.0.0/0 --gateway-id igw-00c6919aea3d2a973

{
    "Return": true
}

aws ec2 create-route --route-table-id rtb-09c2eb65883c6defd --destination-cidr-block 0.0.0.0/0
--nat-gateway-id nat-0fbe2a7f66cdb2924

An error occurred (MissingParameter) when calling the CreateRoute operation: The request must contain exactly one of gatewayId, natGatewayId, networkInterfaceId, vpcPeeringConnectionId, egressOnlyInternetGatewayId, transitGatewayId, localGatewayId or instanceId

I have deleted my NAT gateway which caused this problem.

```

- Answer the following questions:
  - How did you accomplish both instructions?
    ```
    Looking in the aws documentation about the commands, how to create a routing table, using the tags from the previous exercises to add name in the resources, and searching how to create route into a route table.
    ```

  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    To allow all ip address of the subnets and instances to access the internet

    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```

    To enable the private network to access the internet using public IP address that is attached to the NAT gateway.


    ```
    
  - What is the difference of IGW and NGW?
    ```

    An Internet Gateway (IGW) is a logical connection between an Amazon VPC and the Internet. It is not a physical device. Only one can be associated with each VPC. It does not limit the bandwidth of Internet connectivity. (The only limitation on bandwidth is the size of the Amazon EC2 instance, and it applies to all traffic — internal to the VPC and out to the Internet.)
    If a VPC does not have an Internet Gateway, then the resources in the VPC cannot be accessed from the Internet (unless the traffic flows via a corporate network and VPN/Direct Connect).
    An Internet Gateway allows resources within your VPC to access the internet, and vice versa. In order for this to happen, there needs to be a routing table entry allowing a subnet to access the IGW.
    That is to say — an IGW allows resources within your public subnet to access the internet, and the internet to access said resources.
    A subnet is deemed to be a Public Subnet if it has a Route Table that directs traffic to the Internet Gateway.

    A NAT Gateway does something similar, but with two main differences:
    It allows resources in a private subnet to access the internet (think yum updates, external database connections, wget calls, OS patch, etc)
    It only works one way. The internet at large cannot get through your NAT to your private resources unless you explicitly allow it.

    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    No, because the subnets and the routes are all going through the VPC, and if I delete it, is not gonna work.
    
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    The subnets will not be able to communicate with the IGW and NGW for instance in our exercise, only between themselves. 

    ```


- Any extra challenges faced?

Yes, it required a lot of research and understanding of the AWS networking, which is great.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)