# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    inbound is coming into the network. outbound is leaving the network. Just like travelling to the city via freeway, inbound is driving towards the city, outbound is driving away from the city.
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    NACL allow traffic in and out by default and must be configured to be more restrictive. 
    ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

https://docs.aws.amazon.com/cli/latest/reference/ec2/create-network-acl-entry.html

https://docs.aws.amazon.com/vpc/latest/userguide/vpc-network-acls.html#nacl-rules




```
#Port 22 is used for Secure Shell (SSH) communication and allows remote administration access.
z@bacon:~$ aws ec2 create-network-acl-entry --network-acl-id acl-0076456c3a7c5b8bd --ingress --rule-number 90 --protocol tcp --port-range From=22,To=22 --cidr-block 172.16.200.0/24 --rule-action deny
z@bacon:~$ aws ec2 describe-network-acls --network-acl-ids acl-0076456c3a7c5b8bd
{
    "NetworkAcls": [
        {
            "Associations": [
                {
                    "NetworkAclAssociationId": "aclassoc-15ef8268",
                    "NetworkAclId": "acl-0076456c3a7c5b8bd",
                    "SubnetId": "subnet-078316faa4ed0b47e"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-6cd8b511",
                    "NetworkAclId": "acl-0076456c3a7c5b8bd",
                    "SubnetId": "subnet-0abbcb057289b670d"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-3ac5a847",
                    "NetworkAclId": "acl-0076456c3a7c5b8bd",
                    "SubnetId": "subnet-00649d5b0632cc2be"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-e39ef39e",
                    "NetworkAclId": "acl-0076456c3a7c5b8bd",
                    "SubnetId": "subnet-07cd3a9c8c7c3634e"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-f3f8958e",
                    "NetworkAclId": "acl-0076456c3a7c5b8bd",
                    "SubnetId": "subnet-0dd32a6ae556bf2dc"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-ddc7aaa0",
                    "NetworkAclId": "acl-0076456c3a7c5b8bd",
                    "SubnetId": "subnet-0907f22726c996fd5"
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
                    "CidrBlock": "172.16.200.0/24",
                    "Egress": false,
                    "PortRange": {
                        "From": 22,
                        "To": 22
                    },
                    "Protocol": "6",
                    "RuleAction": "deny",
                    "RuleNumber": 90
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
            "NetworkAclId": "acl-0076456c3a7c5b8bd",
            "Tags": [],
            "VpcId": "vpc-09d2f2719d50d1f7f",
            "OwnerId": "512742231244"
        }
    ]
}


```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```
z@bacon:~$ aws ec2 create-network-acl-entry --network-acl-id acl-0076456c3a7c5b8bd --egress --rule-number 80 --protocol -1 --cidr-block 180.200.50.0/24 --rule-action deny
z@bacon:~$ aws ec2 describe-network-acls --network-acl-ids acl-0076456c3a7c5b8bd 
{
    "NetworkAcls": [
        {
            "Associations": [
                {
                    "NetworkAclAssociationId": "aclassoc-15ef8268",
                    "NetworkAclId": "acl-0076456c3a7c5b8bd",
                    "SubnetId": "subnet-078316faa4ed0b47e"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-6cd8b511",
                    "NetworkAclId": "acl-0076456c3a7c5b8bd",
                    "SubnetId": "subnet-0abbcb057289b670d"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-3ac5a847",
                    "NetworkAclId": "acl-0076456c3a7c5b8bd",
                    "SubnetId": "subnet-00649d5b0632cc2be"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-e39ef39e",
                    "NetworkAclId": "acl-0076456c3a7c5b8bd",
                    "SubnetId": "subnet-07cd3a9c8c7c3634e"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-f3f8958e",
                    "NetworkAclId": "acl-0076456c3a7c5b8bd",
                    "SubnetId": "subnet-0dd32a6ae556bf2dc"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-ddc7aaa0",
                    "NetworkAclId": "acl-0076456c3a7c5b8bd",
                    "SubnetId": "subnet-0907f22726c996fd5"
                }
            ],
            "Entries": [
                {
                    "CidrBlock": "180.200.50.0/24",
                    "Egress": true,
                    "Protocol": "-1",
                    "RuleAction": "deny",
                    "RuleNumber": 80
                },
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
                    "CidrBlock": "172.16.200.0/24",
                    "Egress": false,
                    "PortRange": {
                        "From": 22,
                        "To": 22
                    },
                    "Protocol": "6",
                    "RuleAction": "deny",
                    "RuleNumber": 90
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
            "NetworkAclId": "acl-0076456c3a7c5b8bd",
            "Tags": [],
            "VpcId": "vpc-09d2f2719d50d1f7f",
            "OwnerId": "512742231244"
        }
    ]
}

```

- Any extra challenges faced?
```
had to look up ports and aws nacl protocols but info was easily found.
```
<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network08/README.md)