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
## Steps:
Initiate peering connection from one VPC and accept the connection from the target VPC.
Once this is done, everything else is figuring out how to allow traffic flow through NACLs, Security Groups
on the both sides.
Below are the steps and results of our VPC peering work.

## Worked with Marcos for this one.

## step 01 - initiate vpc peering request by Marcos
> aws ec2 create-vpc-peering-connection \
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

## step 02 - accept vpc peering request by Jay
> aws ec2 accept-vpc-peering-connection \
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

## step 03 - add route to Jay's private subnet CIDR by Marcos
> aws ec2 create-route \
    --route-table-id rtb-0fd603c6c542d8aaf \
    --destination-cidr-block 192.168.0.0/19 \
    --vpc-peering-connection-id pcx-058031102357266c7
  {
      "Return": true
  }

## step 04 - add route to Marcos's private subnet CIDR by Jay
> aws ec2 create-route \
    --route-table-id rtb-043be3454bd489e40 \
    --destination-cidr-block 10.11.1.0/24 \
    --vpc-peering-connection-id pcx-058031102357266c7
  {
      "Return": true
  }

## step 05 - add security group ingress rule to allow traffic from private security group from Marcos's VPC
## over the VPC peering connection by Jay
> aws ec2 authorize-security-group-ingress --group-id sg-06519b6fe81ef49d3 --ip-permissions IpProtocol=tcp,FromPort=22,ToPort=22,UserIdGroupPairs='[{GroupId=sg-01331d649596fcd01,Description="SSH access from private subnet over VPC peering"}]'

## step 06 - add same ingress rule as step 05 by Marcos on his private security group
> aws ec2 authorize-security-group-ingress \
    --group-id sg-01331d649596fcd01 \
    --ip-permissions IpProtocol=tcp,FromPort=22,ToPort=22,UserIdGroupPairs='[{GroupId=sg-06519b6fe81ef49d3,Description="Allow VPC Peering SSH connection"}]'

## step 07 - add entries into the NACL to restrict traffic
## Reuse existing devopsacademy-nacl and update rules to be more restrictive.
## Marcos' VPC CIDR Block: 10.11.0.0/16
## Jay's VPC CIDR Block: 192.168.0.0/16
## Jay's home IP  121.200.5.117/32

# Inbound rules for ports 22 + ephemeral ports 1024-65535 (SSH return traffic)
> aws ec2 create-network-acl-entry \
    --network-acl-id acl-06e9d04a427fe2c15 \
    --ingress --rule-number 110 \
    --protocol tcp --port-range From=22,To=22 --cidr-block 121.200.5.117/32 --rule-action allow

> aws ec2 create-network-acl-entry \
    --network-acl-id acl-06e9d04a427fe2c15 \
    --ingress --rule-number 120 \
    --protocol tcp --port-range From=22,To=22 --cidr-block 192.168.0.0/16 --rule-action allow

> aws ec2 create-network-acl-entry \
    --network-acl-id acl-06e9d04a427fe2c15 \
    --ingress --rule-number 130 \
    --protocol tcp --port-range From=1024,To=65535 --cidr-block 192.168.0.0/16 --rule-action allow

> aws ec2 create-network-acl-entry \
    --network-acl-id acl-06e9d04a427fe2c15 \
    --ingress --rule-number 140 \
    --protocol tcp --port-range From=22,To=22 --cidr-block 10.11.0.0/16 --rule-action allow

> aws ec2 create-network-acl-entry \
    --network-acl-id acl-06e9d04a427fe2c15 \
    --ingress --rule-number 150 \
    --protocol tcp --port-range From=1024,To=65535 --cidr-block 10.11.0.0/16 --rule-action allow

## Outbound rules for ports 22 + ephemeral ports 1024-65535 (SSH return traffic)
> aws ec2 create-network-acl-entry \
    --network-acl-id acl-06e9d04a427fe2c15 \
    --egress --rule-number 100 \
    --protocol tcp --port-range From=1024,To=65535 --cidr-block 192.168.0.0/16 --rule-action allow

