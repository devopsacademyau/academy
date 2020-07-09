# c02-network06


- Create an Elastic IP:
```bash
export AWS_PROFILE=devopsacademyau
aws sts get-caller-identity

EIP_ID=$(aws ec2 allocate-address --domain vpc \
    --query AllocationId --output text)
aws ec2 describe-addresses  --allocation-ids $EIP_ID
# Output:
{
    "Addresses": [
        {
            "PublicIp": "52.64.188.172",
            "AllocationId": "eipalloc-0b8f804b7f7c2684d",
            "Domain": "vpc",
            "PublicIpv4Pool": "amazon",
            "NetworkBorderGroup": "ap-southeast-2"
        }
    ]
}


```
- Creating a NAT gateway and attach it to a subnet with an Elastic IP
```bash
PUBLIC_SUBNET_NAME='da-c02-public-a';
SUBNET_ID=$(aws ec2 describe-subnets  \
    --filter "Name=tag:Name,Values=$PUBLIC_SUBNET_NAME" \
    --query 'Subnets[].SubnetId' --output text);
echo $SUBNET_ID

NGW_ID=(aws ec2 create-nat-gateway \
    --subnet-id $SUBNET_ID \
    --allocation-id $EIP_ID \
    --tag-specfications 'ResouceType=natgateway, Tags=[{Key=Name, Value=da-c02-ngw}] ' \
    --query=NatGateway.NatGatewayId \
    --output text )

aws ec2 describe-nat-gateways  \
    --filter "Name=nat-gateway-id,Values=$NGW_ID"
# OR 
aws ec2 describe-nat-gateways  \
    --nat-gateway-ids $NGW_ID


# Output:
{
    "NatGateways": [
        {
            "CreateTime": "2020-07-08T02:48:26+00:00",
            "NatGatewayAddresses": [
                {
                    "AllocationId": "eipalloc-0b8f804b7f7c2684d",
                    "NetworkInterfaceId": "eni-0ee8822c9e6c77a8d",
                    "PrivateIp": "10.128.10.182",
                    "PublicIp": "52.64.188.172"
                }
            ],
            "NatGatewayId": "nat-0125ca7e95a2e22c3",
            "State": "available",
            "SubnetId": "subnet-04709dce111382a62",
            "VpcId": "vpc-02ec2836691642ace",
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "da-c02-ngw"
                }
            ]
        }
    ]
}


```
- Clean when needless
```bash
aws ec2 delete-nat-gateway --nat-gateway-id $NGW_ID

aws ec2 release-address --allocation-id $EIP_ID
```

- Any extra challenges faced?

Ok.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)