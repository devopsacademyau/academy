# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
# Setup
export AWS_DEFAULT_REGION=ap-southeast-2
VPC_ID=$(aws ec2 describe-vpcs --filter 'Name=tag:Name,Values=devopsacademy-vpc' --query Vpcs[-1].VpcId --output text)

# Public Route Table
RT_PUBLIC=$(aws ec2 create-route-table --vpc-id $VPC_ID --query RouteTable.RouteTableId --output text)
aws ec2 create-tags --resources $RT_PUBLIC --tags Key=Name,Value=devopsacademy-rt-public
echo $RT_PUBLIC # rtb-06bb862b6db81736f

# Private Route Table
RT_PRIVATE=$(aws ec2 create-route-table --vpc-id $VPC_ID --query RouteTable.RouteTableId --output text)
aws ec2 create-tags --resources $RT_PRIVATE --tags Key=Name,Value=devopsacademy-rt-private
echo $RT_PRIVATE # rtb-0f7e7ba92abad20ec

# Destroy
aws ec2 delete-route-table --route-table-id $RT_PUBLIC
aws ec2 delete-route-table --route-table-id $RT_PRIVATE
```

- Commands for associating the route tables with subnets:
```
# Setup
SUBNET_PUBLIC_A=$(aws ec2 describe-subnets --filter 'Name=tag:Name,Values=devops-public-a' --query Subnets[-1].SubnetId --output text)
SUBNET_PUBLIC_B=$(aws ec2 describe-subnets --filter 'Name=tag:Name,Values=devops-public-b' --query Subnets[-1].SubnetId --output text)
SUBNET_PUBLIC_C=$(aws ec2 describe-subnets --filter 'Name=tag:Name,Values=devops-public-c' --query Subnets[-1].SubnetId --output text)
SUBNET_PRIVATE_A=$(aws ec2 describe-subnets --filter 'Name=tag:Name,Values=devops-private-a' --query Subnets[-1].SubnetId --output text)
SUBNET_PRIVATE_B=$(aws ec2 describe-subnets --filter 'Name=tag:Name,Values=devops-private-b' --query Subnets[-1].SubnetId --output text)
SUBNET_PRIVATE_C=$(aws ec2 describe-subnets --filter 'Name=tag:Name,Values=devops-private-c' --query Subnets[-1].SubnetId --output text)

aws ec2 associate-route-table --route-table-id $RT_PUBLIC --subnet-id $SUBNET_PUBLIC_A --query AssociationId --output text
aws ec2 associate-route-table --route-table-id $RT_PUBLIC --subnet-id $SUBNET_PUBLIC_B --query AssociationId --output text
aws ec2 associate-route-table --route-table-id $RT_PUBLIC --subnet-id $SUBNET_PUBLIC_C --query AssociationId --output text
aws ec2 associate-route-table --route-table-id $RT_PRIVATE --subnet-id $SUBNET_PRIVATE_A --query AssociationId --output text
aws ec2 associate-route-table --route-table-id $RT_PRIVATE --subnet-id $SUBNET_PRIVATE_B --query AssociationId --output text
aws ec2 associate-route-table --route-table-id $RT_PRIVATE --subnet-id $SUBNET_PRIVATE_C --query AssociationId --output text
# rtbassoc-0263b2d04c48d97a4
# rtbassoc-01fdaf2041bafdf99
# rtbassoc-0bd6000c8fa17bc76
# rtbassoc-03a435bb22548ee62
# rtbassoc-03280d252ce7c8b79
# rtbassoc-04d8925f7b0570772
```

- Commands for creating the following routes:

|route table|destination|target|
|---|---|---|
|devopsacademy-rt-public|0.0.0.0|`devopsacademy-igw`|
|devopsacademy-rt-private|0.0.0.0|`devopsacademy-ngw`|

```
NAT_GATEWAY=$(aws ec2 describe-nat-gateways --filter 'Name=tag:Name,Values=devopsacademy-ngw' --query NatGateways[-1].NatGatewayId --output text)
INTERNET_GATEWAY=$(aws ec2 describe-internet-gateways --filter 'Name=tag:Name,Values=devopsacademy-igw' --query InternetGateways[-1].InternetGatewayId --output text)

aws ec2 create-route --route-table-id $RT_PUBLIC --destination-cidr-block 0.0.0.0/0 --gateway-id $INTERNET_GATEWAY
aws ec2 create-route --route-table-id $RT_PRIVATE --destination-cidr-block 0.0.0.0/0 --nat-gateway-id $NAT_GATEWAY
```

- Answer the following questions:
  - How did you accomplish both instructions?
    ```
    I did not know the exact commands, but a bit of "help", "grep" and tab-completion got me there.
    ```

  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    So it can access the Internet -- that is the default gateway.
    
    The only existing route is the "local" route with the VPC CIDR, which means all traffic into the VPC is not routed out.
    
    Adding the "default gateway" means all traffic that does not match any other roles (not local) should be directed to
    that gateway. That gateway will allow traffic to flow into the public network (Internet).
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    Same as the IGW.
    ```
    
  - What is the difference of IGW and NGW?
    ```
    The IGW is in a public subnet, which means the source IP is public and can be routed back without problems.
    
    The NGW is in a private subnet and the packages have no public IP -- so they cannot be routed back using a normal gateway.
    
    The NGW will use an elastic IP to "mask" the source IP.
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    No, because this route means the destination is local and not actually routed.
    
    Without this role the machines would not be able to talk to others or even use other routes via a router / gateway. 
    
    Destinations in the LAN will use ARP to resolve the MAC addresses (ethernet) and transmit packages using the physical layer. 
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    If the route table is not the "main" route table for the VPC, nothing happens (it will not be used).
    
    If the route table is the "main" route table for the VPC, it will be automatically used by any subnets not
    explicitly associated with any route table.
    ```


- Any extra challenges faced?

> Nope.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)