# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Inbound means incoming traffic coming to your EC2 instances in a specific subnet.
    Outbound means outgoing traffic from your EC2 instances .
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    Since the NACL is stateless, the rule number(100) take over the precedence (*)and everything is allowed with 0.0.0.0/0
    ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```
aws ec2 create-network-acl-entry --network-acl-id acl-3e73c758 --ingress --rule-number 99 --protocol tcp --port-range From=22,To=22 --cidr-block 172.16.200.0/24 --rule-action DENY
```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```
aws ec2 create-network-acl-entry --network-acl-id acl-3e73c758 --egress --rule-number 98 --protocol -1 --port-range  --cidr-block 180.200.50.0/24 --rule-action DENY
```

- Any extra challenges faced?
No 

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network08/README.md)