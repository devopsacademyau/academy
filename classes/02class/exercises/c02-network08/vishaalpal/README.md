# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Inbound rules apply to ingress traffic for subnets in your vpc. 
    Outbound rules apply to egress traffic for subnets in your vpc.
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    Everything is allowed. 
    ```
    

- Commands for creating a NACL to block SSH connection coming from the network `172.16.200.0/24`?

```
Command:
aws ec2 create-network-acl-entry \
  --cidr-block 172.16.200.0/24 \
  --ingress \
  --network-acl-id acl-0d76b73b027deb510 \
  --port-range From=22,To=22 \
  --protocol tcp \
  --rule-action deny \
  --rule-number 80 \
  --region ap-southeast-2
```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```
aws ec2 create-network-acl-entry \
  --cidr-block 180.200.50.0/24 \
  --egress \
  --network-acl-id acl-0d76b73b027deb510 \
  --protocol -1 \
  --rule-action deny \
  --rule-number 80 \
  --region ap-southeast-2
```

- Any extra challenges faced?

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/80a940b39bc3ae40378abe7af015cb3c207463f6/classes/02class/exercises/c02-network08/README.md)

