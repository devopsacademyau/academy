# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|-|-|-|-|-|-|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

https://docs.aws.amazon.com/cli/latest/reference/ec2/authorize-security-group-ingress.html


```
#create groups
z@bacon:~$ aws ec2 create-security-group  --group-name public-sg --description "SSH access from home to AWS" --vpc-id vpc-09d2f2719d50d1f7f
{
    "GroupId": "sg-02bf4e3d095f418fa"
}
z@bacon:~$ aws ec2 create-security-group  --group-name private-sg --description "SSH access only from public instances on AWS" --vpc-id vpc-09d2f2719d50d1f7f
{
    "GroupId": "sg-0f9b7a15d80e0ad02"
}
z@bacon:~$ aws ec2 describe-security-groups --filters Name=group-name,Values=*sg* Name=description,Values=*SSH* --query "SecurityGroups[*].{Name:GroupName,ID:GroupId,Description:Description}"
[
    {
        "Name": "public-sg",
        "ID": "sg-02bf4e3d095f418fa",
        "Description": "SSH access from home to AWS"
    },
    {
        "Name": "private-sg",
        "ID": "sg-0f9b7a15d80e0ad02",
        "Description": "SSH access only from public instances on AWS"
    }
]
#create rules

z@bacon:~$ aws ec2 authorize-security-group-ingress --group-id sg-02bf4e3d095f418fa  --protocol tcp  --port 22  --cidr 180.150.38.8/32

z@bacon:~$ aws ec2 authorize-security-group-ingress  --group-id sg-0f9b7a15d80e0ad02  --protocol tcp  --port 22 --source-group sg-02bf4e3d095f418fa

z@bacon:~$ aws ec2 describe-security-groups --filters Name=group-name,Values=*sg* Name=description,Values=*SSH* Name=ip-permission.from-port,Values=22 Name=ip-permission.to-port,Values=22 --query "SecurityGroups[*].{Name:GroupName,ID:GroupId,Description:Description}"
[
    {
        "Name": "public-sg",
        "ID": "sg-02bf4e3d095f418fa",
        "Description": "SSH access from home to AWS"
    },
    {
        "Name": "private-sg",
        "ID": "sg-0f9b7a15d80e0ad02",
        "Description": "SSH access only from public instances on AWS"
    }
]


```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)