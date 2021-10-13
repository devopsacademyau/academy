# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
aws ec2 create-route-table --vpc-id vpc-0437c9e5d4deb0d46
aws ec2 create-route-table --vpc-id vpc-0437c9e5d4deb0d46
```

- Commands for associating the route tables with subnets:
```
#Public

aws ec2 associate-route-table --route-table-id rtb-01808f4b7f8f84e2d --subnet-id subnet-035eecc54395ab403
aws ec2 associate-route-table --route-table-id rtb-01808f4b7f8f84e2d --subnet-id subnet-08737e92c20871b3f
aws ec2 associate-route-table --route-table-id rtb-01808f4b7f8f84e2d --subnet-id subnet-00cf4d20b9e900509

#Private

aws ec2 associate-route-table --route-table-id rtb-01da7fb0eda9486d1 --subnet-id subnet-0034d8bc2e6165ad7
aws ec2 associate-route-table --route-table-id rtb-01da7fb0eda9486d1 --subnet-id subnet-0fb16bb32469d01c1
aws ec2 associate-route-table --route-table-id rtb-01da7fb0eda9486d1 --subnet-id subnet-03377c5d39b3acf6e
```

- Commands for creating the following routes:

|route table|destination|target|
|-|-|-|
|devopsacademy-rt-public|0.0.0.0|`devopsacademy-igw`|
|devopsacademy-rt-private|0.0.0.0|`devopsacademy-ngw`|

Add `0.0.0.0` to the IGW on public route table

```bash
aws ec2 create-route --route-table-id rtb-01808f4b7f8f84e2d --destination-cidr-block 0.0.0.0/0 --gateway-id igw-0e5f16880146f0a33
```

Add `0.0.0.0` to the NAT on private route table

```bash
aws ec2 create-route --route-table-id rtb-01da7fb0eda9486d1 --destination-cidr-block 0.0.0.0/0 --nat-gateway-id nat-08e7de9c1b786f17a
```

- Answer the following questions:
  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    To allow traffic to internet through the Internet Gateway    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    To allow traffic from private network through NAT Gateway. This allows internet access from instances on the private network.
    ```
    
  - What is the difference of IGW and NGW?
    ```
    Internet Gateways allow traffic from instances in the public subnets whereas NAT Gateways allows instances without Public IP addresses to access the internet.
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    No, it will affect traffic within the subnets
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    It will default to the VPC route table
    ```


- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)