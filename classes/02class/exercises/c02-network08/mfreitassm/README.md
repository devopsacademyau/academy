# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Inbound means incoming traffic coming to your EC2 instances. For that you have to add inbound rule. 
    Outbound means outgoing traffic from your EC2 instances. To connect internet or any browser you have to add outbound rule.
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
   	 When you create a security group, it has no inbound rules. Therefore, no inbound traffic originating from another host to your instance is allowed until you add inbound rules to the security group.

	By default, a security group includes an outbound rule that allows all outbound traffic. You can remove the rule and add outbound rules that allow specific outbound traffic only. If your security group has no outbound rules, no outbound traffic originating from your instance is allowed.
    ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```
creating a inbound rule  on the Network ACL
aws ec2 create-network-acl-entry --network-acl-id acl-0532655823f6cfb54 --ingress --rule-number 102 --protocol tcp --port-range From=53,To=53 --cidr-block 172.16.200.0/24 --rule-action deny

{
    "NetworkAcls": [
        
            "Entries": [
               
                {
                    "CidrBlock": "172.16.200.0/24",
                    "Egress": false,
                    "PortRange": {
                        "From": 53,
                        "To": 53
                    },
                    "Protocol": "6",
                    "RuleAction": "deny",
                    "RuleNumber": 102
                },
            ],
            "IsDefault": true,
            "NetworkAclId": "acl-0532655823f6cfb54",
            "Tags": [],
            "VpcId": "vpc-04426efcf5b2228a4",
            "OwnerId": "490308117505"
        }
    ]
}

```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```
aws ec2 create-network-acl-entry --network-acl-id acl-0532655823f6cfb54 --egress --rule-number 102 --protocol tcp --port-range From=50,To=50 --cidr-block 180.200.50.0/24 --rule-action deny

{
    "NetworkAcls": [
        
            "Entries": [
                 {
                    "CidrBlock": "180.200.50.0/24",
                    "Egress": true,
                    "PortRange": {
                        "From": 50,
                        "To": 50
                    },
                    "Protocol": "6",
                    "RuleAction": "deny",
                    "RuleNumber": 102
                },
       
            ],
            "IsDefault": true,
            "NetworkAclId": "acl-0532655823f6cfb54",
            "Tags": [],
            "VpcId": "vpc-04426efcf5b2228a4",
            "OwnerId": "490308117505"
        }
    ]
}
```

- Any extra challenges faced?
No

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network08/README.md)# c02-network08