# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
Add your commands and their outputs here

sam.daymond@contino.io@Sams-MacBook-Pro myacademy % aws ec2 create-route-table --vpc-id vpc-082db14641294a216
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0be1997fadd4c9f77",
        "Routes": [
            {
                "DestinationCidrBlock": "172.16.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-082db14641294a216",
        "OwnerId": "152848913167"
    }
}

sam.daymond@contino.io@Sams-MacBook-Pro myacademy % aws ec2 create-tags --resources rtb-0be1997fadd4c9f77 --tags Key=Name,Value=devopsacademy-rt-public

sam.daymond@contino.io@Sams-MacBook-Pro myacademy % aws ec2 create-route-table --vpc-id vpc-082db14641294a216
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0d48a1042c180df4e",
        "Routes": [
            {
                "DestinationCidrBlock": "172.16.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-082db14641294a216",
        "OwnerId": "152848913167"
    }
}

sam.daymond@contino.io@Sams-MacBook-Pro myacademy % aws ec2 create-tags --resources rtb-0d48a1042c180df4e --tags Key=Name,Value=devopsacademy-rt-private
```

- Commands for associating the route tables with subnets:
```
Add your commands and their outputs here
```

-Public Subnets:

aws ec2 associate-route-table --route-table-id rtb-0be1997fadd4c9f77 --subnet-id subnet-03137b09e2b59edb3  

aws ec2 associate-route-table --route-table-id rtb-0be1997fadd4c9f77 --subnet-id subnet-0fcaa65a0a797a895

aws ec2 associate-route-table --route-table-id rtb-0be1997fadd4c9f77 --subnet-id subnet-04e70b888049d1acc

Private Subnets:

aws ec2 associate-route-table --route-table-id rtb-0d48a1042c180df4e  --subnet-id subnet-0da8dca2ee626f4f9

aws ec2 associate-route-table --route-table-id rtb-0d48a1042c180df4e  --subnet-id subnet-005e757c7a59ea2b7

aws ec2 associate-route-table --route-table-id rtb-0d48a1042c180df4e  --subnet-id subnet-0ae23f7ec3bc3055f

- Commands for creating the following routes:

|route table|destination|target|
|-|-|-|
|devopsacademy-rt-public|0.0.0.0|`devopsacademy-igw`|
|devopsacademy-rt-private|0.0.0.0|`devopsacademy-ngw`|

```
aws ec2 create-route --route-table-id rtb-0be1997fadd4c9f77 --destination-cidr-block 0.0.0.0/0 --gateway-id igw-030783c95c09fb1dd

*I deleted my nat gateway immediately after exercise 6 but the below command should have worked
aws ec2 create-route --route-table-id rtb-0d48a1042c180df4e --destination-cidr-block 0.0.0.0/0 --gateway-id nat-018d91ba3011234ee
```

- Answer the following questions:
  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    this treats table as the default route for all traffic, basically unless traffic is going to another known address it will be routed out of the IGW
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    this treats table as the default route for all traffic, basically unless traffic is going to another known address it will be routed out of the NGW
    ```
    
  - What is the difference of IGW and NGW?
    ```
    IGW allows instances with public IP's to access the internet, NGW perform network address translation for instances withouta public IP
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    No, it would prevent local traffic within a vpc
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    the subnets will use the default route table for the vpc, how that effects the subnets depends on how the default route table is setup
    ```


- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)