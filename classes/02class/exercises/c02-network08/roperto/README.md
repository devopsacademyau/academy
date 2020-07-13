# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Inbound filters packets arriving in the network, outbound filters packets leaving the network.
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    The NACL automatically created will allow all traffic because it has an 'allow all' rule.
    
    If all rules were deleted, then the default behavior would be to deny all traffic (deny all default rule).
    ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```shell script
NACL=acl-0db01b37de932e6db

aws ec2 create-network-acl-entry --rule-number 50 --cidr-block 172.16.200.0/24 --ingress --network-acl-id $NACL --protocol tcp --port-range From=22,To=22 --rule-action deny
```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```shell script
aws ec2 create-network-acl-entry --rule-number 50 --cidr-block 180.200.50.0/24 --egress --network-acl-id $NACL --protocol -1 --port-range From=-1,To=-1 --rule-action deny
```

- Any extra challenges faced?

> I used "any" as protocol instead of "-1" because that is a valid ALIAS in terraform. Easy to fix.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network08/README.md)