# c02-network07

## Commands Execution Output

Create the route tables and associate with referred subnets:

|route table|subnet|
|---|---|
|devopsacademy-rt-public|all public subnets|
|devopsacademy-rt-private|all private subnets|
- Commands for creating the route tables:
```bash
# Select profile
export AWS_PROFILE=devopsacademyau; aws sts get-caller-identity

# get VCPId
VPC_NAME='da-c02-vpc';
VPC_ID=$(aws ec2 describe-vpcs \
    --filter "Name=tag:Name,Values=$VPC_NAME" \
    --query Vpcs[].VpcId --output text);
ECHO $VPC_ID

# Create Public Route Table
RTB_PUBLIC_NAME='da-c02-rt-public';
RTB_PUBLIC_ID=$(aws ec2 create-route-table  \
    --vpc-id $VPC_ID \
    --query RouteTable.RouteTableId --output text);
ECHO $RTB_PUBLIC_ID

aws ec2 create-tags --resources $RTB_PUBLIC_ID --tags Key=Name,Value=$RTB_PUBLIC_NAME

# check the Public route table
aws ec2 describe-route-tables --route-table-id $RTB_PUBLIC_ID

# Output:
{
    "RouteTables": [
        {
            "Associations": [],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-05178db013809c960",
            "Routes": [
                {
                    "DestinationCidrBlock": "10.128.0.0/16",
                    "GatewayId": "local",
                    "Origin": "CreateRouteTable",
                    "State": "active"
                }
            ],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "da-c02-public"
                }
            ],
            "VpcId": "vpc-02ec2836691642ace",
            "OwnerId": "421117346104"
        }
    ]
}

# Create Private Route Table
RTB_PRIVATE_NAME='da-c02-rt-private';
RTB_PRIVATE_ID=$(aws ec2 create-route-table  \
    --vpc-id $VPC_ID \
    --query RouteTable.RouteTableId --output text);
ECHO $RTB_PRIVATE_ID

aws ec2 create-tags --resources $RTB_PRIVATE_ID --tags Key=Name,Value=$RTB_PRIVATE_NAME

# check the Private route table
aws ec2 describe-route-tables --route-table-id $RTB_PRIVATE_ID

#Output:
{
    "RouteTables": [
        {
            "Associations": [],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-07637c0059694e399",
            "Routes": [
                {
                    "DestinationCidrBlock": "10.128.0.0/16",
                    "GatewayId": "local",
                    "Origin": "CreateRouteTable",
                    "State": "active"
                }
            ],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "da-c02-private"
                }
            ],
            "VpcId": "vpc-02ec2836691642ace",
            "OwnerId": "421117346104"
        }
    ]
}


```

- Commands for associating the route tables with subnets:
```bash
# Get SubnetIds
PUBLIC_SUBNET_A_NAME='da-c02-public-a';
PUBLIC_SUBNET_B_NAME='da-c02-public-b';
PUBLIC_SUBNET_C_NAME='da-c02-public-c';
PRIVATE_SUBNET_A_NAME='da-c02-private-a';
PRIVATE_SUBNET_B_NAME='da-c02-private-b';
PRIVATE_SUBNET_C_NAME='da-c02-private-c';

PUBLIC_SUBNET_A_ID=$(aws ec2 describe-subnets  \
    --filter "Name=tag:Name,Values=$PUBLIC_SUBNET_A_NAME" \
    --query 'Subnets[].SubnetId' --output text);

PUBLIC_SUBNET_B_ID=$(aws ec2 describe-subnets  \
    --filter "Name=tag:Name,Values=$PUBLIC_SUBNET_B_NAME" \
    --query 'Subnets[].SubnetId' --output text);

PUBLIC_SUBNET_C_ID=$(aws ec2 describe-subnets  \
    --filter "Name=tag:Name,Values=$PUBLIC_SUBNET_C_NAME" \
    --query 'Subnets[].SubnetId' --output text);

PRIVATE_SUBNET_A_ID=$(aws ec2 describe-subnets  \
    --filter "Name=tag:Name,Values=$PRIVATE_SUBNET_A_NAME" \
    --query 'Subnets[].SubnetId' --output text);

PRIVATE_SUBNET_B_ID=$(aws ec2 describe-subnets  \
    --filter "Name=tag:Name,Values=$PRIVATE_SUBNET_B_NAME" \
    --query 'Subnets[].SubnetId' --output text);

PRIVATE_SUBNET_C_ID=$(aws ec2 describe-subnets  \
    --filter "Name=tag:Name,Values=$PRIVATE_SUBNET_C_NAME" \
    --query 'Subnets[].SubnetId' --output text);

$ ECHO $PUBLIC_SUBNET_A_ID $PUBLIC_SUBNET_B_ID $PUBLIC_SUBNET_C_ID;
subnet-04709dce111382a62 subnet-00d8a496401ddc8de subnet-0d0c8946e18a7902c

$ ECHO $PRIVATE_SUBNET_A_ID $PRIVATE_SUBNET_B_ID $PRIVATE_SUBNET_C_ID
subnet-080d66f82c68fe96b subnet-03b9a6d084a3b586b subnet-069d2eb4c2921ab78

# Associate the route tables with subnets
aws ec2 associate-route-table --route-table-id $RTB_PUBLIC_ID --subnet-id $PUBLIC_SUBNET_A_ID
# Output:
{
    "AssociationId": "rtbassoc-013ae1d324faabd23",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table --route-table-id $RTB_PUBLIC_ID --subnet-id $PUBLIC_SUBNET_B_ID
# Output:
{
    "AssociationId": "rtbassoc-0980e853843bf30e7",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table --route-table-id $RTB_PUBLIC_ID --subnet-id $PUBLIC_SUBNET_C_ID
# Output:
{
    "AssociationId": "rtbassoc-04534e4ed7d32cf1d",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table --route-table-id $RTB_PRIVATE_ID --subnet-id $PRIVATE_SUBNET_A_ID
# Output:
{
    "AssociationId": "rtbassoc-0c22764a373b11103",
    "AssociationState": {
        "State": "associated"
    }
}


aws ec2 associate-route-table --route-table-id $RTB_PRIVATE_ID --subnet-id $PRIVATE_SUBNET_B_ID
# Output:
{
    "AssociationId": "rtbassoc-09962c81ba3d97589",
    "AssociationState": {
        "State": "associated"
    }
}

aws ec2 associate-route-table --route-table-id $RTB_PRIVATE_ID --subnet-id $PRIVATE_SUBNET_C_ID
# Output:
{
    "AssociationId": "rtbassoc-0abf61f52cb1da6e3",
    "AssociationState": {
        "State": "associated"
    }
}
```

