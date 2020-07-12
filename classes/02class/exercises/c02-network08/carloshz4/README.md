# c02-network08

## Commands Execution Output

### Answer the following questions
  - What is the difference between inbound x outbound?
```  
Inbound refers to traffic going towards the network where the ACL is applied, whilst outbound refers to traffic going out of the network where the ACL is applied.
```
    
  - What is going to happen by default? Everything allowed or denied?
```
In this case, everything will be allowed by default as the rules are evaluated in numeric order and ALLOW all traffic happens first. 
```
    
- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```
aws ec2 create-network-acl-entry --network-acl-id acl-094eec50cd7a8020a \
--ingress --rule-number 99 \
--protocol tcp \
--port-range From=22,To=22 \
--cidr-block 172.16.200.0/24 \
--region ap-southeast-2 \
--rule-action deny
```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```
aws ec2 create-network-acl-entry --network-acl-id acl-094eec50cd7a8020a \
--egress --rule-number 99 \
--protocol -1 \
--port-range From=0,To=65535 \
--cidr-block 180.200.50.0/24 \
--region ap-southeast-2 \
--rule-action deny
```

- Any extra challenges faced?

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network08/README.md)