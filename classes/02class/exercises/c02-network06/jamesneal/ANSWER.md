# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
aws ec2 allocate-address > eip.txt
aws ec2 create-nat-gateway --subnet-id <pub subnet> --allocation <elastic ip id>
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)