## Routes

Add the following routes to your new route tables:

- devopsacademy-rt-public

|destination|target|
|---|---|
|0.0.0.0|`devopsacademy-igw`|

- devopsacademy-rt-private

|destination|target|
|---|---|
|0.0.0.0|`devopsacademy-ngw`|

#### Then post your answers for the following:

- How did you accomplish both instructions?
- Why did you add 0.0.0.0 route to the IGW on public route table?
- Why did you add 0.0.0.0 route to the NGW on private route table?
- What is the difference of IGW and NGW?
- Can you delete the destination route to your VPC network? Why?
- What happens if you do not associate your route table with any subnets?

# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
aws ec2 create-route-table --vpc-id vpc-064f8156856e7ef9e
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-05f3bc46c0f98bf7b",
        "Routes": [
            {
                "DestinationCidrBlock": "10.0.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-064f8156856e7ef9e",
        "OwnerId": "595178663294"
    }
}
aws ec2 create-tags --resources rtb-05f3bc46c0f98bf7b --tags Key=Name,Value=devopsacademy-rt-public

aws ec2 create-route-table --vpc-id vpc-064f8156856e7ef9e
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0323987f28e6ccccc",
        "Routes": [
            {
                "DestinationCidrBlock": "10.0.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-064f8156856e7ef9e",
        "OwnerId": "595178663294"
    }
}
aws ec2 create-tags --resources rtb-0323987f28e6ccccc --tags Key=Name,Value=devopsacademy-rt-private
```

- Commands for associating the route tables with subnets:
```
Public
aws ec2 associate-route-table --route-table-id rtb-05f3bc46c0f98bf7b --subnet-id subnet-00906c319bbfb11e2
{
    "AssociationId": "rtbassoc-000ea689896a16a8b",
    "AssociationState": {
        "State": "associated"
    }
}
aws ec2 associate-route-table --route-table-id rtb-05f3bc46c0f98bf7b --subnet-id subnet-0c335a3ceb1cff52e
{
    "AssociationId": "rtbassoc-0aa71dc440daeff62",
    "AssociationState": {
        "State": "associated"
    }
}
aws ec2 associate-route-table --route-table-id rtb-05f3bc46c0f98bf7b --subnet-id subnet-0b50b811ea125b4f2
{
    "AssociationId": "rtbassoc-04836b73fe0ef1e2c",
    "AssociationState": {
        "State": "associated"
    }
}

Private
aws ec2 associate-route-table --route-table-id rtb-0323987f28e6ccccc --subnet-id subnet-0a1da7b9cc0df58f1
{
    "AssociationId": "rtbassoc-02ee83640870a8ad9",
    "AssociationState": {
        "State": "associated"
    }
}
aws ec2 associate-route-table --route-table-id rtb-0323987f28e6ccccc --subnet-id subnet-05454c5874fd52a03
{
    "AssociationId": "rtbassoc-0ddbaabaa31016fec",
    "AssociationState": {
        "State": "associated"
    }
}
aws ec2 associate-route-table --route-table-id rtb-0323987f28e6ccccc --subnet-id subnet-08830fc6d95cf8c49
{
    "AssociationId": "rtbassoc-09eec1c354767a6a5",
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
aws ec2 create-route --route-table-id rtb-05f3bc46c0f98bf7b --destination-cidr-block 0.0.0.0/0 --gateway-id igw-0c0123065cb86ee80
aws ec2 create-route --route-table-id rtb-0323987f28e6ccccc --destination-cidr-block 0.0.0.0/0 --nat-gateway-id nat-0742555741547cf63
```

- Answer the following questions:
  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    To allow the public subnets access out to all IP addresses in the internet.
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    To allow the private subnets access out to all IP addresses in the internet.
    ```
    
  - What is the difference of IGW and NGW?
    ```
    IGW allows a way out to the internet from the public subnets. NGW allows our private subnets to communicate with the internet but only if it initiates the communication.
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    You can not delete it but you can replace it. It is used to control routing for all subnets.
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    No routing will occur or it will attempt to use the main route.
    ```


- The last few theory questions were difficult. The hands on was quite straight forward.


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)