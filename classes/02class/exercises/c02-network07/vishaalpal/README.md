# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
Command:
aws ec2 create-route-table \
  --vpc-id vpc-0e9963972a29d0cc3 \
  --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=devopsacademy-rt-public}]' \
  --region ap-southeast-2

Output:
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-01c09a851f76b14a8",
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
            }
        ],
        "VpcId": "vpc-0e9963972a29d0cc3",
        "OwnerId": "969496245957"
    }
}

Command:
aws ec2 create-route-table \
  --vpc-id vpc-0e9963972a29d0cc3 \
  --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=devopsacademy-rt-private}]' \
  --region ap-southeast-2

Output:
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0c0d75bded925cee3",
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
            }
        ],
        "VpcId": "vpc-0e9963972a29d0cc3",
        "OwnerId": "969496245957"
    }
}
```

- Commands for associating the route tables with subnets:
```
# Associate devopsacademy-rt-public to public subnets
Command: 
aws ec2 associate-route-table \
  --route-table-id rtb-01c09a851f76b14a8 \
  --subnet-id subnet-0fc530aa074c01084 \
  --region ap-southeast-2

Output:
{
    "AssociationId": "rtbassoc-0d4c623fba5b85269",
    "AssociationState": {
        "State": "associated"
    }
}

Command:
aws ec2 associate-route-table \
  --route-table-id rtb-01c09a851f76b14a8 \
  --subnet-id subnet-0f7b048ad6c02bc40 \
  --region ap-southeast-2

Output:
{
    "AssociationId": "rtbassoc-0b484741d0e6397b5",
    "AssociationState": {
        "State": "associated"
    }
}

Command:
aws ec2 associate-route-table \
  --route-table-id rtb-01c09a851f76b14a8 \
  --subnet-id subnet-0d20c852d48328d79 \
  --region ap-southeast-2

Output:
{
    "AssociationId": "rtbassoc-04ef047b0e25d2306",
    "AssociationState": {
        "State": "associated"
    }
}

# Associate devopsacademy-rt-private to private subnets
Command:
aws ec2 associate-route-table \
  --route-table-id rtb-0c0d75bded925cee3 \
  --subnet-id subnet-0334b66f2ca1b1ed8 \
  --region ap-southeast-2

Output:
{
    "AssociationId": "rtbassoc-08387ab1bb2fd1ce7",
    "AssociationState": {
        "State": "associated"
    }
}

Command:
aws ec2 associate-route-table \
  --route-table-id rtb-0c0d75bded925cee3 \
  --subnet-id subnet-053e30b1ddff38020 \
  --region ap-southeast-2

Output:
{
    "AssociationId": "rtbassoc-05eec529c66be14e8",
    "AssociationState": {
        "State": "associated"
    }
}

Command:
aws ec2 associate-route-table \
  --route-table-id rtb-0c0d75bded925cee3 \
  --subnet-id subnet-0ae6959290396e787 \
  --region ap-southeast-2

Output:
{
    "AssociationId": "rtbassoc-06caa2a5e1c4bb721",
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
# Create route to IGW
Commands
aws ec2 create-route \
  --destination-cidr-block 0.0.0.0/0 \
  --gateway-id igw-032d97d397ea78b06 \
  --route-table-id rtb-01c09a851f76b14a8 \
  --region ap-southeast-2

Output:
{
    "Return": true
}

# Create route to NGW
aws ec2 create-route \
  --destination-cidr-block 0.0.0.0/0 \
  --nat-gateway-id nat-000c46964aa7043ae \
  --route-table-id rtb-0c0d75bded925cee3 \
  --region ap-southeast-2

Output:
{
    "Return": true
}
```

- Answer the following questions:
  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
If a subnet is associated with a route table which has a route to an IGW, it is known as a public subnet. 
I added the default route to the IGW on the public route table as this route table is associated with the subnets I want to be public.
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
If a subnet is associated with a route table that does not have a route to an internet gateway, it is known as a private subnet. 
I added the default route to the NGW on the private route table as this route table is associated with the subnets I want to be private. 
    ```
    
  - What is the difference of IGW and NGW?
    ```
An IGW allows communication between resources within your VPC and the internet. It also performs network address translation for instances that have been assigned a public ipv4 adress. 

A public NGW allows communication to the internet from resources within your VPC, however, external services from the internet are not able to initiate a connection with your VPC resources. 

When sending traffic from resources within your VPC to external services on the internet, the NGW replaces the source IP address of the private instances with the EIP of the NGW. Upon receiving return traffic from the internet, the NGW translates the addresses back to the original private source IP addresses.
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
No. Every route table contains a local route for communication within the VPC, this route is added by default to ALL route tables. You CANNOT modify or delete these routes in a subnet route table or in the main route table. 
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
The subnets will refer to the default main route table which is added upon VPC creation. 
    ```


- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)
