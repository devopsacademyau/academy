# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Add your answer here
    ```
    Inbound is network traffic comming into your network from external sources. Outbound is traffic leaving from from your resources. 

  - What is going to happen by default? Everything allowed or denied?
    ```
    All traffic inbound and outbound will be allowed if using the default NACL
    ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```
Add your commands and their outputs here
```
  aws ec2 create-network-acl-entry --network-acl-id acl-5fb85d36 --ingress --rule-number 90 --protocol tcp --port-range from=22,to=22 --cidr-block 172.16.200.0/24 --rule-action deny

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```
Add your commands and their outputs here
```
  aws ec2 create-network-acl-entry --network-acl-id acl-5fb85d36 --egress --rule-number 90 --protocol -1 --cidr-block 180.200.50.0/24 --rule-action deny

- Any extra challenges faced?

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/80a940b39bc3ae40378abe7af015cb3c207463f6/classes/02class/exercises/c02-network08/README.md)