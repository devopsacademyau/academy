# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    for a network of 10.0.0.0/16 
    inbound is traffic who's destination is 10.0.0.0/16
    outbound is traffic who's source is 10.0.0.0/16
    i.e inbound is traffic coming into the network, outbound is traffic leaving the network
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    The first rule in the default network ACL allows all traffic 
    the 2nd rule blocks any packets that do not match a numbered rule
    
    ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```
aws ec2 create-network-acl-entry \
--network-acl-id acl-03b50a88193f0a5e8 \
--ingress --rule-number 110 \
--protocol tcp --port-range From=22,To=22 \
--cidr-block 172.16.200.0/24 --rule-action deny
```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```
aws ec2 create-network-acl-entry \
--network-acl-id acl-03b50a88193f0a5e8 \
--egress --rule-number 120 \
--protocol "-1" --port-range From=22,To=22 \
--cidr-block 180.200.50.0/24 --rule-action deny 
```

- Any extra challenges faced?

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/80a940b39bc3ae40378abe7af015cb3c207463f6/classes/02class/exercises/c02-network08/README.md)