- Commands for creating the following routes:

|route table|destination|target|
|-|-|-|
|da-c02-rt-public|0.0.0.0|`da-c02-igw`|
|da-c02-rt-private|0.0.0.0|`da-c02-ngw`|

```bash
# Get InternetGatewayId
IGW_NAME='da-c02-igw';
IGW_ID=$(aws ec2 describe-internet-gateways \
    --filter "Name=tag:Name,Values=$IGW_NAME" \
    --query InternetGateways[].InternetGatewayId --output text);
ECHO $IGW_ID
#Output:igw-00e742e618ee169a3

# Get NatGatewayId
NGW_NAME='da-c02-ngw';
NGW_ID=$(aws ec2 describe-nat-gateways \
    --filter "Name=tag:Name,Values=$NGW_NAME" \
    --query NatGateways[].NatGatewayId --output text);
ECHO $NGW_ID
#Output: nat-0125ca7e95a2e22c3

# Create routes
aws ec2 create-route --route-table-id $RTB_PUBLIC_ID --destination-cidr-block 0.0.0.0/0 --gateway-id $IGW_ID;
aws ec2 create-route --route-table-id $RTB_PRIVATE_ID --destination-cidr-block 0.0.0.0/0 --nat-gateway-id $NGW_ID
#Output:
{
    "Return": true
}

# Clean when needless
aws ec2 disassociate-route-table --association-id ******
aws ec2 delete-route-table --route-table-id $RTB_PUBLIC_ID
aws ec2 delete-route-table --route-table-id $RTB_PRIVATE_ID
```

- Answer the following questions:
  - How did you accomplish both instructions?
    ```
    When I did c02-network04, I thought about how to make subnets public and how to make subnets private and then looked through all the next excercises. After created the VPC and subnets, you attached Internet gateway and NAT gateway to your VPC, creating a public route table associated with public subnets and a private route table associated with private subnets, and configuring routing for the public subnets through the associated public route table to the Internet gateway and configuring routing for the private subnets through the associated private route table to the NAT gateway.
    ```

  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    To route internal VPC requests from public subnets to the internet through internet gateway.
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    To route the private requests to the internet through NAT Gateway. Because from private subnets, access from the internet shouldn't be allowed direct to the instances,
    ```
    
  - What is the difference of IGW and NGW?
    ```
    A Internet Gateway allows resources in public subnets to access the internet, and the internet to access public resources.
    A NAT Gateway masquerades the private requests to the internet, but the internet normally cannot get through the NAT Gateway to resources in private subnets unless you explicitly allow it.
    
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    No, if delete it, local traffic could be disabled.
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    If you disassociate your route table, the subnet no longer uses the routes in the route table. Instead, it uses the routes in the VPC's main route table. 
    ```


- Any extra challenges faced?

    OK.
<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)