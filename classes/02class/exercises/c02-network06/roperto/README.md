# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```shell script
# Setup
export AWS_REGION=ap-southeast-2
SUBNET_PUBLIC_A=subnet-0d4986c79f7cd8e16

# Create NAT
EIP=$(aws ec2 allocate-address --query AllocationId --output text)
NAT_GATEWAY=$(aws ec2 create-nat-gateway --allocation-id $EIP --subnet-id $SUBNET_PUBLIC_A \
    --tag-specifications 'ResourceType=natgateway,Tags=[{Key=Name,Value=devopsacademy-ngw}]' \
    --query=NatGateway.NatGatewayId --output text)
echo "EIP=${EIP} NAT_GATEWAY=${NAT_GATEWAY}"

# Destroy
aws ec2 delete-nat-gateway --nat-gateway-id $NAT_GATEWAY
# Wait until gateway deleted
aws ec2 release-address --allocation-id $EIP
```

- Any extra challenges faced?

> All good.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)