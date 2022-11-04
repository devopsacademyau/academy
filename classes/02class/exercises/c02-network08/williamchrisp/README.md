# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    Outbound rules control the outgoing traffic thats allowed to leave the vpc.
    Inbound rules control the ingoing traffic thats allowed to enter the vpc.
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    The default network ACL is configured to allow all traffic to flow in and out of the subnets with which it is associated.
    ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```
aws --region us-east-1ec2 create-network-acl --vpc-id vpc-0e4bde4129898095b
{
    "NetworkAcl": {
        "Associations": [],
        "Entries": [
            {
                "CidrBlock": "0.0.0.0/0",
                "Egress": true,
                "IcmpTypeCode": {},
                "PortRange": {},
                "Protocol": "-1",
                "RuleAction": "deny",
                "RuleNumber": 32767
            },
            {
                "CidrBlock": "0.0.0.0/0",
                "Egress": false,
                "IcmpTypeCode": {},
                "PortRange": {},
                "Protocol": "-1",
                "RuleAction": "deny",
                "RuleNumber": 32767
            }
        ],
        "IsDefault": false,
        "NetworkAclId": "acl-0704a072908abb27e",
        "Tags": [],
        "VpcId": "vpc-0e4bde4129898095b",
        "OwnerId": "152848913167"
    }
}

aws --region us-east-1 ec2 create-network-acl-entry --network-acl-id acl-0704a072908abb27e --ingress --rule-number 100 --protocol tcp --port-range From=22,To=22 --cidr-block 172.16.200.0/24 --rule-action deny
```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```
aws --region us-east-1 ec2 create-network-acl-entry --network-acl-id acl-0704a072908abb27e --egress --rule-number 110 --protocol -1  --cidr-block 180.200.50.0/24 --rule-action deny
```

- Any extra challenges faced?

***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/80a940b39bc3ae40378abe7af015cb3c207463f6/classes/02class/exercises/c02-network08/README.md)