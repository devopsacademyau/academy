# c02-network08

## Commands Execution Output

- Answer the following questions

  - What is the difference between inbound x outbound?

    ```
    **Inbound** -> It is related to traffic that my EC2 instance will receive from some client.
    **Outbound** -> It is related to traffic that goes out of my EC2 instance, for example, to connect to internet.
    ```

  - What is going to happen by default? Everything allowed or denied?

    ```
    Well, According our classes and the documentation, security group controls the inbound and also outbound traffic. But by default, all security (default) security allows all outbound traffic. And you are able to manage somes rules. But if you create a custom network-acl it will deny anything.
    ```

* Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```bash

## Creating ACK
# VPC ID vpc-074c260483405f2bb
aws ec2 create-network-acl --vpc-id vpc-074c260483405f2bb
# Output
NETWORKACL      False   acl-0844c22e01b3187d8   478433196210    vpc-074c260483405f2bb
ENTRIES 0.0.0.0/0       True    -1      deny    32767
ENTRIES 0.0.0.0/0       False   -1      deny    32767
## Inbound rule for
aws ec2 create-network-acl-entry --ingress --network-acl-id acl-0844c22e01b3187d8 --protocol 6 --rule-action  deny --rule-number 1 --port-range From=22,To=22--cidr-block 172.16.200.0/24
# output
none
```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```bash
## Outbound
aws ec2 create-network-acl-entry --egress --network-acl-id acl-0844c22e01b3187d8 --protocol -1 --rule-action deny --rule-number 2 --cidr-block 180.200.50.0/24
# Output
none


## Result
aws ec2 describe-network-acls --filters Name=network-acl-id,Values=acl-0844c22e01b3187d8
# Output
NETWORKACLS     False   acl-0844c22e01b3187d8   478433196210    vpc-074c260483405f2bb
ENTRIES 180.200.50.0/24 True    -1      deny    2
ENTRIES 0.0.0.0/0       True    -1      deny    32767
ENTRIES 172.16.200.0/24 False   6       deny    1
PORTRANGE       22      22
ENTRIES 0.0.0.0/0       False   -1      deny    32767
```

- Any extra challenges faced?

  > 1. Remember which protocol use on each exercise "). The second one is supposed to deny all acess to external network, I used -1

  > 2. Filter nack by id

---

Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network08/README.md)
