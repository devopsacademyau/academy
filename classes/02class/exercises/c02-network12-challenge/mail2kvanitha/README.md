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
 1. PROCESS to CREATE VPC PEERING

 REQUESTER (ORIGIN) VPC DETAILS - 
  VPC-ID vpc-042fd98e61209aa1e 
  VPC CIDR - 10.10.0.0/16
  SUBNETS:
	PUBLIC-A - 10.10.1.0/24          PRIVATE-A - 10.10.11.1/24
        PUBLIC-B - 10.10.2.0/24          PRIVATE-B - 10.10.12.1/24
        PUBLIC-C - 10.10.3.0/24          PRIVATE-C - 10.10.13.1/24
  PUBLIC EC2 INSTANCE IP - 13.54.182.147 / 10.10.1.20
  PRIVATE EC2 INSTANCE IP - 10.10.11.11 

 ACCEPTER (TARGET) VPC DETAILS - 
  AWS ACCOUNT 743552702304
  VPC-ID vpc-059ada909ea0aa9a7
  VPC CIDR - 192.168.0.0/16 
  SUBNETS:
	PUBLIC-A - 192.168.1.0/24          PRIVATE-A - 192.168.11.1/24
        PUBLIC-B - 192.168.2.0/24          PRIVATE-B - 192.168.12.1/24
        PUBLIC-C - 192.168.3.0/24          PRIVATE-C - 192.168.13.1/24
  PUBLIC EC2 INSTANCE IP - 52.63.65.101 / 192.168.1.193 
  PRIVATE EC2 INSTANCE IP - 192.168.11.11

 > aws ec2 create-vpc-peering-connection --vpcid vpc-042fd98e61209aa1e --peer-vpc-id vpc-059ada909ea0aa9a7 --peer-owner-id  743552702304

 > aws ec2 accept-vpc-peering-connection --vpc-peering-connection-id pcx-0df22d155cd076a47

 2. ADD ROUTES FROM ORIGIN VPC TO TARGET VPC - ONLY FOR PRIVATE SUBNETS

 Routes added at Origin VPC
 
 > aws ec2 describe-route-tables --route-table-ids rtb-0e10033c72864cbea 

   {
    "RouteTables": [
        {
            "Associations": [
                {
                    "Main": false,
                    "RouteTableAssociationId": "rtbassoc-0913fa39e1e4a8ab6",
                    "RouteTableId": "rtb-0e10033c72864cbea",
                    "SubnetId": "subnet-0c8c2609ac6874ace",
                    "AssociationState": {
                        "State": "associated"
                    }
                },
                {
                    "Main": false,
                    "RouteTableAssociationId": "rtbassoc-00e10223f13e2d4f7",
                    "RouteTableId": "rtb-0e10033c72864cbea",
                    "SubnetId": "subnet-09fef27936067ada2",
                    "AssociationState": {
                        "State": "associated"
                    }
                },
                {
                    "Main": false,
                    "RouteTableAssociationId": "rtbassoc-0c9360543a9a3778b",
                    "RouteTableId": "rtb-0e10033c72864cbea",
                    "SubnetId": "subnet-0e3612f29a90002a2",
                    "AssociationState": {
                        "State": "associated"
                    }
                }
            ],
            "PropagatingVgws": [],
            "RouteTableId": "rtb-0e10033c72864cbea",
            "Routes": [
                {
                    "DestinationCidrBlock": "192.168.1.193/32",
                    "Origin": "CreateRoute",
                    "State": "active",
                    "VpcPeeringConnectionId": "pcx-0df22d155cd076a47"
                },
                {
                    "DestinationCidrBlock": "10.10.0.0/16",
                    "GatewayId": "local",
                    "Origin": "CreateRouteTable",
                    "State": "active"
                },
                {
                    "DestinationCidrBlock": "0.0.0.0/0",
                    "GatewayId": "igw-0cddf7628cdbc38a2",
                    "Origin": "CreateRoute",
                    "State": "active"
                }
            ],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "devopsacademy-rt-public"
                }
             ],
             "VpcId": "vpc-042fd98e61209aa1e",
             "OwnerId": "238730634896"
          }
      ]
   }


 NETWORK ACL ENTRY AT TARGET 
 > aws ec2 describe-network-acls --network-acl-ids acl-034d97690fe6cf7f1
   {
    "NetworkAcls": [
        {
            "Associations": [
                {
                    "NetworkAclAssociationId": "aclassoc-9d136de0",
                    "NetworkAclId": "acl-034d97690fe6cf7f1",
                    "SubnetId": "subnet-000caee3f347a3d30"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-7729570a",
                    "NetworkAclId": "acl-034d97690fe6cf7f1",
                    "SubnetId": "subnet-0d4564fc0c8f2b7e7"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-f4126c89",
                    "NetworkAclId": "acl-034d97690fe6cf7f1",
                    "SubnetId": "subnet-0bd916ed9aaebccb1"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-2017695d",
                    "NetworkAclId": "acl-034d97690fe6cf7f1",
                    "SubnetId": "subnet-05de940f508054355"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-281b6555",
                    "NetworkAclId": "acl-034d97690fe6cf7f1",
                    "SubnetId": "subnet-0705f0cfa9fa2f3a0"
                },
                {
                    "NetworkAclAssociationId": "aclassoc-98205ee5",
                    "NetworkAclId": "acl-034d97690fe6cf7f1",
                    "SubnetId": "subnet-0f28f1927df0171e2"
                }
            ],
            "Entries": [
                {
                    "CidrBlock": "10.10.1.20/32",
                    "Egress": true,
                    "PortRange": {
                        "From": 22,
                        "To": 22
                    },
                    "Protocol": "6",
                    "RuleAction": "allow",
                    "RuleNumber": 90
                },
                {
                    "CidrBlock": "10.10.1.245/32",
                    "Egress": true,
                    "PortRange": {
                        "From": 22,
                        "To": 22
                    },
                    "Protocol": "6",
                    "RuleAction": "allow",
                    "RuleNumber": 95
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
                    "CidrBlock": "10.10.1.20/32",
                    "Egress": false,
                    "PortRange": {
                        "From": 22,
                        "To": 22
                    },
                    "Protocol": "6",
                    "RuleAction": "allow",
                    "RuleNumber": 90
                },
                {
                    "CidrBlock": "10.10.1.245/32",
                    "Egress": false,
                    "PortRange": {
                        "From": 22,
                        "To": 22
                    },
                    "Protocol": "6",
                    "RuleAction": "allow",
                    "RuleNumber": 91
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
             "NetworkAclId": "acl-034d97690fe6cf7f1",
             "Tags": [],
             "VpcId": "vpc-059ada909ea0aa9a7",
             "OwnerId": "743552702304"
          }
      ]
  }


 SECURITY GROUP DETAILA AT TARGET

 > aws ec2 describe-security-groups --group-ids sg-013796d5fe013ffb9

   {
    "SecurityGroups": [
        {
            "Description": "Training Academy Public SG",
            "GroupName": "public-sg",
            "IpPermissions": [
                {
                    "FromPort": 22,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "14.203.197.155/32",
                            "Description": "Vanitha Laptop"
                        },
                        {
                            "CidrIp": "10.10.1.20/32"
                        },
                        {
                            "CidrIp": "10.10.1.245/32"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 22,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "743552702304",
            "GroupId": "sg-013796d5fe013ffb9",
            "IpPermissionsEgress": [
                {
                    "IpProtocol": "-1",
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "UserIdGroupPairs": []
                }
            ],
              "Tags": [
                  {
                    "Key": "Name",
                    "Value": "public-sg"
                  }
              ],
              "VpcId": "vpc-059ada909ea0aa9a7"
          }
      ]
  }

  CONNECTION FROM ORIGIN EC2 VPC TO TARGET EC2 VPC
  
  Copied the key file(.pem) of the Target EC2 instance to the Origin EC2 before initiating the connection. 
  
  ssh -i mummaserver.pem ec2-user@13.54.182.147
  
  Last login: Fri Jul  3 05:02:16 2020 from 14-203-197-155.static.tpgi.com.au

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

  https://aws.amazon.com/amazon-linux-2/
  13 package(s) needed for security, out of 22 available
  Run "sudo yum update" to apply all updates.
  
  [ec2-user@ip-10-10-1-20 ~]$ ssh -i mycloudtrainings.pem ec2-user@192.168.1.193
  Last login: Fri Jul  3 05:02:36 2020 from 10.10.1.20

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

  https://aws.amazon.com/amazon-linux-2/
  15 package(s) needed for security, out of 24 available
  Run "sudo yum update" to apply all updates.
  [ec2-user@ip-192-168-1-193 ~]$ 

```

- Any extra challenges faced?

  No Challenges

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network12](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network12/README.md)
