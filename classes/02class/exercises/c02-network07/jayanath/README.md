# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
## create public route table

> aws ec2 create-route-table --vpc-id vpc-007774900b7f4c596

  {
      "RouteTable": {
          "Associations": [],
          "PropagatingVgws": [],
          "RouteTableId": "rtb-03f1869451bdac82a",
          "Routes": [
              {
                  "DestinationCidrBlock": "192.168.0.0/16",
                  "GatewayId": "local",
                  "Origin": "CreateRouteTable",
                  "State": "active"
              }
          ],
          "Tags": [],
          "VpcId": "vpc-007774900b7f4c596",
          "OwnerId": "907095435092"
      }
  }

> aws ec2 create-tags \
    --resources rtb-03f1869451bdac82a \
    --tags Key=Name,Value=devopsacademy-rt-public

## create private route table

> aws ec2 create-route-table --vpc-id vpc-007774900b7f4c596

  {
      "RouteTable": {
          "Associations": [],
          "PropagatingVgws": [],
          "RouteTableId": "rtb-043be3454bd489e40",
          "Routes": [
              {
                  "DestinationCidrBlock": "192.168.0.0/16",
                  "GatewayId": "local",
                  "Origin": "CreateRouteTable",
                  "State": "active"
              }
          ],
          "Tags": [],
          "VpcId": "vpc-007774900b7f4c596",
          "OwnerId": "907095435092"
      }
  }

> aws ec2 create-tags \
    --resources rtb-043be3454bd489e40 \
    --tags Key=Name,Value=devopsacademy-rt-private

```

- Commands for associating the route tables with subnets:
```
## associate public route table with public subnets

> aws ec2 associate-route-table \
    --route-table-id rtb-03f1869451bdac82a \
    --subnet-id subnet-05ba54dadeae3a83c

  {
      "AssociationId": "rtbassoc-03dd17c4f9507c9b7",
      "AssociationState": {
          "State": "associated"
      }
  }

> aws ec2 associate-route-table \
    --route-table-id rtb-03f1869451bdac82a \
    --subnet-id subnet-068196b22d394d652

  {
      "AssociationId": "rtbassoc-03c93b5a6771f96d0",
      "AssociationState": {
          "State": "associated"
      }
  }

> aws ec2 associate-route-table \
    --route-table-id rtb-03f1869451bdac82a \
    --subnet-id subnet-0dd2fb54c9ea5f901

  {
      "AssociationId": "rtbassoc-014ee852b287a295c",
      "AssociationState": {
          "State": "associated"
      }
  }

## associate private route table with private subnets

> aws ec2 associate-route-table \
    --route-table-id rtb-043be3454bd489e40 \
    --subnet-id subnet-0ee93ecd696d65414

  {
      "AssociationId": "rtbassoc-01f9760ec887d5175",
      "AssociationState": {
          "State": "associated"
      }
  }

> aws ec2 associate-route-table \
    --route-table-id rtb-043be3454bd489e40 \
    --subnet-id subnet-0cf2dc519f5bc9a2a

  {
      "AssociationId": "rtbassoc-0353f6cc1cb7ae7e0",
      "AssociationState": {
          "State": "associated"
      }
  }

> aws ec2 associate-route-table \
    --route-table-id rtb-043be3454bd489e40 \
    --subnet-id subnet-0462adf3034ba9204

  {
      "AssociationId": "rtbassoc-02ff139493a5cb206",
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
## add a route to IGW in the public route table

> aws ec2 create-route \
    --route-table-id rtb-03f1869451bdac82a \
    --destination-cidr-block 0.0.0.0/0 \
    --gateway-id igw-0831ac4f89910706b

  {
      "Return": true
  }

## add a route to NGW in the private route table
> aws ec2 create-route \
    --route-table-id rtb-043be3454bd489e40 \
    --destination-cidr-block 0.0.0.0/0 \
    --nat-gateway-id nat-07f98801256171de7

  {
      "Return": true
  }

```

- Answer the following questions:
  - How did you accomplish both instructions?
    ```
    Yes. Had to recreate the NAT gateway as I deleted it right after the exercise 06.
    ```

  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    0.0.0.0/0 is the default route. With that, anything that is not locally routable will go out to IGW.
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    Same as above. Anything that is not locally routable will go out to NGW as 0.0.0.0/0 is the default route.
    ```

  - What is the difference of IGW and NGW?
    ```
    IGW is a VPC component and a VPC could only have a single IGW. They are highly available and redundant by default.
    IGW allows internet routable traffic to go out and performs NAT operations for
    instances with public IPs. Also IGW supports both IPv4 and IPv6 traffic.

    NGW are only scalable in a single AZ, hence multiple NGWs in different AZs are required to maintain redundancy.
    They allows instances in a private subnet to connect to internet or any other AWS service.
    However NGW does not allow external entities to initiate connections into those private instances.
    Also NGW does not support IPv6.

    ```

  - Can you delete the destination route to your VPC network? Why?
    ```
    No. We can't delete it. The destination route is there to route local traffic to the VPC router.

    ```

  - What happens if you do not associate your route table with any subnets?
    ```
    Nothing. A route table without any associated subnet does not serve any purpose.

    ```

- Any extra challenges faced?
```
- Had to create a new NGW :-)
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network07/README.md)