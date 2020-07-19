# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Inbound rules are applied to traffic entering the VPC (eg. from the internet or other)
    Outbound rules are applied to traffic leaving the VPC (eg. to the internet or other)

    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    Everything (0.0.0.0/0) is set to hit an ALLOW rule first. Therefore, everything allowed by default.
    ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```
NACL="acl-0833839fd60089d6c"
aws ec2 create-network-acl-entry \
    --network-acl-id "${NACL}" \
    --rule-number 10 \
    --ingress \
    --protocol tcp \
    --port-range From=22,To=22 \
    --cidr-block 172.16.200.0/24 \
    --rule-action deny \
    --profile tobrien
```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```
NACL="acl-0833839fd60089d6c"
aws ec2 create-network-acl-entry \
    --network-acl-id "${NACL}" \
    --rule-number 10 \
    --egress \
    --protocol -1 \
    --cidr-block 180.200.50.0/24 \
    --rule-action deny \
    --profile tobrien
```

- Any extra challenges faced? Nil

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/80a940b39bc3ae40378abe7af015cb3c207463f6/classes/02class/exercises/c02-network08/README.md)
