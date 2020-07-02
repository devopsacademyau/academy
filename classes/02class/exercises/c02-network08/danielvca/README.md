
# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Inbound is the traffic TO the network and outbound is FROM the network
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    Everything allowed
    ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```
aws ec2 create-network-acl-entry --network-acl-id acl-08696fca176bb4c10 --ingress --rule-number 10 --protocol tcp --port-range From=22,To=22 --cidr-block 172.16.200.0/24 --rule-action deny

No output
```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```
aws ec2 create-network-acl-entry --network-acl-id acl-08696fca176bb4c10 --egress --rule-number 10 --protocol -1 --cidr-block 180.200.50.0/24 --rule-action deny

No output
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network08/README.md)


