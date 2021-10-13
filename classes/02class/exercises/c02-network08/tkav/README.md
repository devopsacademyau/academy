# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Inbound refers to incoming traffic and which ports is allowed incoming traffic. Outbound refers to outgoing traffic and which ports traffic is allowed out.
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    All inbound is denied by default and outbound traffic is allowed by default. 
    ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

Add an inbound rule to Deny traffic from source 172.16.200.0/24
```
aws ec2 create-network-acl-entry \
    --network-acl-id acl-022c42e444c296f94 \
    --ingress \
    --rule-number 100 \
    --protocol tcp \
    --port-range From=22,To=22 \
    --cidr-block 172.16.200.0/24 \
    --rule-action deny
```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```
aws ec2 create-network-acl-entry \
    --network-acl-id acl-022c42e444c296f94 \
    --egress \
    --rule-number 200 \
    --protocol "-1" \
    --cidr-block 180.200.50.0/24 \
    --rule-action deny
```

- Any extra challenges faced?

Potential for conflicting NACL rules. As soon as a rule matches traffic, it's applied regardless of any higher-numbered rule that might contradict it.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/80a940b39bc3ae40378abe7af015cb3c207463f6/classes/02class/exercises/c02-network08/README.md)