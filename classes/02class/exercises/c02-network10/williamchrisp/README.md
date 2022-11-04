# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
aws --region us-east-1 ec2 create-network-interface --subnet-id subnet-00db188044e05de82 --description "my private network interface" --groups sg-0d910059011b3c004 --private-ip-address 192.168.0.10

```

- Any extra challenges faced?


***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)