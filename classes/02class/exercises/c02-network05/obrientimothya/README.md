# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
VPC="vpc-09a3c6830a6d58479"
IGW=$(aws ec2 create-internet-gateway --profile tobrien | awk '{print $2}')
aws ec2 create-tags --resources "${IGW}" --tags "Key=Name,Value=devopsacademy-igw" --profile tobrien
aws ec2 attach-internet-gateway --internet-gateway-id "${IGW}" --vpc-id "${VPC}" --profile tobrien

OUTPUT
Nil, unless failure.
```

- Any extra challenges faced? Nil


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)
