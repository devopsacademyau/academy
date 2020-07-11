# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```bash
# continue from c02-network03-04
VCP_ID=vpc-02ec2836691642ace

# Create-internet-gateway
IGW_ID=$(aws ec2 create-internet-gateway \
    --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=da-c02-igw}]' \
    --query=InternetGateway.InternetGatewayId --output text)

aws ec2 describe-internet-gateways  \
    --filters "Name=internet-gateway-id,Values=$IGW_ID"
# output:
{
    "InternetGateways": [
        {
            "Attachments": [],
            "InternetGatewayId": "igw-00e742e618ee169a3",
            "OwnerId": "421117346104",
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "da-c02-igw"
                }
            ]
        }
    ]
}


# Attach the Internet gateway to your VPC
aws ec2 attach-internet-gateway --vpc-id $VPC_ID --internet-gateway-id $IGW_ID

# Clean resources when needless
aws ec2 detach-internet-gateway --internet-gateway-id $IGW_ID --vpc-id $VPC_ID
aws ec2 delete-internet-gateway --internet-gateway-id $IGW_ID

```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)