# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
Add your commands and their outputs here
```
Create Public route-table
aws ec2 create-route-table --vpc-id vpc-0cc0c4eeb9c6504d7 --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=ab-dojo-public}]'

Create private route-table
aws ec2 create-route-table --vpc-id vpc-0cc0c4eeb9c6504d7 --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=ab-dojo-private}]'

- Commands for associating the route tables with subnets:
```
Add your commands and their outputs here
```
Associate a subnet with the route tables. Only have this command saved as I did this exercise yesterday.
aws ec2 associate-route-table --route-table-id rtb-07b388fccc3f6f836 --subnet-id subnet-0934c266f500de1ce



- Commands for creating the following routes:

|route table|destination|target|
|-|-|-|
|devopsacademy-rt-public|0.0.0.0|`devopsacademy-igw`|
  aws ec2 create-route --route-table-id rtb-07b388fccc3f6f836 --destination-cidr-block 0.0.0.0/0 --gateway-id igw-0c3ea2cdda1801e7f
|devopsacademy-rt-private|0.0.0.0|`devopsacademy-ngw`|
  aws ec2 create-route --route-table-id rtb-0059a8ec43aa79a86 --destination-cidr-block 0.0.0.0/0 --gateway-id nat-04ae0c9d87013774c

```
Add your commands and their outputs here
```

- Answer the following questions:
  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
   This is the default route to the internet. If the address is not specified in the route table it will sent to the internet gateway and then out to the internet
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    This is the default route for these subnets. If the address is not specified in the route table it will be sent to the NAT gateway and then out to the internet
    ```
    
  - What is the difference of IGW and NGW?
    ```
    IGW allows direct internet access out and in using public IP addresses. 
    NGW is created in a public subnet. Resources in a private subnet will route there traffic through the NGW to gain internet access.
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    No you are not able to delete this route. This route is created by AWS and is for local VPC traffic.
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    Nothing
    ```


- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)