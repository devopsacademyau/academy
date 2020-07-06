# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Inbound traffic means incoming traffic to the subnet.
    Outbound traffic means outgoing traffic from the subnet
    ```
    
  - What is going to happen by default? Everything allowed or denied?
  
  ```
   By Default NACL allows all incoming and outgoing traffic
  ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```

> aws ec2 create-network-acl-entry --network-acl-id acl-04d34ee4d2c6c0a43 --cidr-block 172.16.200.0/24 --ingress --protocol tcp --port-range From=22,To=22 --rule-action deny --rule-number 40 

```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```
aws ec2 create-network-acl-entry --network-acl-id acl-04d34ee4d2c6c0a43 --cidr-block 180.200.50.0/24 --egress --protocol -1  --rule-action deny --rule-number 40
```

- Any extra challenges faced?
```
No challenges faced
````

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network08/README.md)