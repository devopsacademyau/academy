# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Inbound refers to traffic coming-in to a network.Inbound rules filter traffic passing from other network to the local computer/instance based on the filtering conditions specified in the rule

    Outbound traffic refers to traffic going-out of a network.Outbound rules filter traffic passing from the local computer to other network based on the filtering conditions specified in the rule.
    
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    An AWS created default NACL has default rules that allow all inbound and outbound traffic. However, unlike default NACLs, a custom NACL has no allow-all rules, so the deny-all rule matches traffic instead.
   
    ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```
aws ec2 create-network-acl-entry \
 --network-acl-id acl-05783519e8a3187ca \
 --ingress --rule-number 101 \
 --protocol tcp --port-range From=22,To=22 \
 --cidr-block 172.16.200.0/24 \
 --rule-action deny

```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```
aws ec2 create-network-acl-entry \
 --network-acl-id acl-05783519e8a3187ca \
 --egress --rule-number 101 \
 --protocol -1\
 --cidr-block 180.200.50.0/24 \
 --rule-action deny

```

- Any extra challenges faced?
Not for this exercise

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network08/README.md)
