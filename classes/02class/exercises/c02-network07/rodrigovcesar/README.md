# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
aws ec2 create-route-table --vpc-id vpc-03f503f58eb9f0512
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0e5f374484d823121",
        "Routes": [
            {
                "DestinationCidrBlock": "10.0.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-03f503f58eb9f0512",
        "OwnerId": "102825027349"
    }
}


aws ec2 create-tags --resources rtb-0e5f374484d823121 --tags Key=Name,Value=devopsacademy-rt-public


aws ec2 create-route-table --vpc-id vpc-03f503f58eb9f0512
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-013716806215ecf49",
        "Routes": [
            {
                "DestinationCidrBlock": "10.0.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-03f503f58eb9f0512",
        "OwnerId": "102825027349"
    }
}

aws ec2 create-tags --resources rtb-013716806215ecf49 --tags Key=Name,Value=devopsacademy-rt-private


```

- Commands for associating the route tables with subnets:
```
aws ec2 describe-subnets --filters "Name=tag:Name,Values=public-a,public-b,public-c" --query 'Subnets[*].SubnetId'
[
    "subnet-07089ca5165659422",
    "subnet-0f271e61d48655e2d",
    "subnet-0556ec1c9f6fc6007"
]


aws ec2 associate-route-table --subnet-id subnet-07089ca5165659422 --route-table-id rtb-0e5f374484d823121
{
    "AssociationId": "rtbassoc-0dd0e787eb40e4021",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table --subnet-id subnet-0f271e61d48655e2d --route-table-id rtb-0e5f374484d823121
{
    "AssociationId": "rtbassoc-0fb46cfb76f5a3a5e",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table --subnet-id subnet-0556ec1c9f6fc6007 --route-table-id rtb-0e5f374484d823121
{
    "AssociationId": "rtbassoc-0b93ac7794e58e4f3",
    "AssociationState": {
        "State": "associated"
    }
}


##Privates

aws ec2 describe-subnets --filters "Name=tag:Name,Values=private-a,private-b,private-c" --query 'Subnets[*].SubnetId'
[
    "subnet-0c8c5ca4ccda507ec",
    "subnet-07ce524a39208f1d8",
    "subnet-0b4a50329fd0bd8e3"
]


aws ec2 associate-route-table --subnet-id subnet-0c8c5ca4ccda507ec --route-table-id rtb-013716806215ecf49
{
    "AssociationId": "rtbassoc-0700fe25afaaa1f2e",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table --subnet-id subnet-07ce524a39208f1d8 --route-table-id rtb-013716806215ecf49
{
    "AssociationId": "rtbassoc-0c737a067df794894",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table --subnet-id subnet-0b4a50329fd0bd8e3 --route-table-id rtb-013716806215ecf49
{
    "AssociationId": "rtbassoc-06e25a66c07a0392e",
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
## Public
aws ec2 create-route --route-table-id rtb-0e5f374484d823121 --destination-cidr-block 0.0.0.0/0 --gateway-id igw-0825d1894af2ed24c
{
    "Return": true
}

## Private

aws ec2 create-route --route-table-id rtb-013716806215ecf49 --destination-cidr-block 0.0.0.0/0 --nat-gateway-id nat-089351075b8a819ed
{
    "Return": true
}



```

- Answer the following questions:
  - How did you accomplish both instructions?
    ```
    Mainly through the AWS docs, also a bit on Plural Sight to understand better the concepts.
    ```

  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
  Because it represents the least specific route, whenever a destination is not explicitly known to the route table it is redirected to the IGW under the 0.0.0.0 address (representing an external resource, all the IPV4 addresses if I am not mistaken in terminology here).
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
  It's the same as the previous answer, it is an external route not known to the route table, so it is redirected to this address, with the difference we are redirecting the traffic to the NAT since this is a private instance for outbound traffic.
    ```
    
  - What is the difference of IGW and NGW?
    ```
    The Internet Gateway is a VPC component and represents a connection between the internet and the VPC itself. Only one can be associated with each VPC.

    NAT gateway enable instances in a private subnet to connect to the internet or other AWS services, but prevent the internet from initiating a connection with those instances. 
    
    Instances in a private subnet that want to access the Internet can have their Internet-bound traffic forwarded to the NAT Instance via a Route Table configuration. The NAT Instance will then make the request to the Internet (since it is in a Public Subnet) and the response will be forwarded back to the private instance. (source https://www.edureka.co/community/2149/aws-vpc-what-is-the-difference-between-internet-gateway-nat).

    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    - No, because it's a local route, otherwise it would cause disruption on the communication between the subnets and the VPC.
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    Nothing. A route table without any associated subnet is not useful. 
    ```


- Any extra challenges faced? I needed to create a new NGW since I deleted the other one in the exercise 6.


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)