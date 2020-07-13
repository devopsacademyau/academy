# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```bash
## I ll be following the steps form class 01 - aws 101

## Public subnets IDs: subnet-0f867dac87c7e75b4, subnet-01ef5462d19df360c, subnet-01ac1852278e631c7


## Run instance on my subnet and public security group (SG)
## SG = sg-0cff452c56f306f2c
## subnet id = subnet-01ac1852278e631c7

aws ec2 run-instances \
  --image-id ami-020d764f9372da231 \
  --count 1 \
  --instance-type t2.micro \
  --key-name devops-class \
  --subnet-id subnet-08da4676baf658cb2 \
  --security-group-ids sg-0cff452c56f306f2c

## Output


## Describe instance
aws ec2 describe-instances \
    --instance-ids  --output json

# Output

```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```bash

## Private subnets IDs: subnet-08da4676baf658cb2, subnet-09383d1e51392c852, subnet-0d78ad19a4b86f369

## private security group = sg-0d571c8f620bcc7e0
## private subnet = subnet-0d78ad19a4b86f369
## ENI eni-03cf44676961d7903

## Run instance
aws ec2 run-instances \
  --image-id ami-020d764f9372da231 \
  --count 1 \
  --instance-type t2.micro \
  --key-name devops-class \
  --network-interfaces '[{"NetworkInterfaceId":"eni-03cf44676961d7903","DeviceIndex":0}]'

# Output


# or
## Attach network interface to an instance
# aws ec2 attach-network-interface --network-interface-id <eni-isntance> --instance-id <instance_id> --device-index 0


```

- Commands for accessing your public instance using ssh

```bash
## I already added my SSH Agent.
ssh -A ec2-user@<ip>

# Output
```

- Commands for accessing your private instance from public one

```bash

## Ssh
ssh ec2-user@<private-instance-ip>

# Output
```

- Commands for testing ping to `8.8.8.8` from private instance

```bash
## Testing ping
ping 8.8.8.8

# output
Add your commands and their outputs here
```

- Any extra challenges faced?

  > 1. Know that there is a option on EC2 run-instances command that allow run instance using ENI. `--network-interfaces`. Format of this option as well.

  > 2. Check what is missing that my connection was not working. So, I created everything again rs.

---

Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)
