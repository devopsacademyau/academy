# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
# Create
NIC=$(aws ec2 create-network-interface --subnet-id subnet-06f1d3f2fc56b989a --private-ip-address 10.42.10.42 \
        --query NetworkInterface.NetworkInterfaceId --output text)
echo $NIC # eni-0240227d7a2417caf

# Delete
aws ec2 delete-network-interface --network-interface-id $NIC
```

- Any extra challenges faced?

> All good.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)