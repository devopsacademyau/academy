# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
$ aws ec2 create-route-table \
    --vpc-id vpc-0721e28436cea8410

{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0509a3a7e72e606fd",
        "Routes": [
            {
                "DestinationCidrBlock": "10.11.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-0721e28436cea8410",
        "OwnerId": "149613515908"
    }
}

$ aws ec2 create-tags \
    --resources rtb-0509a3a7e72e606fd --tags Key=Name,Value=devopsacademy-rt-public

$ aws ec2 create-route-table \
    --vpc-id vpc-0721e28436cea8410

{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0fd603c6c542d8aaf",
        "Routes": [
            {
                "DestinationCidrBlock": "10.11.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-0721e28436cea8410",
        "OwnerId": "149613515908"
    }
}

$ aws ec2 create-tags \
    --resources rtb-0fd603c6c542d8aaf --tags Key=Name,Value=devopsacademy-rt-private
```

- Commands for associating the route tables with subnets:
```
# Public Subnets

$ aws ec2 associate-route-table --route-table-id rtb-0509a3a7e72e606fd --subnet-id subnet-012cc488da2a78bcd

{
    "AssociationId": "rtbassoc-0637bb24beeef2e90",
    "AssociationState": {
        "State": "associated"
    }
}

$ aws ec2 associate-route-table --route-table-id rtb-0509a3a7e72e606fd --subnet-id subnet-01c5db45e8f5eda43

{
    "AssociationId": "rtbassoc-0a8177bb24eaa1097",
    "AssociationState": {
        "State": "associated"
    }
}

$ aws ec2 associate-route-table --route-table-id rtb-0509a3a7e72e606fd --subnet-id subnet-0f04d5a771b8895fd

{
    "AssociationId": "rtbassoc-0dcdf48d625a24c04",
    "AssociationState": {
        "State": "associated"
    }
}

# Private Subnets

$ aws ec2 associate-route-table --route-table-id rtb-0fd603c6c542d8aaf --subnet-id subnet-062fa33492cd979a6

{
    "AssociationId": "rtbassoc-0b5030e3b39d28a19",
    "AssociationState": {
        "State": "associated"
    }
}

$ aws ec2 associate-route-table --route-table-id rtb-0fd603c6c542d8aaf --subnet-id subnet-078038e45d5365db6

{
    "AssociationId": "rtbassoc-07b3a952b4e1b4c26",
    "AssociationState": {
        "State": "associated"
    }
}

$ aws ec2 associate-route-table --route-table-id rtb-0fd603c6c542d8aaf --subnet-id subnet-01ab2bdfc9ee4c1cd

{
    "AssociationId": "rtbassoc-04423dd613b58cc00",
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
$ aws ec2 create-route \
    --route-table-id rtb-0509a3a7e72e606fd --destination-cidr-block 0.0.0.0/0 --gateway-id igw-089944037834c5e28

{
    "Return": true
}

$ aws ec2 create-route \
    --route-table-id rtb-0fd603c6c542d8aaf --destination-cidr-block 0.0.0.0/0 --nat-gateway-id nat-01dfd6d7bc743054d

{
    "Return": true
}
```

- Answer the following questions:
  - How did you accomplish both instructions?
    ```
    By checking the AWS CLI documentation and taking note of the appropriate igw, nat, rtb, vpc, and subnet ids for each command.
    ```

  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    To allow hosts deployed in the public subnets to access the Internet and be publicly accessible.
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    To allow hosts deployed in the private subnets to access the Internet without being publicly accessible.
    ```
    
  - What is the difference of IGW and NGW?
    ```
    IGW is designed to allow hosts inside a VPC to be publicly accessible, NGW is designed to allow hosts to access the Internet preventing public hosts to initiate inbound connections.
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    Sure you can, but it will disrupt the communication with the intended addresses.
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    Hosts inside the subnets won't find their destination routes.
    ```


- Any extra challenges faced?
    Not for this exercise.


***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network07/README.md)
