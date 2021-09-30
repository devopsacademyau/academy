# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
public
aws ec2 create-route-table --vpc-id <vpc id> --region ap-southeast-2 

aws ec2 create-tags --resources <rtb id> --tags Key=Name, Value="neljn-rtb-public"

private 
aws ec2 create-route-table --vpc-id <vpc id> --region ap-southeast-2

aws ec2 create-tags --resources <rtb id> --tags Key=Name, Value="neljn-rtb-private"


```

- Commands for associating the route tables with subnets:
```
aws ec2 associate-route-table --route-table-id <rtb id> --subnet-id <subnet id> --region ap-southeast-2

6 for each pub and private in each AZ 
```

- Commands for creating the following routes:

|route table|destination|target|
|-|-|-|
|devopsacademy-rt-public|0.0.0.0|`devopsacademy-igw`|
|devopsacademy-rt-private|0.0.0.0|`devopsacademy-ngw`|

```
aws ec2 create-route --route-table-id <rtb id> --destination-cidr-block 0.0.0.0/0 --gateway-id <igw id> --region ap-southeast-2

aws ec2 create-route --route-table-id <rtb id> --destination-cidr-block 0.0.0.0/0 --gateway-id <nat gw id> --region ap-southeast-2
```

- Answer the following questions:
  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    0.0.0.0/0 represents all ipv4 traffic. Any traffice not specified in another route will be directed here for public internet access 
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    0.0.0.0/0 represents all ipv4 traffic. Any traffic not specified in another route will be directed to the nat
    ```
    
  - What is the difference of IGW and NGW?
    ```
    Internet gateway allows services within the public subnet to get an ip out to the public internet and vice versa. Althoug services in a public subnet may have a public IP they will need to use an IG to get out.   
    A NAT is used to allow services in a private subnet to tranmit into a public subnet and potentially out to the internet via the internet gateway
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    this is there by default to allow communications within the VPC. Anyhting on top of it is to add restriction/control.  
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    The subnets will default to using the VPCs route table. 
    ```


- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)