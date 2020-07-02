# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|-|-|-|-|-|-|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
###1st security group
aws ec2 create-security-group \
 --group-name public-sg \
 --description "SSH access from home to AWS" \
 --vpc-id vpc-081afcee350babdf5
>The command returns:
{
    "GroupId": "sg-040f4db337ffa4cbc"
}
aws ec2 authorize-security-group-ingress \
--group-id sg-040f4db337ffa4cbc --protocol tcp \
--port 22 --cidr 27.33.135.17/32

###2nd security group
aws ec2 create-security-group \
--group-name private-sg \
--description "SSH access only from public instances on AWS" \
--vpc-id vpc-081afcee350babdf5
>The command returns:
{
    "GroupId": "sg-0b64282ceb6c83fb0"
}
aws ec2 authorize-security-group-ingress \
--group-id sg-0b64282ceb6c83fb0 --protocol tcp \
--port 22 --source-group sg-040f4db337ffa4cbc


```

- Any extra challenges faced?
None for this exercise


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)