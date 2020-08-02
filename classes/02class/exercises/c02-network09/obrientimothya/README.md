# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|---|---|---|---|---|---|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
VPC="vpc-09a3c6830a6d58479"
MYIP=$(dig +short myip.opendns.com @resolver1.opendns.com)
PUBLIC=$(aws ec2 create-security-group \
    --group-name "public-sg" \
    --description "public security group" \
    --vpc-id "${VPC}" \
    --profile tobrien)
PRIVATE=$(aws ec2 create-security-group \
    --group-name "private-sg" \
    --description "private security group" \
    --vpc-id "${VPC}" \
    --profile tobrien)

aws ec2 authorize-security-group-ingress \
    --group-id "${PUBLIC}" \
    --ip-permissions IpProtocol=tcp,FromPort=22,ToPort=22,IpRanges='[{CidrIp='$MYIP'/32,Description="SSH access from home to AWS"}]' \
    --profile tobrien
aws ec2 authorize-security-group-ingress \
    --group-id "${PRIVATE}" \
    --protocol tcp \
    --port 22 \
    --source-group "${PUBLIC}" \
    --profile tobrien
    

```

- Any extra challenges faced? Nil


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)
