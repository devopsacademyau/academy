# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Inbound traffic is traffic that is coming into the network, eg. from an external source
    Outbound traffic is traffic that is exiting from the network
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    Everything is allowed since there is an explicit allow all with a higher priority than the deny all.
    The priority resolves from lowest value first. Such that rule number 1 would take precedence over rule number 2 etc.
    ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

Block ingress on port 22 with a higher priority than the allow all rule.
```yaml
aws ec2 create-network-acl-entry \
  --network-acl-id acl-030ca159fc180eff4 \
  --cidr-block 172.16.200.0/24 \
  --ingress --protocol tcp \
  --port-range From=22,To=22 \
  --rule-action deny --rule-number 99
```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

Block egress with a higher priority than the allow all rule.
```yaml
aws ec2 create-network-acl-entry \
  --network-acl-id acl-030ca159fc180eff4 \
  --cidr-block 180.200.50.0/24 \
  --egress --protocol -1 \
  --rule-action deny --rule-number 99
```

- Any extra challenges faced?

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/80a940b39bc3ae40378abe7af015cb3c207463f6/classes/02class/exercises/c02-network08/README.md)