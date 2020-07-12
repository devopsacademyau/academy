# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Inbound rules filters the traffic coming from external source to a specific resource (host/server). Outbound filters the traffic from a source to an external resource.
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    NACL evaluates the rules from the lowest to the highest numbers. Once a match if found, the other rules afterwards will not be evaluated.
    In this case in inbound and outbound by default, both rules are allowing everything. 
    ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```

aws ec2 describe-network-acls --query 'NetworkAcls[?VpcId==`vpc-03f503f58eb9f0512`]'
[
    {
        "Associations": [
            {
                "NetworkAclAssociationId": "aclassoc-abb0c1d6",
                "NetworkAclId": "acl-01987e9b6498287d4",
                "SubnetId": "subnet-0c8c5ca4ccda507ec"
            },
            {
                "NetworkAclAssociationId": "aclassoc-b84130c5",
                "NetworkAclId": "acl-01987e9b6498287d4",
                "SubnetId": "subnet-0b4a50329fd0bd8e3"
            },
            {
                "NetworkAclAssociationId": "aclassoc-6a532217",
                "NetworkAclId": "acl-01987e9b6498287d4",
                "SubnetId": "subnet-07ce524a39208f1d8"
            },
            {
                "NetworkAclAssociationId": "aclassoc-ef770692",
                "NetworkAclId": "acl-01987e9b6498287d4",
                "SubnetId": "subnet-0556ec1c9f6fc6007"
            },
            {
                "NetworkAclAssociationId": "aclassoc-a45d2cd9",
                "NetworkAclId": "acl-01987e9b6498287d4",
                "SubnetId": "subnet-0f271e61d48655e2d"
            },
            {
                "NetworkAclAssociationId": "aclassoc-05423378",
                "NetworkAclId": "acl-01987e9b6498287d4",
                "SubnetId": "subnet-07089ca5165659422"
            }
        ],
        "Entries": [
            {
                "CidrBlock": "0.0.0.0/0",
                "Egress": true,
                "Protocol": "-1",
                "RuleAction": "allow",
                "RuleNumber": 100
            },
            {
                "CidrBlock": "0.0.0.0/0",
                "Egress": true,
                "Protocol": "-1",
                "RuleAction": "deny",
                "RuleNumber": 32767
            },
            {
                "CidrBlock": "0.0.0.0/0",
                "Egress": false,
                "Protocol": "-1",
                "RuleAction": "allow",
                "RuleNumber": 100
            },
            {
                "CidrBlock": "0.0.0.0/0",
                "Egress": false,
                "Protocol": "-1",
                "RuleAction": "deny",
                "RuleNumber": 32767
            }
        ],
        "IsDefault": true,
        "NetworkAclId": "acl-01987e9b6498287d4",
        "Tags": [],
        "VpcId": "vpc-03f503f58eb9f0512",
        "OwnerId": "102825027349"
    }
]

aws ec2 create-network-acl-entry --network-acl-id acl-01987e9b6498287d4 --ingress --rule-number 20 --protocol tcp --port-range From=22,To=22 --cidr-block 172.16.200.0/24 --rule-action deny
```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```

aws ec2 create-network-acl-entry --network-acl-id acl-01987e9b6498287d4 --egress --rule-number 20 --protocol tcp --port-range From=80,To=80 --cidr-block 180.200.50.0/24 --rule-action deny

```

- Any extra challenges faced? 

I am still learning the query and filter, so this for me is a bit a challenge.


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network08/README.md)