# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

| Security Group Name | Rule    | Type            | Port Range | Source                   | Description                                  |
| ------------------- | ------- | --------------- | ---------- | ------------------------ | -------------------------------------------- |
| public-sg           | inbound | Custom TCP Rule | 22         | `<your-home-ip-address>` | SSH access from home to AWS                  |
| private-sg          | inbound | Custom TCP Rule | 22         | `<public-sg-id>`         | SSH access only from public instances on AWS |

```bash
## Create security group
aws ec2 create-security-group --group-name public-sg --description "SSH access from home to AWS" --vpc-id vpc-074c260483405f2bb --tag-specifications 'ResourceType="security-group",Tags=[{Key="Name",Value="public-sg"}]'
# Output
sg-0cff452c56f306f2c
TAGS    Name    public-sg

## Create security group
aws ec2 create-security-group --group-name private-sg --description "SSH access only from public instances on AWS" --vpc-id vpc-074c260483405f2bb --tag-specifications 'ResourceType="security-group",Tags=[{Key="Name",Value="private-sg"}]'
# Output
sg-0d571c8f620bcc7e0
TAGS    Name    private-sg

## Allow ingress from my IP
aws ec2 authorize-security-group-ingress --group-id sg-0cff452c56f306f2c --protocol tcp --port 22 --cidr 147.10.74.240/32
# Output
none

## Allow ingress from public instances on my AWS
aws ec2 authorize-security-group-ingress --group-id sg-0d571c8f620bcc7e0 --protocol tcp --port 22 -source-group sg-0cff452c56f306f2c
# Output
none
```

- Any extra challenges faced?

> 1. Find what is `<my-home-ip-address>`. Aaahh, my ip from my machine that I am using right now... my broaden understanding...

> 2. I could not use --group-name private-sg/public-sg
>    Example:
>    aws ec2 authorize-security-group-ingress --group-name public-sg --protocol tcp --port 22 --cidr 147.10.74.240/32
>    I got: `The security group 'public-sg' does not exist in default VPC 'vpc-37d4dd50'`, so I change to --group-id and it was solved. It also was trying to access my default VPC and It was not what that I wanted.

---

Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)
