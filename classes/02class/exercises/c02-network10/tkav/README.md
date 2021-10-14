# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
aws ec2 create-network-interface \
    --description "tk-dojo-eni" \
    --subnet-id subnet-0034d8bc2e6165ad7 \
    --private-ip-address 10.128.20.10 \
    --groups sg-0ede42a137608a804
```

- Any extra challenges faced?

Ensuring the subnet and security group ids are correct

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)