# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|-|-|-|-|-|-|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
$ aws ec2 create-security-group \
    --group-name public-sg \
    --description "SSH access from home to AWS" \
    --vpc-id vpc-027019faaf6756407

GroupId: sg-035e5a3df769a4114

$ aws ec2 authorize-security-group-ingress \
    --group-id sg-035e5a3df769a4114 \
    --cidr 122.148.135.233/32 \
    --port 22 \
    --protocol tcp

$ aws ec2 describe-security-groups --group-ids sg-035e5a3df769a4114
SecurityGroups:
- Description: SSH access from home to AWS
  GroupId: sg-035e5a3df769a4114
  GroupName: public-sg
  IpPermissions:
  - FromPort: 22
    IpProtocol: tcp
    IpRanges:
    - CidrIp: 122.148.135.233/32
    Ipv6Ranges: []
    PrefixListIds: []
    ToPort: 22
    UserIdGroupPairs: []
  IpPermissionsEgress:
  - IpProtocol: '-1'
    IpRanges:
    - CidrIp: 0.0.0.0/0
    Ipv6Ranges: []
    PrefixListIds: []
    UserIdGroupPairs: []
  OwnerId: '097922957316'
  VpcId: vpc-027019faaf6756407

$ aws ec2 create-security-group \
    --group-name private-sg \
    --description "SSH access only from public instances on AWS" \
    --vpc-id vpc-027019faaf6756407
GroupId: sg-0f2326bb3047f4894


$ aws ec2 authorize-security-group-ingress \
    --group-id sg-0f2326bb3047f4894 \
    --source-group sg-035e5a3df769a4114 \
    --port 22 \
    --protocol tcp

$ aws ec2 describe-security-groups --group-ids sg-0f2326bb3047f4894

SecurityGroups:
- Description: SSH access only from public instances on AWS
  GroupId: sg-0f2326bb3047f4894
  GroupName: private-sg
  IpPermissions:
  - FromPort: 22
    IpProtocol: tcp
    IpRanges: []
    Ipv6Ranges: []
    PrefixListIds: []
    ToPort: 22
    UserIdGroupPairs:
    - GroupId: sg-035e5a3df769a4114
      UserId: '097922957316'
  IpPermissionsEgress:
  - IpProtocol: '-1'
    IpRanges:
    - CidrIp: 0.0.0.0/0
    Ipv6Ranges: []
    PrefixListIds: []
    UserIdGroupPairs: []
  OwnerId: '097922957316'
  VpcId: vpc-027019faaf6756407

```

- Any extra challenges faced?

```
I tried to use group-name instead of group-id as the source for private-sg rule. However, when using group-name the aws-cli refers to the default vpc rather than the vpc set when the security group were created.
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)