# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

| Security Group Name | Rule    | Type            | Port Range | Source                   | Description                                  |
| ------------------- | ------- | --------------- | ---------- | ------------------------ | -------------------------------------------- |
| public-sg           | inbound | Custom TCP Rule | 22         | `<your-home-ip-address>` | SSH access from home to AWS                  |
| private-sg          | inbound | Custom TCP Rule | 22         | `<public-sg-id>`         | SSH access only from public instances on AWS |

### Create a security group that allows for inbound connection on port 22 from my home ip address and has "SSH access from home to AWS" as de

```
aws ec2 create-security-group --vpc-id vpc-0c50c0a08b2a7dc7e --group-name public-sg --description "SSH access from home to AWS"

response:
{
    "GroupId": "sg-03b94ee3f607937f7"
}
```

- Creating security rule

  ```
  aws ec2 authorize-security-group-ingress --group-id sg-03b94ee3f607937f7 --protocol tcp --port 22 --cidr 203.219.215.205/32
  ```

- Creating the tag
  ```
  aws ec2 create-tags --resources sg-03b94ee3f607937f7 --tags Key=Name,Value=public-sg
  ```

### Create a security group that allows for inbound connection on port 22 from only public instances on AWS and has "SSH access only from public instances on AWS" as description

```
aws ec2 create-security-group --vpc-id vpc-0c50c0a08b2a7dc7e --group-name private-sg --description "SSH access only from home public instances on AWS"

response:
{
    "GroupId": "sg-0812b53af0fc5725c"
}
```

- Creating security rule

  ```
  aws ec2 authorize-security-group-ingress --group-id sg-0812b53af0fc5725c --source-group sg-03b94ee3f607937f7 --protocol tcp --port 22
  ```

- Creating the tag

  ```
  aws ec2 create-tags --resources sg-0812b53af0fc5725c --tags Key=Name,Value=private-sg
  ```

- Any extra challenges faced?

  none

---

Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)
