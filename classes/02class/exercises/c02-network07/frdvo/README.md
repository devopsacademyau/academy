# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
#Create public route table
$ aws ec2 create-route-table --vpc-id vpc-0a2b7db4956438d22
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-03acbacd49d5fcb60",
        "Routes": [
            {
                "DestinationCidrBlock": "172.16.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-0a2b7db4956438d22",
        "OwnerId": "165765640813"
    }
}

$ aws ec2 create-tags --tags Key=Name,Value=devopsacademy-rt-public --resources rtb-03acbacd49d5fcb60

$ aws ec2 describe-route-tables --route-table-id rtb-03acbacd49d5fcb60
{
    "RouteTables": [
        {
            "Associations": [],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-03acbacd49d5fcb60",
            "Routes": [
                {
                    "DestinationCidrBlock": "172.16.0.0/16",
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
            "VpcId": "vpc-0a2b7db4956438d22",
            "OwnerId": "165765640813"
        }
    ]
}

#Create private route table
$ aws ec2 create-route-table --vpc-id vpc-0a2b7db4956438d22
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-024a69525b35bfded",
        "Routes": [
            {
                "DestinationCidrBlock": "172.16.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-0a2b7db4956438d22",
        "OwnerId": "165765640813"
    }
}

$ aws ec2 create-tags --tags Key=Name,Value=devopsacademy-rt-private --resources rtb-024a69525b35bfded

$ aws ec2 describe-route-tables --route-table-id rtb-024a69525b35bfded
{
    "RouteTables": [
        {
            "Associations": [],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-024a69525b35bfded",
            "Routes": [
                {
                    "DestinationCidrBlock": "172.16.0.0/16",
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
            "VpcId": "vpc-0a2b7db4956438d22",
            "OwnerId": "165765640813"
        }
    ]
}

```

- Commands for associating the route tables with subnets:
```
#Associate public-a
$ aws ec2 associate-route-table --route-table-id rtb-03acbacd49d5fcb60 --subnet-id subnet-04843486979b4aeb2
{
    "AssociationId": "rtbassoc-0c711e04d5e87d376",
    "AssociationState": {
        "State": "associated"
    }
}

#Associate private-a
$ aws ec2 associate-route-table --route-table-id rtb-024a69525b35bfded --subnet-id subnet-0ba23989d8f1b0768
{
    "AssociationId": "rtbassoc-08333d8ddde69d67c",
    "AssociationState": {
        "State": "associated"
    }
}

#Associate public-b
$ aws ec2 associate-route-table --route-table-id  rtb-03acbacd49d5fcb60 --subnet-id subnet-0dbb2205880974071
{
    "AssociationId": "rtbassoc-0bcb8050a42183c95",
    "AssociationState": {
        "State": "associated"
    }
}

#Associate private-b
$ aws ec2 associate-route-table --route-table-id rtb-024a69525b35bfded --subnet-id subnet-0b9349fa56d76afb7
{
    "AssociationId": "rtbassoc-03b9d5bf5974f1ac8",
    "AssociationState": {
        "State": "associated"
    }
}

#Associate public-c
$ aws ec2 associate-route-table --route-table-id rtb-03acbacd49d5fcb60 --subnet-id subnet-01f6ba32065d77e19
{
    "AssociationId": "rtbassoc-081b79bf9e4cce40e",
    "AssociationState": {
        "State": "associated"
    }
}

#Associate private-c
$ aws ec2 associate-route-table --route-table-id rtb-024a69525b35bfded --subnet-id  subnet-074a113f80e846338
{
    "AssociationId": "rtbassoc-047cf390184c684ab",
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
#devopsacademy-rt-public
$ aws ec2 create-route --route-table-id rtb-03acbacd49d5fcb60 --destination-cidr-block 0.0.0.0/0 --gateway-id igw-0116304685cc6f00b
{
    "Return": true
}

#devopsacademy-rt-private
aws ec2 create-route --route-table-id rtb-024a69525b35bfded --destination-cidr-block 0.0.0.0/0 --nat-gateway-id nat-0ad38ee136b255aab
{
    "Return": true
}

```

- Answer the following questions:
  - How did you accomplish both instructions?
    ```
    Create and public and private route table and assign to the c02-network04 subnets. I also recreate the deleted NAT gateway
    ```

  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    0.0.0.0 means all internet, if the IP is outside the network, IGW you try to reach the IP on Internet using the instance public IP
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ````
    0.0.0.0 means all internet, if the IP is outside the network, NGW you try to reach the IP on Internet using it's own IP and NAT technologies.
    ````  
    
  - What is the difference of IGW and NGW?
    ```
    IGW is to use when you have a instance with public IP that should receive inbound connections. NAT is for instances without external IP that should connect to internet, without expose to the internet.
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    No, this route table is to communicate with other machines inside the VPC.
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    It will be associate with the main route table
    ```


- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network07/README.md)