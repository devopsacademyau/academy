# c02-network08


## Commands Execution Output
Your ACL rule inbound and outbound should look like this:

|Rule#|Type|Protocol|Port Range|Source|Allow/Deny|
|-|-|-|-|-|-|
|100|ALL Traffic|ALL|ALL|`<vpc-network>`|ALLOW|
|101|ALL Traffic|ALL|ALL|0.0.0.0/0|ALLOW|
|*|ALL Traffic|ALL|ALL|0.0.0.0/0|DENY
- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Inbound refers to incoming traffic. Inbound rules means the source of the traffic, the listening port or port range and allow or deny the specified incoming traffic. 
    Outbound refers to outgoing traffic. Outbound rules means the destination for the traffic, the listening port or port range and allow or deny the specified outgoing traffic. 
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    The default network ACL is configured to allow all traffic to flow in and out of the subnets with which it is associated.
    ```

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```bash
ACL_ID=acl-0c99c61dea421885c

aws ec2 create-network-acl-entry \
    --network-acl-id $ACL_ID \
    --ingress \
    --rule-number 20 \
    --protocol tcp \
    --port-range From=22,To=22 \
    --cidr-block 172.16.200.0/24 \
    --rule-action deny
 
aws ec2 describe-network-acls --filter "Name=network-acl-id, Values=$ACL_ID"
```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```bash
aws ec2 create-network-acl-entry \
    --network-acl-id $ACL_ID \
    --egress \
    --rule-number 30 \
    --protocol "-1" \
    --cidr-block 180.200.50.0/24 \
    --rule-action deny

aws ec2 describe-network-acls --filter "Name=network-acl-id, Values=$ACL_ID"

# Output:
{
    "NetworkAcls": [
        {
            "Associations": [
                {
                    "NetworkAclAssociationId": "aclassoc-a67e2ddb",
                    "NetworkAclId": "acl-0c99c61dea421885c",
                    "SubnetId": "subnet-03b9a6d084a3b586b"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-4893c035",
                    "NetworkAclId": "acl-0c99c61dea421885c",
                    "SubnetId": "subnet-04709dce111382a62"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-e060339d",
                    "NetworkAclId": "acl-0c99c61dea421885c",
                    "SubnetId": "subnet-00d8a496401ddc8de"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-097c2f74",
                    "NetworkAclId": "acl-0c99c61dea421885c",
                    "SubnetId": "subnet-0d0c8946e18a7902c"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-6f91c212",
                    "NetworkAclId": "acl-0c99c61dea421885c",
                    "SubnetId": "subnet-080d66f82c68fe96b"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-4799ca3a",
                    "NetworkAclId": "acl-0c99c61dea421885c",
                    "SubnetId": "subnet-069d2eb4c2921ab78"
                }
            ],
            "Entries": [
                {
                    "CidrBlock": "180.200.50.0/24",
                    "Egress": true,
                    "Protocol": "-1",
                    "RuleAction": "deny",
                    "RuleNumber": 30
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
                    "RuleNumber": 20
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
            "NetworkAclId": "acl-0c99c61dea421885c",
            "Tags": [],
            "VpcId": "vpc-02ec2836691642ace",
            "OwnerId": "4************"
        }
    ]
}

# Clean when needless
aws ec2 delete-network-acl-entry --network-acl-id $ACL_ID --ingress --rule-number 20
aws ec2 delete-network-acl-entry --network-acl-id $ACL_ID --egress --rule-number 30

```

- Any extra challenges faced?

No.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network08/README.md)