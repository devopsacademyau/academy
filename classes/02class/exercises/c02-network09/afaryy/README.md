# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|-|-|-|-|-|-|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```bash
# get VCPId
export AWS_PROFILE=devopsacademyau; aws sts get-caller-identity
VPC_NAME='da-c02-vpc';
VPC_ID=$(aws ec2 describe-vpcs \
    --filter "Name=tag:Name,Values=$VPC_NAME" \
    --query Vpcs[].VpcId --output text);
ECHO $VPC_ID

# Create Public Security Group
SG_PUBLIC_NAME='da-c02-public-sg'
HOME_IP=$(curl -s 'https://checkip.amazonaws.com/')
SG_PUBLIC_ID=$(aws ec2 create-security-group \
    --group-name $SG_PUBLIC_NAME \
    --description 'SSH access from home to AWS' \
    --vpc-id $VPC_ID \
    --tag-specifications "ResourceType=security-group,Tags=[{Key=Name,Value=$SG_PUBLIC_NAME}]" \
    --query GroupId --output text)
    
aws ec2 authorize-security-group-ingress \
    --group-id $SG_PUBLIC_ID \
    --protocol tcp --port 22 --cidr "$HOME_IP/32"
    
# Check Public Security Group   
aws ec2 describe-security-groups --group-id $SG_PUBLIC_ID

# Output:
{
    "SecurityGroups": [
        {
            "Description": "SSH access from home to AWS",
            "GroupName": "da-c02-public-sg",
            "IpPermissions": [
                {
                    "FromPort": 22,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "110.144.1.179/32"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 22,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "************",
            "GroupId": "sg-03c842207ddde4f96",
            "IpPermissionsEgress": [
                {
                    "IpProtocol": "-1",
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "UserIdGroupPairs": []
                }
            ],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "da-c02-public-sg"
                }
            ],
            "VpcId": "vpc-02ec2836691642ace"
        }
    ]
}
  
# Create Private Security Group
SG_PRIVATE_NAME='da-c02-private-sg';
SG_PRIVATE_ID=$(aws ec2 create-security-group \
    --group-name $SG_PRIVATE_NAME \
    --description 'SSH access only from public instances on AWS' \
    --vpc-id $VPC_ID \
    --tag-specifications "ResourceType=security-group,Tags=[{Key=Name,Value=$SG_PRIVATE_NAME}]" \
    --query GroupId --output text)
    
aws ec2 authorize-security-group-ingress \
    --group-id $SG_PRIVATE_ID \
    --protocol tcp --port 22 \
    --source-group $SG_PUBLIC_ID

# Check Private Security Group  
aws ec2 describe-security-groups --group-id $SG_PRIVATE_ID
# Output:
{
    "SecurityGroups": [
        {
            "Description": "SSH access only from public instances on AWS",
            "GroupName": "da-c02-private-sg",
            "IpPermissions": [
                {
                    "FromPort": 22,
                    "IpProtocol": "tcp",
                    "IpRanges": [],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 22,
                    "UserIdGroupPairs": [
                        {
                            "GroupId": "sg-03c842207ddde4f96",
                            "UserId": "421117346104"
                        }
                    ]
                }
            ],
            "OwnerId": "************",
            "GroupId": "sg-08b73628e191c4bd8",
            "IpPermissionsEgress": [
                {
                    "IpProtocol": "-1",
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "UserIdGroupPairs": []
                }
            ],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "da-c02-private-sg"
                }
            ],
            "VpcId": "vpc-02ec2836691642ace"
        }
    ]
}

# Clean when needless
aws ec2 delete-security-group --group-id $SG_PUBLIC_ID
aws ec2 delete-security-group --group-id $SG_PRIVATE_ID
```

- Any extra challenges faced?

Well.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)