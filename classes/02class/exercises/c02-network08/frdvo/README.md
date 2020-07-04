# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Inbound is when a host is receiving a data, whereas outbond is when a host is sending data. For instance a http server receives inbound connections from clients, whereas a web browser makes outbound connection to a webserver. Important to remember NACLs are stateless, which means to a host accept connections, you have to open the inbound port and the outbound "high ports" to allow connections
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    On default NACL all traffic is allowed. On new NACLs all traffic is denied.
    ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```
$aws ec2 describe-network-acls
{
    "NetworkAcls": [
        {
            "Associations": [
                {
                    "NetworkAclAssociationId": "aclassoc-02e4d0fd9669146d2",
                    "NetworkAclId": "acl-0e036e5c5c674f74b",
                    "SubnetId": "subnet-074a113f80e846338"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-0e90bff240e45eae1",
                    "NetworkAclId": "acl-0e036e5c5c674f74b",
                    "SubnetId": "subnet-01f6ba32065d77e19"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-060ff6113416e5e61",
                    "NetworkAclId": "acl-0e036e5c5c674f74b",
                    "SubnetId": "subnet-0b9349fa56d76afb7"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-6c6ff511",
                    "NetworkAclId": "acl-0e036e5c5c674f74b",
                    "SubnetId": "subnet-04843486979b4aeb2"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-0ffb88c932c7e379c",
                    "NetworkAclId": "acl-0e036e5c5c674f74b",
                    "SubnetId": "subnet-0ba23989d8f1b0768"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-0afb3136eee16f933",
                    "NetworkAclId": "acl-0e036e5c5c674f74b",
                    "SubnetId": "subnet-0dbb2205880974071"
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
            "NetworkAclId": "acl-0e036e5c5c674f74b",
            "Tags": [],
            "VpcId": "vpc-0a2b7db4956438d22",
            "OwnerId": "165765640813"
        }
    ]
} 
 
$aws ec2 create-network-acl-entry --network-acl-id acl-0e036e5c5c674f74b --ingress --rule-number 200 --protocol tcp --port-range From=22,To=22 --cidr-block 172.16.200.0/24 --rule-action deny

$aws ec2 describe-network-acls
{
    "NetworkAcls": [
        {
            "Associations": [
                {
                    "NetworkAclAssociationId": "aclassoc-02e4d0fd9669146d2",
                    "NetworkAclId": "acl-0e036e5c5c674f74b",
                    "SubnetId": "subnet-074a113f80e846338"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-0e90bff240e45eae1",
                    "NetworkAclId": "acl-0e036e5c5c674f74b",
                    "SubnetId": "subnet-01f6ba32065d77e19"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-060ff6113416e5e61",
                    "NetworkAclId": "acl-0e036e5c5c674f74b",
                    "SubnetId": "subnet-0b9349fa56d76afb7"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-6c6ff511",
                    "NetworkAclId": "acl-0e036e5c5c674f74b",
                    "SubnetId": "subnet-04843486979b4aeb2"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-0ffb88c932c7e379c",
                    "NetworkAclId": "acl-0e036e5c5c674f74b",
                    "SubnetId": "subnet-0ba23989d8f1b0768"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-0afb3136eee16f933",
                    "NetworkAclId": "acl-0e036e5c5c674f74b",
                    "SubnetId": "subnet-0dbb2205880974071"
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
                    "CidrBlock": "172.16.200.0/24",
                    "Egress": false,
                    "PortRange": {
                        "From": 22,
                        "To": 22
                    },
                    "Protocol": "6",
                    "RuleAction": "deny",
                    "RuleNumber": 200
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
            "NetworkAclId": "acl-0e036e5c5c674f74b",
            "Tags": [],
            "VpcId": "vpc-0a2b7db4956438d22",
            "OwnerId": "165765640813"
        }
    ]
}
```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```
$aws ec2 create-network-acl-entry --network-acl-id acl-0e036e5c5c674f74b --egress --rule-number 300 --protocol -1 --cidr-block 180.200.50.0/24 --rule-action deny

$aws ec2 describe-network-acls
{
    "NetworkAcls": [
        {
            "Associations": [
                {
                    "NetworkAclAssociationId": "aclassoc-02e4d0fd9669146d2",
                    "NetworkAclId": "acl-0e036e5c5c674f74b",
                    "SubnetId": "subnet-074a113f80e846338"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-0e90bff240e45eae1",
                    "NetworkAclId": "acl-0e036e5c5c674f74b",
                    "SubnetId": "subnet-01f6ba32065d77e19"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-060ff6113416e5e61",
                    "NetworkAclId": "acl-0e036e5c5c674f74b",
                    "SubnetId": "subnet-0b9349fa56d76afb7"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-6c6ff511",
                    "NetworkAclId": "acl-0e036e5c5c674f74b",
                    "SubnetId": "subnet-04843486979b4aeb2"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-0ffb88c932c7e379c",
                    "NetworkAclId": "acl-0e036e5c5c674f74b",
                    "SubnetId": "subnet-0ba23989d8f1b0768"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-0afb3136eee16f933",
                    "NetworkAclId": "acl-0e036e5c5c674f74b",
                    "SubnetId": "subnet-0dbb2205880974071"
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
                    "CidrBlock": "180.200.50.0/24",
                    "Egress": true,
                    "Protocol": "-1",
                    "RuleAction": "deny",
                    "RuleNumber": 300
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
                    "CidrBlock": "172.16.200.0/24",
                    "Egress": false,
                    "PortRange": {
                        "From": 22,
                        "To": 22
                    },
                    "Protocol": "6",
                    "RuleAction": "deny",
                    "RuleNumber": 200
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
            "NetworkAclId": "acl-0e036e5c5c674f74b",
            "Tags": [],
            "VpcId": "vpc-0a2b7db4956438d22",
            "OwnerId": "165765640813"
        }
    ]
}

```

- Any extra challenges faced?
All good in the hood!

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network08/README.md)