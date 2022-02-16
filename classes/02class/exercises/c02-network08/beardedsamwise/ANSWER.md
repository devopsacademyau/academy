# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Inbound traffic is inbound to the network the NACL is attached to (ie. the source is external)
    Outbound traffic is outbound from the network teh NACL is attache do (ie. the destination is external)
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    Everything is allowed (this is the default behaviour for the default NACL)
    ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```
aws ec2 create-network-acl-entry --network-acl-id acl-0f0e066282b3abb18 --ingress --rule-number 50 --protocol tcp --port-range From=22,To=22 --cidr-block 172.16.200.0/24 --rule-action deny
```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```
aws ec2 create-network-acl-entry --network-acl-id acl-0f0e066282b3abb18 --egress --rule-number 50 --protocol -1 --cidr-block 180.200.50.0/24 --rule-action deny
```

- Any extra challenges faced?

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/80a940b39bc3ae40378abe7af015cb3c207463f6/classes/02class/exercises/c02-network08/README.md)