# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
tags=(--tag-specifications                  
    'ResourceType=internet-gateway,Tags=[
    {Key=Name,Value=ccr-dojo-igw}
    ]') 
&& \
aws ec2 create-internet-gateway \
"${tags[@]}"


aws ec2 attach-internet-gateway \
    --internet-gateway-id igw-0d56c5e329dae9da4 \
    --vpc-id vpc-091f1866ec064400e

```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)