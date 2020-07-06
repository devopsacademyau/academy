# c02-network07

## Commands Execution Output

- Commands for creating the route tables:

```bash
## VPC ID = vpc-074c260483405f2bb
aws ec2 create-route-table --vpc-id vpc-074c260483405f2bb

# Output
ROUTETABLE      478433196210    rtb-09e3ebba72efa4af8   vpc-074c260483405f2bb
ROUTES  10.0.0.0/16     local   CreateRouteTable        active

# Tag route table with specific name
aws ec2 create-tags --resources rtb-09e3ebba72efa4af8 --tags Key=Name,Value=devopsacademy-rt-public


## Create route table
aws ec2 create-route-table --vpc-id vpc-074c260483405f2bb

# Output
ROUTETABLE      478433196210    rtb-040e043e6f45c836c   vpc-074c260483405f2bb
ROUTES  10.0.0.0/16     local   CreateRouteTable        active

# Tag route table with specific name
aws ec2 create-tags --resources rtb-040e043e6f45c836c --tags Key=Name,Value=devopsacademy-rt-private

```

- Commands for associating the route tables with subnets:

```bash
## Private subnets IDs: subnet-08da4676baf658cb2, subnet-09383d1e51392c852, subnet-0d78ad19a4b86f369
aws ec2 associate-route-table  --subnet-id subnet-08da4676baf658cb2 --route-table-id rtb-040e043e6f45c836c
# Output
rtbassoc-0ae43e404cfade552
ASSOCIATIONSTATE        associated

aws ec2 associate-route-table --subnet-id subnet-09383d1e51392c852 --route-table-id rtb-040e043e6f45c836c
# Output
rtbassoc-0d28096e7460ebaec
ASSOCIATIONSTATE        associated

aws ec2 associate-route-table --subnet-id subnet-0d78ad19a4b86f369 --route-table-id rtb-040e043e6f45c836c
# Output
rtbassoc-0834e41fa6a2e0df7
ASSOCIATIONSTATE        associated


## Public subnets IDs: subnet-0f867dac87c7e75b4, subnet-01ef5462d19df360c, subnet-01ac1852278e631c7
aws ec2 associate-route-table --subnet-id subnet-0f867dac87c7e75b4 --route-table-id rtb-09e3ebba72efa4af8
# Output
rtbassoc-08a3570a55d5db64f
ASSOCIATIONSTATE        associated

aws ec2 associate-route-table --subnet-id subnet-01ef5462d19df360c --route-table-id rtb-09e3ebba72efa4af8
# Output
rtbassoc-09b70548fd98b74bd
ASSOCIATIONSTATE        associated

aws ec2 associate-route-table --subnet-id subnet-01ac1852278e631c7 --route-table-id rtb-09e3ebba72efa4af8
# Output
rtbassoc-0019d4a663f231dee
ASSOCIATIONSTATE        associated

```

- Commands for creating the following routes:

| route table              | destination | target              |
| ------------------------ | ----------- | ------------------- |
| devopsacademy-rt-public  | 0.0.0.0     | `devopsacademy-igw` |
| devopsacademy-rt-private | 0.0.0.0     | `devopsacademy-ngw` |

```bash
# Create route - igw
aws ec2 create-route --route-table-id rtb-09e3ebba72efa4af8 --destination-cidr-block 0.0.0.0/0 --gateway-id igw-04518145207146fe7
# Output
True

# Create route - ngw
aws ec2 create-route --route-table-id rtb-040e043e6f45c836c --destination-cidr-block 0.0.0.0/0 --gateway-id nat-0dcad8a11bc5686fa
# Output
An error occurred (InvalidGatewayID.NotFound) when calling the CreateRoute operation: The gateway ID 'nat-0dcad8a11bc5686fa' does not exist
## I've already delted the natgatway created previously. But, Let's create it again

### Creating NAT AGAIN
## Allocate IP
aws ec2 allocate-address --domain vpc

# Output
eipalloc-0711caa72a2042385      vpc     ap-southeast-2  52.62.142.50    amazon

## SubnetId = subnet-08da4676baf658cb2
## allocation-id = eipalloc-0711caa72a2042385
## Create NAT gateway
aws ec2 create-nat-gateway --allocation-id eipalloc-0711caa72a2042385  --subnet-id subnet-08da4676baf658cb2 --tag-specifications 'ResourceType="natgateway",Tags=[{Key="Name",Value="devopsacademy-ngw"}]'

# Output
7d2dc0a8-1b25-45ab-a711-b36b08e5f353
NATGATEWAY      2020-07-06T15:54:11+00:00       nat-0c2e8f4ea792c8a75   pending subnet-08da4676baf658cb2        vpc-074c260483405f2bb
NATGATEWAYADDRESSES     eipalloc-0711caa72a2042385
TAGS    Name    devopsacademy-ngw

aws ec2 delete-nat-gateway --nat-gateway-id nat-0c2e8f4ea792c8a75
# Output
nat-0c2e8f4ea792c8a75

## Perform the command again
aws ec2 create-route --route-table-id rtb-040e043e6f45c836c --destination-cidr-block 0.0.0.0/0 --gateway-id nat-0c2e8f4ea792c8a75
# Output
True
```

- Answer the following questions:

  - How did you accomplish both instructions?

    ```
    I think so.
    ```

  - Why did you add 0.0.0.0 route to the IGW on public route table?

    ```
    Through this steps I enable my subnets to be public.
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?

    ```
    Allow a way to connect my subnets securely over ther internet. Their IP addresses should definetely not go public. So we use NAT.
    ```

  - What is the difference of IGW and NGW?

    ````
    Basically, what I have got it, Internet Gateway is a way that my subnet has to communicate beyond the vpc (acessing internet). On the other hand, NAT just is a bridge betwwen your private subnet and the internet or any aws services.  ```

    ````

  - Can you delete the destination route to your VPC network? Why?

    ```
    You are not able to delete main route table.
    If you create a custom subnet route table, You are able to delete just when there is no association in a custom route table.
    ```

  - What happens if you do not associate your route table with any subnets?

    ```
    Usually, It would not be able to communicate with others in the subnet. But AWS has a default/main table route that allow you use
    ```

* Any extra challenges faced?

> Link one by one. =D

> When I was performing `aws ec2 release-address --allocation-id eipalloc-0711caa72a2042385`. I got the following error

```bash
  An error occurred (AuthFailure) when calling the ReleaseAddress operation: You do not have permission to access the specified resource.
```

Ufa! After 200x attempts, i got it !.

---

Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)
