# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    
    Inbound means incoming traffic to the network/resource
    Outbound means outcoming traffic to the network/resource to outside 

    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    By default is everything allowed.

    ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```

aws ec2 create-network-acl-entry --network-acl-id acl-00bfa7740b425af68 --ingress --rule-number 50 --protocol tcp --port-range From=22,To=22 --cidr-block 172.16.200.0/24 --rule-action deny

```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```

aws ec2 create-network-acl-entry --network-acl-id acl-00bfa7740b425af68 --egress --rule-number 50 --protocol tcp --port-range From=22,To=22 --cidr-block 180.200.50.0/24 --rule-action deny

```

- Any extra challenges faced?

Yes, still dont understand properly what would be the rule number, if that is just a random number or means something. The AWS documentation for creating the acl entry lack of explanation of what would be this rule number. 

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network08/README.md)