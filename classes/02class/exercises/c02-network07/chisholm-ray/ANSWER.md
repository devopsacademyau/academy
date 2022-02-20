# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
tags=(--tag-specifications                     
'ResourceType=route-table,Tags=[
{Key=Name,Value=ccr-dojo-public-rt}     
]') && \
aws ec2 create-route-table --vpc-id vpc-091f1866ec064400e \
"${tags[@]}"

{
    "RouteTables": [
        {
            "Associations": [],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-0ba6e8f589f9c65ec",
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
                    "Value": "ccr-dojo-public-rt"
                }
            ],
            "VpcId": "vpc-091f1866ec064400e",
            "OwnerId": "152848913167"
        }
    ]
}

tags=(--tag-specifications                     
'ResourceType=route-table,Tags=[
{Key=Name,Value=ccr-dojo-private-rt}     
]') && \
aws ec2 create-route-table --vpc-id vpc-091f1866ec064400e \
"${tags[@]}"

{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0ac5c63bcf15d8464",
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
                "Value": "ccr-dojo-private-rt"
            }
        ],
        "VpcId": "vpc-091f1866ec064400e",
        "OwnerId": "152848913167"
    }
}

```

- Commands for associating the route tables with subnets:
```
declare -a subnets=("subnet-0a728ec3b7e79f619" "subnet-0df905a00f2170dd0" "subnet-098dd1b0a811b9c2c")

for i in "${subnets[@]}"
do
  aws ec2 associate-route-table --route-table-id rtb-0ac5c63bcf15d8464 \
  --subnet-id $i \
  | tee /dev/tty
done

declare -a subnets=("subnet-0b2f8b5bb39b96759" "subnet-0b2f8b5bb39b96759" "subnet-00123d58d59d2680a")

for i in "${subnets[@]}"
do
  aws ec2 associate-route-table --route-table-id rtb-0ba6e8f589f9c65ec \
  --subnet-id $i \
  | tee /dev/tty
done
{
    "AssociationId": "rtbassoc-006e926dca6b17d9f",
    "AssociationState": {
        "State": "associated"
    }
}
{
    "AssociationId": "rtbassoc-006e926dca6b17d9f",
    "AssociationState": {
        "State": "associated"
    }
}
{
    "AssociationId": "rtbassoc-006e926dca6b17d9f",
    "AssociationState": {
        "State": "associated"
    }
}
{
    "AssociationId": "rtbassoc-006e926dca6b17d9f",
    "AssociationState": {
        "State": "associated"
    }
}
{
    "AssociationId": "rtbassoc-0eaeebe27c0f4a8d4",
    "AssociationState": {
        "State": "associated"
    }
}
{
    "AssociationId": "rtbassoc-0eaeebe27c0f4a8d4",
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
Private Route
aws ec2 create-route --route-table-id rtb-0ac5c63bcf15d8464 --destination-cidr-block 0.0.0.0/0 --nat-gateway-id nat-09c3b70275101b301
{
    "Return": true
}

Public Route
aws ec2 create-route --route-table-id rtb-0ba6e8f589f9c65ec --destination-cidr-block 0.0.0.0/0 --gateway-id igw-0d56c5e329dae9da4
{
    "Return": true
}
```

- Answer the following questions:
  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    So any network traffic in the public subnets with a destination on the internet is routed to the internet gateway - internet gateway allows access to the internet.
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    network traffic in the private subnets with a destination on the internet needs to be forwarded to the nat gateway - else the private subnets are not private as they would be then public/internet facing. Being behind NAT provides more privacy and security and allows resources with only a private ip address to access internet. 
    ```
    
  - What is the difference of IGW and NGW?
    ```
    internet gateway allows resources with a public IP to access the internet and NAT gateway allows resources with only a private ip address to access the internet 
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    No, else traffic would be dropped as there's no route for local vpc traffic
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    without associating the route tabels to the subnets there would be no access to the internet for public or private subnets as there would be no route telling traffic where to go. 
    ```


- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)