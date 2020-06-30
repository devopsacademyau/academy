# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Inbound Rules are for traffic incoming to the subnet to which the NACLs are attached. 
    Outbound Rules are for the traffic leaving the subnet to which the NACLs are attached. i
    By default, the default NACLs  allow ALL inbound and outbound traffic. 
    But for custom NACLs(devopsacademy-nacls),by default ALL inbound and outbound traffic is denied till RULES are added.
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    By default, the default NACLs allow ALL inbound and outbound traffic to/from the subnet to which it is attached. 
    But for custom NACLs(devopsacademy-nacls),by default ALL inbound and outbound traffic to/from the subnet is denied till RULES are added.
    ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

    ```
    > aws ec2 create-network-acl-entry --cidr-block 172.16.200.0/24 --ingress --network-acl-id acl-087151bf5955637aa --port-range From=22,To=22 --protocol tcp --rule-action deny --rule-number 102 	
   
    > aws ec2 describe-network-acls

      {
                    "CidrBlock": "172.16.200.0/24",
                    "Egress": false,
                    "PortRange": {
                        "From": 22,
                        "To": 22
                    },
                    "Protocol": "6",
                    "RuleAction": "deny",
                    "RuleNumber": 102
                },

    ```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

    ```
    > aws ec2 create-network-acl-entry --cidr-block 180.200.50.0/24  --egress --network-acl-id acl-087151bf5955637aa --protocol "-1" --rule-action deny --rule-number 103 

    > aws ec2 describe-network-acls 

           {
                    "CidrBlock": "180.200.50.0/24",
                    "Egress": true,
                    "Protocol": "-1",
                    "RuleAction": "deny",
                    "RuleNumber": 103
                },
 
    ```

- Any extra challenges faced?

 No Challenges

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network08/README.md)
