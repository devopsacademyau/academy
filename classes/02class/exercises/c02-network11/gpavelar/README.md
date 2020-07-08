# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
Add your commands and their outputs here
```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
Add your commands and their outputs here
```

- Commands for accessing your public instance using ssh

```
Add your commands and their outputs here
```

- Commands for accessing your private instance from public one

```
Add your commands and their outputs here
```

- Commands for testing ping to `8.8.8.8` from private instance

```
Add your commands and their outputs here
```

- Any extra challenges faced?

### Objectives

1. Test all previous step
2. Launch EC2 instance.

### Commands

- aws ec2 create-security-group

Creates a network ACL in a VPC. Network ACLs provide an optional layer of security (in addition to security groups) for the instances in your VPC.

Obligatory arguments :

| Parameter            | Description        |
| :------------------- | :----------------- |
| --description        |                    |
| --group-name         |                    |
| --vpc-id             | The ID of the VPC. |
| --tag-specifications |                    |

<!-- Don't change anything below this point-->

---

Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)
