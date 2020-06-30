#!/bin/bash

# vpc-049ab576929a001cf
# aws ec2 describe-subnets --filters Name=vpc-id,Values=vpc-049ab576929a001cf

VPC_ID=vpc-0ab8012d8ba301c77
GATEWAY_ID=igw-084a30d9182d99964
ROUTE_TABLE_ID=rtb-097219c81a1e1c641

function createVpc {
        echo Creating VPC

        VPC_ID=$(aws ec2 create-vpc \
                        --cidr-block 172.16.0.0/16 \
                        --no-amazon-provided-ipv6-cidr-block \
                        --instance-tenancy default \
                        --output text \
                        --query 'Vpc.VpcId')

        echo VPC Created: $VPC_ID

        echo Setting Tag

        aws ec2 create-tags \
                --tags Key=Name,Value=devopsacademy-vpc \
                --resources $VPC_ID
}

function createSubnet {
        # echo Create Subnet
        # echo Zone: $1
        # echo cidr block $2
        # echo Name $3

        # echo Creating Subnet: $3 $'\t' $1 $'\t' $2 $'\t' $VPC_ID

        # echo "aws ec2 create-subnet \
        #         --availability-zone $1 \
        #         --cidr-block $2 \
        #         --vpc-id $VPC_ID \
        #         --output text \
        #         --query 'Subnet.SubnetId' \
        #         | xargs aws ec2 create-tags \
        #         --tags Key=Name,Value=$3 \
        #         --resources"


        SUBNET_ID=$(aws ec2 create-subnet \
                --availability-zone $1 \
                --cidr-block $2 \
                --vpc-id $VPC_ID \
                --output text \
                --query 'Subnet.SubnetId')

        aws ec2 create-tags \
                --tags Key=Name,Value=$3 \
                --resources $SUBNET_ID

        echo $SUBNET_ID $'\t' $3 $'\t' $1 $'\t' $2 $'\t' $VPC_ID
}

function createSubnets {
        createSubnet ap-southeast-2a 172.16.10.0/24 public-a
        createSubnet ap-southeast-2b 172.16.11.0/24 public-b
        createSubnet ap-southeast-2c 172.16.12.0/24 public-c

        createSubnet ap-southeast-2a 172.16.20.0/24 private-a
        createSubnet ap-southeast-2b 172.16.21.0/24 private-b
        createSubnet ap-southeast-2c 172.16.22.0/24 private-c
}

function createGateway {
        GATEWAY_ID=$(aws ec2 create-internet-gateway --output text --query "InternetGateway.InternetGatewayId")
        echo Internet Gateway Created: $GATEWAY_ID
        echo Attaching to VPC
        aws ec2 attach-internet-gateway \
                --vpc-id $VPC_ID \
                --internet-gateway-id $GATEWAY_ID
}

function setMapPublicIpOnLaunch {
         aws ec2 describe-subnets \
                --filters "Name=tag:Name,Values=public-a,public-b,public-c" \
                --output text \
                --query 'Subnets[*].{Id:SubnetId}' \
                | xargs -I % sh -c "echo Modifying subnet to %; aws ec2 modify-subnet-attribute --subnet-id % --map-public-ip-on-launch"
}

function initRouteTable {
        ROUTE_TABLE_ID=$(aws ec2 create-route-table \
                --vpc-id $VPC_ID \
                --output text \
                --query "RouteTable.RouteTableId")
        echo Route Table Created: $ROUTE_TABLE_ID
        echo Creating Route to IGW
        aws ec2 create-route \
                --route-table-id $ROUTE_TABLE_ID \
                --destination-cidr-block 0.0.0.0/0 \
                --gateway-id $GATEWAY_ID

        aws ec2 describe-route-tables --route-table-id $ROUTE_TABLE_ID --output json | jq

        aws ec2 describe-subnets \
                --filters "Name=tag:Name,Values=public-a,public-b,public-c" \
                --output text \
                --query 'Subnets[*].{Id:SubnetId}' \
                | xargs -I % sh -c "echo Associating route to %; aws ec2 associate-route-table --subnet-id % --route-table-id $ROUTE_TABLE_ID"

        setMapPublicIpOnLaunch
}

function printResources {
        echo ==: Printing VPC $VPC_ID
        aws ec2 describe-vpcs --vpc-id $VPC_ID --output json | jq

        echo ==: Printing Subnets
        aws ec2 describe-subnets \
                --filter Name=vpc-id,Values=$VPC_ID \
                --output json | jq
        
        echo ==: Printing Route Tables
        aws ec2 describe-route-tables --route-table-id $ROUTE_TABLE_ID --output json | jq

        echo ==: Printing Internet gateway
        aws ec2 describe-internet-gateways --internet-gateway-id $GATEWAY_ID --output json | jq
}

function deleteSubnets
{
        echo Deleting subnets...
        aws ec2 describe-subnets \
                --filter Name=vpc-id,Values=$VPC_ID \
                --query "Subnets[*].[SubnetId]" \
                --output text | xargs -I % sh -c "echo Deleting... %; aws ec2 delete-subnet --subnet-id %; echo Done !"
}

function deleteGateway
{
        echo Detaching internet gateway
        aws ec2 detach-internet-gateway \
                --internet-gateway-id $GATEWAY_ID \
                --vpc-id $VPC_ID

        echo Deleting internet gateway
        aws ec2 delete-internet-gateway \
                --internet-gateway-id $GATEWAY_ID
}

function deleteRouteTable
{
        echo Deleting route table
        aws ec2 delete-route-table \
                --route-table-id $ROUTE_TABLE_ID
}

function deleteVpc
{
        echo Deleting VPC
        aws ec2 delete-vpc --vpc-id $VPC_ID
}

function cleanUp
{
        deleteGateway
        deleteSubnets
        deleteRouteTable
        deleteVpc
}

# cleanUp

if [ "$1" == "" ] ; then
        echo "missing function name"
        exit -1
else
     case $1 in
        "cleanUp")
        cleanUp
        ;;
        "initSubnets")
        createSubnets
        ;;
        "initVpc")
        createVpc
        ;;
        "initGateway")
        createGateway
        ;;
        "initRouteTable")
        initRouteTable
        ;;
        "print")
        printResources
        ;;
     esac   
fi