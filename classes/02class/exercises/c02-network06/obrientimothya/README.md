# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
SUBNET="subnet-0038a09635262c6ff"
EIP=$(aws ec2 allocate-address --profile tobrien | awk '{print $1}')
NGW=$(aws ec2 create-nat-gateway --subnet-id "${SUBNET}" --allocation-id "${EIP}" --profile tobrien | awk 'NR==1{print $4}')
aws ec2 create-tags --resources "$NGW" --tags "Key=Name,Value=devopsacademy-ngw" --profile tobrien
```

- Any extra challenges faced? Nil


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)
