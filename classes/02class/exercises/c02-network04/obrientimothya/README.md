# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
VPC="vpc-09a3c6830a6d58479"
PRIVATECIDRS=(10.0.0.0/24 10.0.2.0/24 10.0.4.0/24)
PUBLICCIDRS=(10.0.1.0/24 10.0.3.0/24 10.0.5.0/24)
ZONES=(ap-southeast-2a ap-southeast-2b ap-southeast-2c)
i=1
for ZONE in "${ZONES[@]}"; do
    aws ec2 create-subnet --profile tobrien \
        --vpc-id "${VPC}" \
        --cidr-block "${PRIVATECIDRS[i]}" \
        --availability-zone "${ZONE}" | \
    awk '{print $12}' | \
    xargs -I {} aws ec2 create-tags --resources {} --tags "Key=Name,Value=private-${ZONE: -1}" --profile tobrien
    aws ec2 create-subnet --profile tobrien \
        --vpc-id "${VPC}" \
        --cidr-block "${PUBLICCIDRS[i]}" \
        --availability-zone "${ZONE}" | \
    awk '{print $12}' | \
    xargs -I {} aws ec2 create-tags --resources {} --tags "Key=Name,Value=public-${ZONE: -1}" --profile tobrien
   ((i++))
done


OUTPUT

No output, unless it fails.
```

- Any extra challenges faced? Nil


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)
