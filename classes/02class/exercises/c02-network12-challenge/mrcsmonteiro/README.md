# c02-network12

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Provide commands used to go through all the below deliverables: (everything should be done using the AWS cli)

  - explain how was the process to create a VPC peering
  - add routes from origin VPC to target VPC - only for private subnets
  - open any network ACL to allow the connection within the subnets -- try to   only open the mininum required
  - from an instance in one vpc, SSH to the other instance (will have to share   the ssh keys, create a new one just for this exercise -- pay attention to   security)
  - open any security group to allow the SSH communication between the   instances

```
# 1. Create peering connection (Marcos)

$ aws ec2 create-vpc-peering-connection \
    --vpc-id vpc-0721e28436cea8410 \
    --peer-vpc-id vpc-007774900b7f4c596 \
    --peer-owner-id 907095435092
{
    "VpcPeeringConnection": {
        "AccepterVpcInfo": {
            "OwnerId": "907095435092",
            "VpcId": "vpc-007774900b7f4c596",
            "Region": "ap-southeast-2"
        },
        "ExpirationTime": "2020-07-04T08:13:50+00:00",
        "RequesterVpcInfo": {
            "CidrBlock": "10.11.0.0/16",
            "CidrBlockSet": [
                {
                    "CidrBlock": "10.11.0.0/16"
                }
            ],
            "OwnerId": "149613515908",
            "PeeringOptions": {
                "AllowDnsResolutionFromRemoteVpc": false,
                "AllowEgressFromLocalClassicLinkToRemoteVpc": false,
                "AllowEgressFromLocalVpcToRemoteClassicLink": false
            },
            "VpcId": "vpc-0721e28436cea8410",
            "Region": "ap-southeast-2"
        },
        "Status": {
            "Code": "initiating-request",
            "Message": "Initiating Request to 907095435092"
        },
        "Tags": [],
        "VpcPeeringConnectionId": "pcx-058031102357266c7"
    }
}

# 2. Accept peering connection (Jay)

$ aws ec2 accept-vpc-peering-connection \
    --vpc-peering-connection-id pcx-058031102357266c7

{
    "VpcPeeringConnection": {
        "AccepterVpcInfo": {
            "CidrBlock": "192.168.0.0/16",
            "CidrBlockSet": [
                {
                    "CidrBlock": "192.168.0.0/16"
                }
            ],
            "OwnerId": "907095435092",
            "PeeringOptions": {
                "AllowDnsResolutionFromRemoteVpc": false,
                "AllowEgressFromLocalClassicLinkToRemoteVpc": false,
                "AllowEgressFromLocalVpcToRemoteClassicLink": false
            },
            "VpcId": "vpc-007774900b7f4c596",
            "Region": "ap-southeast-2"
        },
        "RequesterVpcInfo": {
            "CidrBlock": "10.11.0.0/16",
            "CidrBlockSet": [
                {
                    "CidrBlock": "10.11.0.0/16"
                }
            ],
            "OwnerId": "149613515908",
            "VpcId": "vpc-0721e28436cea8410",
            "Region": "ap-southeast-2"
        },
        "Status": {
            "Code": "provisioning",
            "Message": "Provisioning"
        },
        "Tags": [],
        "VpcPeeringConnectionId": "pcx-058031102357266c7"
    }
}

# 3. Edit route tables to communication between private subnets (Jay & Marcos)

# Marcos' commands

$ aws ec2 create-route \
    --route-table-id rtb-0fd603c6c542d8aaf \
    --destination-cidr-block 192.168.0.0/19 \
    --vpc-peering-connection-id pcx-058031102357266c7

{
    "Return": true
}

# Jay's commands

$ aws ec2 create-route \                                                                                                         <aws:devopsadmin>
    --route-table-id rtb-043be3454bd489e40 \
    --destination-cidr-block 10.11.1.0/24 \
    --vpc-peering-connection-id pcx-058031102357266c7

{
    "Return": true
}

# 4. Verify applicable Security Groups

# Marcos' private-sg = sg-01331d649596fcd01
# Jay's   private-sg = sg-06519b6fe81ef49d3

# Marcos' commands:

$ aws ec2 authorize-security-group-ingress \
    --group-id sg-01331d649596fcd01 \
    --ip-permissions IpProtocol=tcp,FromPort=22,ToPort=22,UserIdGroupPairs='[{GroupId=sg-06519b6fe81ef49d3,Description="Allow VPC Peering SSH connection"}]'

# Jay's commands:

$ aws ec2 authorize-security-group-ingress \
    --group-id sg-06519b6fe81ef49d3 \
    --ip-permissions IpProtocol=tcp,FromPort=22,ToPort=22,UserIdGroupPairs='[{GroupId=sg-01331d649596fcd01,Description="SSH access from private subnet over VPC peering"}]'

# 5. Verify applicable NACLs

# Marcos' side configurations:
# - A custom NACL was created for the private-a subnet, where the private instance was launched.
# - The custom rules ALLOW SSH (22) + TCP Ephemeral Ports (1024-65535) inbound connections from 10.11.0.0/16 (Marcos' VPC) and 192.168.0.0/16 (Jay's VPC).
# - The custom rules ALLOW SSH (22) + TCP Ephemeral Ports (1024-65535) outbound connections to 10.11.0.0/16 (Marcos' VPC) and 192.168.0.0/16 (Jay's VPC).
# - All other subnets are using the default NACL, which allows all inbound and outbound traffic by default.

$ aws ec2 create-network-acl \
    --vpc-id vpc-0721e28436cea8410

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
        "NetworkAclId": "acl-05d6df652d4efea31",
        "Tags": [],
        "VpcId": "vpc-0721e28436cea8410",
        "OwnerId": "149613515908"
    }
}

$ aws ec2 create-tags \
    --resources acl-05d6df652d4efea31 \
    --tags Key=Name,Value="NACL for private subnets"

# Marcos' private-a subnet
# subnet-062fa33492cd979a6

$ aws ec2 describe-network-acls

$ aws ec2 replace-network-acl-association \
    --association-id aclassoc-0353c0b77b2a78321 \
    --network-acl-id acl-05d6df652d4efea31

{
    "NewAssociationId": "aclassoc-0b8dc907d25f1ce65"
}

# NACL inbound & outbound rules to allow cross account SSH connections for instances deployed in peered VPCs (same region)
# Marcos' VPC CIDR Block: 10.11.0.0/16
# Jay's   VPC CIDR Block: 192.168.0.0/16

# Inbound rules for ports 22 + ephemeral ports 1024-65535 (SSH return traffic)

$ aws ec2 create-network-acl-entry \
    --network-acl-id acl-05d6df652d4efea31 \
    --ingress --rule-number 100 \
    --protocol tcp --port-range From=22,To=22 --cidr-block 10.11.0.0/16 --rule-action allow

$ aws ec2 create-network-acl-entry \
    --network-acl-id acl-05d6df652d4efea31 \
    --ingress --rule-number 110 \
    --protocol tcp --port-range From=1024,To=65535 --cidr-block 10.11.0.0/16 --rule-action allow

$ aws ec2 create-network-acl-entry \
    --network-acl-id acl-05d6df652d4efea31 \
    --ingress --rule-number 120 \
    --protocol tcp --port-range From=22,To=22 --cidr-block 192.168.0.0/16 --rule-action allow

$ aws ec2 create-network-acl-entry \
    --network-acl-id acl-05d6df652d4efea31 \
    --ingress --rule-number 130 \
    --protocol tcp --port-range From=1024,To=65535 --cidr-block 192.168.0.0/16 --rule-action allow

# Outbound rules for ports 22 + ephemeral ports 1024-65535 (SSH return traffic)

$ aws ec2 create-network-acl-entry \
    --network-acl-id acl-05d6df652d4efea31 \
    --egress --rule-number 100 \
    --protocol tcp --port-range From=22,To=22 --cidr-block 10.11.0.0/16 --rule-action allow

$ aws ec2 create-network-acl-entry \
    --network-acl-id acl-05d6df652d4efea31 \
    --egress --rule-number 110 \
    --protocol tcp --port-range From=1024,To=65535 --cidr-block 10.11.0.0/16 --rule-action allow

$ aws ec2 create-network-acl-entry \
    --network-acl-id acl-05d6df652d4efea31 \
    --egress --rule-number 120 \
    --protocol tcp --port-range From=22,To=22 --cidr-block 192.168.0.0/16 --rule-action allow

$ aws ec2 create-network-acl-entry \
    --network-acl-id acl-05d6df652d4efea31 \
    --egress --rule-number 130 \
    --protocol tcp --port-range From=1024,To=65535 --cidr-block 192.168.0.0/16 --rule-action allow

# 6. Marcos and Jay exchanged private keys to access each other's instances

# 7. Connecting to private instances

# Marcos' commands

# Jump to Marcos' public instance

$ ssh -A ec2-user@3.25.64.226
Last login: Sat Jun 27 08:47:30 2020 from 120-88-137-206.tpgi.com.au
       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|
https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 10 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-11-11-41 ~]$

# Jump to Marcos' private instance

[ec2-user@ip-10-11-11-41 ~]$ ssh 10.11.1.4
Last login: Sat Jun 27 08:47:34 2020 from 10.11.11.41
       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|
https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 10 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-11-1-4 ~]$

# Jump to Jay's private instance

[ec2-user@ip-10-11-1-4 ~]$ ssh -i jay.pem 192.168.10.10
Last login: Sat Jun 27 08:48:09 2020 from 10.11.1.4
       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|
https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-192-168-10-10 ~]$

# Leaving a message

[ec2-user@ip-192-168-10-10 ~]$ cat << EOF > hello-jay.txt
Hello, Jay. Happy VPC Peering! :-)
EOF

# Jay's commands

# Jump to Jay's public instance

➜  jay ssh ec2-user@13.236.136.201
Last login: Sat Jun 27 08:27:18 2020 from 121-200-5-117.79c805.syd.nbn.aussiebb.net
       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|
https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 10 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-192-168-107-191 ~]$

# Jump to Jay's private instance

[ec2-user@ip-192-168-107-191 ~]$ ssh ec2-user@192.168.10.10
Last login: Sat Jun 27 08:38:04 2020 from 10.11.1.4
       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|
https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-192-168-10-10 ~]$

# Jump to Marcos' private instance

[ec2-user@ip-192-168-10-10 ~]$ ssh -i "marcos-keys.pem" ec2-user@10.11.1.4
The authenticity of host '10.11.1.4 (10.11.1.4)' can't be established.
ECDSA key fingerprint is SHA256:EEKiQHvEkNp5IyKMNSC8dYvdFHCxVtwjkSUHKHKs1Es.
ECDSA key fingerprint is MD5:59:86:cb:87:6c:d7:aa:31:46:d9:11:62:ea:28:77:12.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '10.11.1.4' (ECDSA) to the list of known hosts.
Last login: Sat Jun 27 08:43:04 2020 from 10.11.11.41
       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|
https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 10 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-11-1-4 ~]$

# 8. That's all folks!
```

- Any extra challenges faced?

Yes, understand the NACL stateless behaviour and find the required ephemeral ports to allow SSH connections.

***
Answer for exercise [c02-network12](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network12/README.md)
