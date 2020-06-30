# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|-|-|-|-|-|-|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
## create public-sg and add rules

> aws ec2 create-security-group \
    --group-name public-sg \
    --vpc-id vpc-007774900b7f4c596 \
    --description "public security group"

    {
        "GroupId": "sg-0d522f9270aa71522"
    }

> aws ec2 authorize-security-group-ingress \
    --group-id sg-0d522f9270aa71522 \
    --ip-permissions IpProtocol=tcp,FromPort=22,ToPort=22,IpRanges='[{CidrIp=121.200.5.117/32,Description="SSH access from home to AWS"}]'

## create private-sg and add rules

> aws ec2 create-security-group \
    --group-name private-sg \
    --vpc-id vpc-007774900b7f4c596 \
    --description "private security group"

    {
        "GroupId": "sg-06519b6fe81ef49d3"
    }

> aws ec2 authorize-security-group-ingress --group-id sg-06519b6fe81ef49d3 --ip-permissions IpProtocol=tcp,FromPort=22,ToPort=22,UserIdGroupPairs='[{GroupId=sg-0d522f9270aa71522,Description="SSH access only from public instances on AWS"}]'

```

- Any extra challenges faced?
```
- Had to go out of the way to add a description to security group entry as there is no option as --description
- The security group entry command to add public-sg as the ingress source for private-sg had to be in a single line for AWS API to recognize it

```

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)