# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
aws ec2 create-network-interface \
--subnet-id subnet-04b06cb9a346fc451 \
--groups sg-0d1945a56ef5a5894 \
--private-ip-address 10.88.11.9
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)