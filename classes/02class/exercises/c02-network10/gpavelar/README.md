# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```bash
## Create ENI
aws ec2 create-network-interface --subnet-id subnet-08da4676baf658cb2 --description "my private network interface" --private-ip-address 10.0.1.17

# Output
NETWORKINTERFACE        ap-southeast-2a my private network interface    interface       06:30:76:8d:ed:e8       eni-03cf44676961d7903   478433196210    10.0.1.17       AIDAW6ZGXHCZC7ESLQHIS   False   True    pending subnet-08da4676baf658cb2        vpc-074c260483405f2bb
GROUPS  sg-00e6b83ea1dccd737    default
PRIVATEIPADDRESSES      True    10.0.1.17
```

- Any extra challenges faced?

> Which groups should I use? --groups parameters is not obligatory

---

Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)
