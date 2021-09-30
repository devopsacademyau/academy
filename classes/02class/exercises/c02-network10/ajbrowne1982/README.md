# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
aws ec2 create-network-interface --subnet-id subnet-07e70965ce6402328 --description "ENI Private A" --groups sg-0826h53af0fc5782b --private-ip-address 172.33.1.15 --tag-specifications 'ResourceType=network-interface,Tags=[{Key=Name,Value=ab-dojo-eni}]'
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)