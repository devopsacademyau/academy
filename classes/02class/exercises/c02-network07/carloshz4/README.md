# c02-network07

## Commands Execution Output

- Commands for creating the route tables:

Public

```
aws ec2 create-route-table --vpc-id vpc-0f80827681fb041d0 \
--region ap-southeast-2 

-------------------------------------------------------------------------
|                           CreateRouteTable                            |
+-----------------------------------------------------------------------+
||                             RouteTable                              ||
|+---------------+--------------------------+--------------------------+|
||    OwnerId    |      RouteTableId        |          VpcId           ||
|+---------------+--------------------------+--------------------------+|
||  016454647794 |  rtb-088d967af4f789ea7   |  vpc-0f80827681fb041d0   ||
|+---------------+--------------------------+--------------------------+|
|||                              Routes                               |||
||+-----------------------+------------+--------------------+---------+||
||| DestinationCidrBlock  | GatewayId  |      Origin        |  State  |||
||+-----------------------+------------+--------------------+---------+||
|||  10.10.0.0/16         |  local     |  CreateRouteTable  |  active |||
||+-----------------------+------------+--------------------+---------+||

aws ec2 create-tags \
--resources rtb-088d967af4f789ea7  \
--region ap-southeast-2  \
--tags Key=Name,Value="devopsacademy-rt-public"
```

Private

```
aws ec2 create-route-table --vpc-id vpc-0f80827681fb041d0 \
--region ap-southeast-2 

-------------------------------------------------------------------------
|                           CreateRouteTable                            |
+-----------------------------------------------------------------------+
||                             RouteTable                              ||
|+---------------+--------------------------+--------------------------+|
||    OwnerId    |      RouteTableId        |          VpcId           ||
|+---------------+--------------------------+--------------------------+|
||  016454647794 |  rtb-09e96ac9c646cc937   |  vpc-0f80827681fb041d0   ||
|+---------------+--------------------------+--------------------------+|
|||                              Routes                               |||
||+-----------------------+------------+--------------------+---------+||
||| DestinationCidrBlock  | GatewayId  |      Origin        |  State  |||
||+-----------------------+------------+--------------------+---------+||
|||  10.10.0.0/16         |  local     |  CreateRouteTable  |  active |||
||+-----------------------+------------+--------------------+---------+||


aws ec2 create-tags \
--resources rtb-09e96ac9c646cc937  \
--region ap-southeast-2  \
--tags Key=Name,Value="devopsacademy-rt-private"
```


- Commands for associating the route tables with subnets:
```
aws ec2 create-route --route-table-id rtb-088d967af4f789ea7 \
--destination-cidr-block 0.0.0.0/0 \
--gateway-id igw-02e59fc8fcb21e78c \
--region ap-southeast-2

aws ec2 create-route --route-table-id rtb-09e96ac9c646cc937 \
--destination-cidr-block 0.0.0.0/0 \
--gateway-id nat-0854577e398e17703 \
--region ap-southeast-2
```

- Commands for creating the following routes:

|route table|destination|target|
|-|-|-|
|devopsacademy-rt-public|0.0.0.0|`devopsacademy-igw`|
|devopsacademy-rt-private|0.0.0.0|`devopsacademy-ngw`|

Commands already shown above


### Answer the following questions:

- How did you accomplish both instructions?
    ```
Creating each route table via CLI, then tagging the route table as per commands shown.
Then adding each route to the respective route table, one associated to the Internet GW and the other one associated to the NAT GW.
    ```

- Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
Because that means that traffic to ANY target that is not stated in other routes will be directed to the IGW. This will provide internet access to the subnet that uses this Route Table.
    ```

- Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
Because that means that traffic to ANY target that is not stated in other routes will be directed to the NGW. The NGW will do the Net Address Translation and will also provide internet access to the subnet using this Route Table.
    ```
    
- What is the difference of IGW and NGW?
    ```
 IGW provides by-directional access to internet whilst NAT GW mainly acts one way (limiting access to devices -from the internet- that are behind the NGW).   Usually IGW is used on public subnets whilst NGW on private subnets. 
    ```
    
- Can you delete the destination route to your VPC network? Why?
    ```
	No. It is restricted by AWS. I suppose it is because it allows communication inside the VPC hence it's needed.
    ```
    
- What happens if you do not associate your route table with any subnets?
    ```
The route table won't be used whilst the subnets will use the route table that comes with the VPC (main RT).
    ```


- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)