# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Inbound controlls traffic originating from outside the vpc. Outbound controlls traffic originating from inside of vpc
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    Everything is allowed by default.
    ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```
aws ec2 create-network-acl-entry \
  --network-acl-id	acl-030ca159fc180eff4 \
  --ingress \
  --rule-number 90 \
  --protocol tcp \
  --port-range From=22,To=22 \
  --cidr-block 172.16.200.0/24 \
  --rule-action deny

  
```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```
aws ec2 create-network-acl-entry \
  --network-acl-id	acl-030ca159fc180eff4 \
  --egress \
  --rule-number 90 \
  --protocol all \
  --cidr-block 180.200.50.0/24 \
  --rule-action deny

```

- Any extra challenges faced?

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/80a940b39bc3ae40378abe7af015cb3c207463f6/classes/02class/exercises/c02-network08/README.md)