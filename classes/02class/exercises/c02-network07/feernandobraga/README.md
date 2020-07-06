# c02-network07

## Commands Execution Output

- Commands for creating the route tables:

  - ## Public

    ```
    aws ec2 create-route-table --vpc-id vpc-0c50c0a08b2a7dc7e

    response:
    {
        "RouteTable": {
            "Associations": [],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-0e6c480035df5d6a7",
            "Routes": [
                {
                    "DestinationCidrBlock": "192.168.0.0/16",
                    "GatewayId": "local",
                    "Origin": "CreateRouteTable",
                    "State": "active"
                }
            ],
            "Tags": [],
            "VpcId": "vpc-0c50c0a08b2a7dc7e",
            "OwnerId": "667211700992"
        }
    ```

    Renaming the routing table:

    ```
    aws ec2 create-tags --resources rtb-0e6c480035df5d6a7 --tags Key=Name,Value=devopsacademy-rt-public
    ```

  - ## Private

    ```
    aws ec2 create-route-table --vpc-id vpc-0c50c0a08b2a7dc7e

    response:
    {
        "RouteTable": {
            "Associations": [],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-0e0fae42163550983",
            "Routes": [
                {
                    "DestinationCidrBlock": "192.168.0.0/16",
                    "GatewayId": "local",
                    "Origin": "CreateRouteTable",
                    "State": "active"
                }
            ],
            "Tags": [],
            "VpcId": "vpc-0c50c0a08b2a7dc7e",
            "OwnerId": "667211700992"
        }
    }
    ```

    Renaming the routing table:

    ```
    aws ec2 create-tags --resources rtb-0e0fae42163550983 --tags Key=Name,Value=devopsacademy-rt-private
    ```

* Commands for associating the route tables with subnets:

  - ## Public

    ```
    aws ec2 associate-route-table --route-table-id rtb-0e6c480035df5d6a7 --subnet-id subnet-059cef47dffda418b
    response:
    {
        "AssociationId": "rtbassoc-05f98f635a8348a13",
        "AssociationState": {
            "State": "associated"
        }
    }

    aws ec2 associate-route-table --route-table-id rtb-0e6c480035df5d6a7 --subnet-id subnet-065dc1da939f981f6
    response:
    {
        "AssociationId": "rtbassoc-091f53415b8f2eff7",
        "AssociationState": {
            "State": "associated"
        }
    }

    aws ec2 associate-route-table --route-table-id rtb-0e6c480035df5d6a7 --subnet-id subnet-009508e37b719dd77
    response:
    {
        "AssociationId": "rtbassoc-08bbf333e59cf6273",
        "AssociationState": {
            "State": "associated"
        }
    }
    ```

- Commands for creating the following routes:

| route table              | destination | target              |
| ------------------------ | ----------- | ------------------- |
| devopsacademy-rt-public  | 0.0.0.0     | `devopsacademy-igw` |
| devopsacademy-rt-private | 0.0.0.0     | `devopsacademy-ngw` |

```
aws ec2 create-route --route-table-id rtb-0e6c480035df5d6a7 --destination-cidr-block 0.0.0.0/0 --gateway-id igw-06df7843381ed4767
response:
{
    "Return": true
}

aws ec2 create-route --route-table-id rtb-0e0fae42163550983 --destination-cidr-block 0.0.0.0/0 --gateway-id nat-0131db7adc4c2cdc8
response:
{
    "Return": true
}
```

- Answer the following questions:

  - How did you accomplish both instructions?

    ```
    I had to create the NAT gateway again and then attached it to the appropriated routing table and destination.
    ```

  - Why did you add 0.0.0.0 route to the IGW on public route table?

    ```
    This is the default route to any external interface. If the router can't find the destination IP address within the internal network, then it forwards the packet to this default address
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?

    ```
    This is the default route to any external interface. If the router can't find the destination IP address within the internal network, then it forwards the packet to this default address
    ```

  - What is the difference of IGW and NGW?

    ```
    An internet gateway (IGW) is what allows external traffic to/from a VPC.
    A NAT gateway (NGW) allows for instances within a subnet to access the internet, but prevents connections to be initiated from outside the network.
    ```

  - Can you delete the destination route to your VPC network? Why?

    ```
    AWS does not allow you to delete local routes with destination pointing to local VPC, as it contains traffic rules used to route local traffic.

    ```

  - What happens if you do not associate your route table with any subnets?
    ```
    Nothing, it's just "dead weight"
    ```

* Any extra challenges faced?
  ```
  I had to research some stuff about NAT, as I knew the concept but had never done it manually
  ```

---

Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)
