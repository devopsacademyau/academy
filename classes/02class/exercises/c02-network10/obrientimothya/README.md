# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
SUBNET="subnet-054b35b29f8a0b7b8"
aws ec2 create-network-interface \
    --private-ip-address 10.0.0.100 \
    --subnet-id "${SUBNET}" \
    --profile tobrien

OUTPUT

NETWORKINTERFACE	ap-southeast-2a		interface	06:24:ce:b6:8c:96	eni-0f34b7548156621a4	437637330966	10.0.0.100	AIDAWLZJXXALI7X762ZEV	False	True	pending	subnet-054b35b29f8a0b7b8	vpc-09a3c6830a6d58479
GROUPS	sg-09b85019578b25de6	default
PRIVATEIPADDRESSES	True	10.0.0.100
```

- Any extra challenges faced? Nil


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)