> aws ec2 create-network-acl-entry \
    --network-acl-id acl-06e9d04a427fe2c15 \
    --egress --rule-number 110 \
    --protocol tcp --port-range From=22,To=22 --cidr-block 192.168.0.0/16 --rule-action allow

> aws ec2 create-network-acl-entry \
    --network-acl-id acl-06e9d04a427fe2c15 \
    --egress --rule-number 120 \
    --protocol tcp --port-range From=1024,To=65535 --cidr-block 121.200.5.117/32 --rule-action allow

> aws ec2 create-network-acl-entry \
    --network-acl-id acl-06e9d04a427fe2c15 \
    --egress --rule-number 130 \
    --protocol tcp --port-range From=22,To=22 --cidr-block 10.11.0.0/16 --rule-action allow

> aws ec2 create-network-acl-entry \
    --network-acl-id acl-06e9d04a427fe2c15 \
    --egress --rule-number 140 \
    --protocol tcp --port-range From=1024,To=65535 --cidr-block 10.11.0.0/16 --rule-action allow

## step 08 - share the private keys between Marcos and Jay

## step 09 - connect to private instance on Marcos's VPC through peering

  ➜  jay ssh ec2-user@13.236.136.201
  Last login: Sat Jun 27 08:27:18 2020 from 121-200-5-117.79c805.syd.nbn.aussiebb.net
        __|  __|_  )
        _|  (     /   Amazon Linux 2 AMI
        ___|\___|___|
  https://aws.amazon.com/amazon-linux-2/
  4 package(s) needed for security, out of 10 available
  Run "sudo yum update" to apply all updates.
  [ec2-user@ip-192-168-107-191 ~]$ ssh ec2-user@192.168.10.10
  Last login: Sat Jun 27 08:38:04 2020 from 10.11.1.4
        __|  __|_  )
        _|  (     /   Amazon Linux 2 AMI
        ___|\___|___|
  https://aws.amazon.com/amazon-linux-2/
  [ec2-user@ip-192-168-10-10 ~]$
  [ec2-user@ip-192-168-10-10 ~]$
  [ec2-user@ip-192-168-10-10 ~]$
  [ec2-user@ip-192-168-10-10 ~]$
  [ec2-user@ip-192-168-10-10 ~]$
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
  [ec2-user@ip-10-11-1-4 ~]$
  [ec2-user@ip-10-11-1-4 ~]$

## step 10 - testing the connectivity from Marcos's end

  ssh -A ec2-user@3.25.64.226
  Last login: Sat Jun 27 08:47:30 2020 from 120-88-137-206.tpgi.com.au
        __|  __|_  )
        _|  (     /   Amazon Linux 2 AMI
        ___|\___|___|
  https://aws.amazon.com/amazon-linux-2/
  4 package(s) needed for security, out of 10 available
  Run "sudo yum update" to apply all updates.
  [ec2-user@ip-10-11-11-41 ~]$ ssh 10.11.1.4
  Last login: Sat Jun 27 08:47:34 2020 from 10.11.11.41
        __|  __|_  )
        _|  (     /   Amazon Linux 2 AMI
        ___|\___|___|
  https://aws.amazon.com/amazon-linux-2/
  4 package(s) needed for security, out of 10 available
  Run "sudo yum update" to apply all updates.
  [ec2-user@ip-10-11-1-4 ~]$ ssh -i jay.pem 192.168.10.10
  Last login: Sat Jun 27 08:48:09 2020 from 10.11.1.4
        __|  __|_  )
        _|  (     /   Amazon Linux 2 AMI
        ___|\___|___|
  https://aws.amazon.com/amazon-linux-2/
  [ec2-user@ip-192-168-10-10 ~]$

## step 11 - mission accomplished! We could connect to private instances over VPC peering

```

- Any extra challenges faced?
```
Took a bit of time to lock down NACLs. Hopefully we got it right :-)

```

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network12](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network12/README.md)