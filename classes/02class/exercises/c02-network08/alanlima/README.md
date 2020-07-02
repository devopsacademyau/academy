# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Inbound: it controls incoming traffic TO EC2 instances. Ex.: traffic from local ssh terminal to EC2 instance.

    Outbound: it controls outbound traffic FROM EC2 instances. Ex.: traffic from the EC2 instance to an external database.
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    The default NACL allows everything by default.
    ```

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

    ```
    aws ec2 create-network-acl-entry \
        --network-acl-id acl-09de3ca4c1f1cd9d8 \
        --ingress \
        --cidr-block 172.16.200.0/24 \
        --protocol tcp \
        --rule-number 50 \
        --port-range From=22,To=22 \
        --rule-action deny
    ```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

    ```
    aws ec2 create-network-acl-entry \
        --network-acl-id acl-09de3ca4c1f1cd9d8 \
        --egress \
        --cidr-block 180.200.50.0/24 \
        --protocol tcp \
        --rule-number 50 \
        --port-range From=80,To=80 \
        --rule-action deny
    ```

- Any extra challenges faced?

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network08/README.md)