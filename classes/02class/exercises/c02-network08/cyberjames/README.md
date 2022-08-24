# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    The `Inbound` is to control the traffic that flows from outside to inside of the VPC network.
    While the `Outbound` is to control the traffic that flows from inside to outside of the VPC network.
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    The default rule is to allow all Inbound and Outbound traffic.
    ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```
aws ec2 create-network-acl-entry \
--network-acl-id acl-06f697b06736b4e97 \
--ingress \
--rule-number 99 \
--protocol tcp \
--port-range From=22,To=22 \
--cidr-block 172.16.200.0/24 \
--rule-action deny
```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```
aws ec2 create-network-acl-entry \
--network-acl-id acl-06f697b06736b4e97 \
--egress \
--rule-number 99 \
--protocol "-1" \
--cidr-block 180.200.50.0/24 \
--rule-action deny
```

- Any extra challenges faced?

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/80a940b39bc3ae40378abe7af015cb3c207463f6/classes/02class/exercises/c02-network08/README.md)