# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Every subnet is associated to at least a single NACL. Any traffic into the subnet and out of the subnet should
    go through its associated NACL. Inbound rules applied to the traffic comes into the subnet and outbound rules applied
    to the traffic going out of the subnet. Since NACLs are stateless, we have to specify both inbound and outbound rules.

    ```

  - What is going to happen by default? Everything allowed or denied?
    ```
    NACL rules are evaluated from the least number and once there is a
    match then evaluation stops. In the default NACL, rule 100 allowes everything in and out. Hence by default
    everything is allowed.
    ```


- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```
> aws ec2 create-network-acl-entry \
    --network-acl-id acl-06e9d04a427fe2c15 \
    --ingress \
    --rule-number 10 \
    --protocol tcp \
    --port-range From=22,To=22 \
    --cidr-block 172.16.200.0/24 \
    --rule-action deny

```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```
> aws ec2 create-network-acl-entry \
    --network-acl-id acl-06e9d04a427fe2c15 \
    --egress \
    --rule-number 10 \
    --protocol "-1" \
    --cidr-block 180.200.50.0/24 \
    --rule-action deny

```

- Any extra challenges faced?
```
- None
```
<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network08/README.md)