# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?

    ```
    Inbound is the traffic that comes from an external source into our network, and outbound is the opposite (which means it is the traffic leaving our network to an external source).
    ```

  - What is going to happen by default? Everything allowed or denied?

    ```
    By default all traffic is allowed
    ```

* Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

  ```
  aws ec2 create-network-acl-entry --network-acl-id acl-0c3bfff9f96774e7f --ingress --rule-number 99 --protocol tcp --port-range from=22,to=22 --cidr-block 172.16.200.0/24 --rule-action deny
  ```

* Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

  ```
  aws ec2 create-network-acl-entry --network-acl-id acl-0c3bfff9f96774e7f --egress --rule-number 99 --protocol -1 --cidr-block 180.200.50.0/24 --rule-action deny
  ```

* Any extra challenges faced?
  none

---

Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network08/README.md)
