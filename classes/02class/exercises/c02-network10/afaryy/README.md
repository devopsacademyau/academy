# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```bash
# Set private subnet
PRIVATE_SUBNET_A_NAME='da-c02-private-a';
PRIVATE_SUBNET_A_ID=$(aws ec2 describe-subnets  \
    --filter "Name=tag:Name,Values=$PRIVATE_SUBNET_A_NAME" \
    --query 'Subnets[].SubnetId' --output text);
echo $PRIVATE_SUBNET_A_ID

# Set security group
SG_NAME='da-c02-private-sg';
SG_ID=$(aws ec2 describe-security-groups  \
    --filter "Name=tag:Name,Values=$SG_NAME" \
    --query "SecurityGroups[0].GroupId" \
    --output text);
echo $SG_ID

# Create network interface
NI_ID=$(aws ec2 create-network-interface \
    --description "DA C02N10 ENI" \
    --subnet-id $PRIVATE_SUBNET_A_ID \
    --private-ip-address 10.128.20.10 \
    --groups $SG_ID \
    --query NetworkInterface.NetworkInterfaceId --output text);
echo $NI_ID

# Check network interface
aws ec2 describe-subnets --subnet-ids $PRIVATE_SUBNET_A_ID
aws ec2 describe-network-interfaces --network-interface-id $NI_ID
# Output:
{
    "NetworkInterfaces": [
        {
            "AvailabilityZone": "ap-southeast-2a",
            "Description": "DA C02N10 ENI",
            "Groups": [
                {
                    "GroupName": "da-c02-private-sg",
                    "GroupId": "sg-08b73628e191c4bd8"
                }
            ],
            "InterfaceType": "interface",
            "Ipv6Addresses": [],
            "MacAddress": "06:2f:67:a5:5a:c2",
            "NetworkInterfaceId": "eni-0fa58587730752578",
            "OwnerId": "421117346104",
            "PrivateIpAddress": "10.128.20.10",
            "PrivateIpAddresses": [
                {
                    "Primary": true,
                    "PrivateIpAddress": "10.128.20.10"
                }
            ],
            "RequesterId": "AIDAWEDEMYE4HVUY5GK3P",
            "RequesterManaged": false,
            "SourceDestCheck": true,
            "Status": "available",
            "SubnetId": "subnet-080d66f82c68fe96b",
            "TagSet": [],
            "VpcId": "vpc-02ec2836691642ace"
        }
    ]
}


# Clean when needless
aws ec2 delete-network-interface --network-interface-id $NI_ID

```

- Any extra challenges faced?
The more I did, the more I feel confidence. I need it. :)

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)