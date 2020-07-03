# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
## Creating Private Routing Table(RT):

aws ec2 create-route-table --vpc-id vpc-0351acfbc7aed9c1f
{
    "RouteTable": {
        "Associations": [], 
        "RouteTableId": "rtb-067a4e39920e79162", 
        "VpcId": "vpc-0351acfbc7aed9c1f", 
        "PropagatingVgws": [], 
        "Tags": [], 
        "Routes": [
            {
                "GatewayId": "local", 
                "DestinationCidrBlock": "172.16.0.0/16", 
                "State": "active", 
                "Origin": "CreateRouteTable"
            }
        ]
    }
}

## Naming routing table as devopsacademy-rt-private

aws ec2 create-tags --resources rtb-067a4e39920e79162 --tags Key=Name,Value=devopsacademy-rt-private

## Creating Public Routing Table:

aws ec2 create-route-table --vpc-id vpc-0351acfbc7aed9c1f
{
    "RouteTable": {
        "Associations": [], 
        "RouteTableId": "rtb-0a58af9fc619fff2d", 
        "VpcId": "vpc-0351acfbc7aed9c1f", 
        "PropagatingVgws": [], 
        "Tags": [], 
        "Routes": [
            {
                "GatewayId": "local", 
                "DestinationCidrBlock": "172.16.0.0/16", 
                "State": "active", 
                "Origin": "CreateRouteTable"
            }
        ]
    }
}

## Naming routing table as devopsacademy-rt-public

aws ec2 create-tags --resources rtb-0a58af9fc619fff2d --tags Key=Name,Value=devopsacademy-rt-public
```

- Commands for associating the route tables with subnets:
```
1.aws ec2 associate-route-table --route-table-id rtb-067a4e39920e79162  --subnet-id subnet-06cf55d01bbed75dc
{
    "AssociationId": "rtbassoc-0214634fd30dc4b25"
}

2: aws ec2 associate-route-table --route-table-id rtb-067a4e39920e79162  --subnet-id subnet-09ab1036f015f0f39
{
    "AssociationId": "rtbassoc-03eb830e0bc1df301"
}

3. aws ec2 associate-route-table --route-table-id rtb-067a4e39920e79162  --subnet-id subnet-0068f18136abefc12
{
    "AssociationId": "rtbassoc-040c613913271b2c3"
}

Public Subnets: 
1.aws ec2 associate-route-table --route-table-id rtb-0a58af9fc619fff2d  --subnet-id subnet-04c9d82c36567dcc6
{
    "AssociationId": "rtbassoc-070da6c65ff4e3fe3"
}

2.aws ec2 associate-route-table --route-table-id rtb-0a58af9fc619fff2d  --subnet-id subnet-0ad9dc31135c0f2d8
{
    "AssociationId": "rtbassoc-023766eeff7505da1"
}

3. aws ec2 associate-route-table --route-table-id rtb-0a58af9fc619fff2d  --subnet-id subnet-05c88eab395f32a51
{
    "AssociationId": "rtbassoc-054060f5d3847395b"
}

```

- Commands for creating the following routes:

|route table|destination|target|
|-|-|-|
|devopsacademy-rt-public|0.0.0.0|`devopsacademy-igw`|
|devopsacademy-rt-private|0.0.0.0|`devopsacademy-ngw`|

```
aws ec2 create-route --route-table-id rtb-0a58af9fc619fff2d --destination-cidr-block 0.0.0.0/0 --gateway-id igw-0b50e51e2cf01b373

{
    "Return": true
}

aws ec2 create-route --route-table-id rtb-067a4e39920e79162 --destination-cidr-block 0.0.0.0/0 --nat-gateway-id nat-0487605ef5aea2e65

{
    "Return": true
}
```

- Answer the following questions:
  - How did you accomplish both instructions?
    ```
    1.Created one private RT and associated with the private subnets .
    2. Create one public RT and associated with the public subnets. 
    3. Route was created to igw (to access over the internet) on public subnet.
    4. Route was created to NAT gateway which allows the internet to the private subnet.

    ```

  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    VPC is like a isolated datacenter and by default it doesnt have any internet access to communicate to the outside world. In order to provide internet access to the workloads(bastion, proxy) on the public subnets we need to create igw with 0.0.0.0 route. 
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    Application and database servers need more security and doesnt need to access from the internet direclty through igw. NAT helps to enable the instance present in the private subnet to connect to the internet.  
    ```
    
  - What is the difference of IGW and NGW?
    ```
    
    IGW helps to enable the instance present in the public subnet to connect to the internet.
    NAT helps to enable the instance present in the private subnet to connect to the internet
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    By default, we can't delete the destination route in our VPC because all subnets in the vpc can communicate with each other. 
    
  - What happens if you do not associate your route table with any subnets?
    ```
    It doesn't serve its purpose.
    ```


- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)