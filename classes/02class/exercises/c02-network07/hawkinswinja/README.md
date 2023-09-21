# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
aws  ec2 create-route-table --region ap-southeast-2 --vpc-id $Vid --tag-specifications 'ResourceType=route-table, Tags=[{Key=Name,Value=devopsacademy-rt-public}]'
{
    "RouteTables": [
        {
            "Associations": [],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-08e405bf982341795",
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
            "VpcId": "vpc-0b4f29ed84bdb6fd1",
            "OwnerId": "594524864098"
        }
    ]
}

aws  ec2 create-route-table --region ap-southeast-2 --vpc-id $Vid --tag-specifications 'ResourceType=route-table, Tags=[{Key=Name,Value=devopsacademy-rt-private}]'
{
    "RouteTables": [
        {
            "Associations": [],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-06056c1c796a2c6ed",
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
            "VpcId": "vpc-0b4f29ed84bdb6fd1",
            "OwnerId": "594524864098"
        }
    ]
}
```

- Commands for associating the route tables with subnets:
```
for a in \
subnet-087448560f71a7f82 \
subnet-0d759e1f9d4f37a3a \
subnet-0a5ea33c07de5ab90; 
do \
aws ec2 associate-route-table --subnet-id $a --route-table-id rtb-08e405bf982341795 --region ap-southeast-2; \
done

{
    "AssociationId": "rtbassoc-02dbd4655175509cb",
    "AssociationState": {
        "State": "associated"
    }
}
{
    "AssociationId": "rtbassoc-07a778a6d00b69564",
    "AssociationState": {
        "State": "associated"
    }
}                                                                            {                                                                                "AssociationId": "rtbassoc-0786b164123fb8cb8",                               "AssociationState": {                                                            "State": "associated"                                                    }                                                                        }

for a in subnet-06b67d10b41e626df subnet-025cf8ed5b10f2d11 subnet-0b60fb1c511169e96; do aws ec2 associate-route-table --subnet-id $a --route-table-id rtb-06056c1c796a2c6ed --region ap-southeast-2; done
{
    "AssociationId": "rtbassoc-0670339435d22573a",
    "AssociationState": {
        "State": "associated"
    }
}
{
    "AssociationId": "rtbassoc-0ca52c83daaefcf94",
    "AssociationState": {
        "State": "associated"
    }
}
{
    "AssociationId": "rtbassoc-0807fc2af71a52713",
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
aws ec2 create-route \
> --route-table-id rtb-08e405bf982341795 \
> --destination-cidr-block 0.0.0.0/0 \
> --gateway-id igw-07501b54cce045dab \
> --region ap-southeast-2
{
    "Return": true
}
```

- Answer the following questions:
  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    0.0.0.0 refers to all ip address. This allows the associated subnets to communicate with any ip in the internet
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    0.0.0.0 allows resources in the subnets to communicate with any ip over the internet
    ```
    
  - What is the difference of IGW and NGW?
    ```
    IGW allows communication to and from the internet while NGW allows communication to the internet. Resources behind the NGW are not directly accessible by other resources in the internet
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    you can not delete the destination route to your vpc network AKA (local), as it is the basic setup that allows communication within the resources in the vpc
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    Nothing happens. Subnets are implicitly associated to the main route table of the vpc. 
    ```


- Any extra challenges faced?
```
filtering out the subnets with specific tags was a challenge using the cli as it does not support wildcards
```


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)
