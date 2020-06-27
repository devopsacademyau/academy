# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Inbound is the traffic that flows from external resources to VPCs (receiving), outbound is the traffic that flows from VPC resources to external resources (sending).
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    * VPCs come automatically with modifiable NACLs that allow all inbound and outbound traffic by default.
    * Custom NACLs deny all inbound and outbound traffic by default, unless specific rules are added.
    ```

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```
$ aws ec2 create-network-acl-entry --network-acl-id acl-0dfe3765315dc6f3f --ingress --rule-number 101 --protocol tcp --port-range From=22,To=22 --cidr-block 172.16.200.0/24 --rule-action deny
```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```
$ aws ec2 create-network-acl-entry --network-acl-id acl-0dfe3765315dc6f3f --egress --rule-number 101 --protocol -1 --cidr-block 180.200.50.0/24 --rule-action deny
```

- Any extra challenges faced?
Not for this exercise.

***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network08/README.md)
