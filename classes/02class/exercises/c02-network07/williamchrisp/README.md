# c02-network07

## Commands Execution Output
### The following is exactly the same for the private subnets, except ids are different.
- Commands for creating the route tables:
```
aws --region us-east-1 ec2 create-route-table --vpc-id vpc-0e4bde4129898095b --query RouteTable.RouteTableId --output text
rtb-00ccf3c52637fba61
```

- Commands for associating the route tables with subnets:
```
aws --region us-east-1 ec2 associate-route-table  --subnet-id subnet-02531e94ffa2dc32d --route-table-id rtb-00ccf3c52637fba61
aws --region us-east-1 ec2 associate-route-table  --subnet-id subnet-0e896e6bd304561ce --route-table-id rtb-00ccf3c52637fba61
aws --region us-east-1 ec2 associate-route-table  --subnet-id subnet-089788a13e3a4ce48 --route-table-id rtb-00ccf3c52637fba61
```

- Commands for creating the following routes:

|route table|destination|target|
|-|-|-|
|devopsacademy-rt-public|0.0.0.0|`devopsacademy-igw`|
|devopsacademy-rt-private|0.0.0.0|`devopsacademy-ngw`|

```
aws --region us-east-1 ec2 create-route --route-table-id rtb-00ccf3c52637fba61 --destination-cidr-block 0.0.0.0/0 --gateway-id igw-069007f94142c80ce
{
    "Return": true
}
```

- Answer the following questions:
  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    You are adding the above route to let devices under the associated subnets know where to direct their traffic when going to the internet. The gateway controls all the packets going in and out of the associated subnets.
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    You are adding the above route to let devices under the associated subnets know where to direct their traffic when going to the internet. The NAT gateway will receive all their packets and choose the most suited path to the end destination.
    ```
    
  - What is the difference of IGW and NGW?
    ```
    NAT Gateway allows private subnet devices talk to the internet by translating a private IP to a public one. It allows devices on a private subnet to connect to services outside the VPC.
    Internet Gateway allows communication between the VPC and the internet.
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    No, because this allows internal VPC devices to talk to each other.
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    Your subnets will uses the default route table associated with the vpc. Allowing local traffic only.
    ```

- Any extra challenges faced?

***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)