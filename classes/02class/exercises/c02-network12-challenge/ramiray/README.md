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
VPC Peering: 

## VPC created in the previous exercises and peered with my another account VPC. Both the vpcs are in same region- ap-southeast-2

Command : 

Source - vpc-0351acfbc7aed9c1f (my vpc) and Partner -vpc-0d9f2cb6a3b6a5e58 , Partner owner - 348248800869 
 
 aws ec2 create-vpc-peering-connection --vpc-id vpc-0351acfbc7aed9c1f --peer-vpc-id vpc-0d9f2cb6a3b6a5e58 --peer-owner-id 348248800869
{
    "VpcPeeringConnection": {
        "Status": {
            "Message": "Initiating Request to 348248800869",
            "Code": "initiating-request"
        },
        "Tags": [],
        "RequesterVpcInfo": {
            "PeeringOptions": {
                "AllowEgressFromLocalVpcToRemoteClassicLink": false,
                "AllowDnsResolutionFromRemoteVpc": false,
                "AllowEgressFromLocalClassicLinkToRemoteVpc": false
            },
            "VpcId": "vpc-0351acfbc7aed9c1f",
            "Region": "ap-southeast-2",
            "OwnerId": "348662207501",
            "CidrBlockSet": [
                {
                    "CidrBlock": "172.16.0.0/16"
                }
            ],
            "CidrBlock": "172.16.0.0/16"
        },
        "VpcPeeringConnectionId": "pcx-087eda232944f0c93",
        "ExpirationTime": "2020-07-10T12:11:11.000Z",
        "AccepterVpcInfo": {
            "OwnerId": "348248800869",
            "Region": "ap-southeast-2",
            "VpcId": "vpc-0d9f2cb6a3b6a5e58"
        }
    }
}

## Accepting the Peering connection from partner VPC:

aws ec2 accept-vpc-peering-connection --vpc-peering-connection-id pcx-087eda232944f0c93
{
    "VpcPeeringConnection": {
        "AccepterVpcInfo": {
            "CidrBlock": "10.0.0.0/16",
            "CidrBlockSet": [
                {
                    "CidrBlock": "10.0.0.0/16"
                },
                {
                    "CidrBlock": "10.1.0.0/16"
                },
                {
                    "CidrBlock": "10.2.0.0/16"
                },
                {
                    "CidrBlock": "10.3.0.0/16"
                },
                {
                    "CidrBlock": "10.4.0.0/16"
                }
            ],
            "OwnerId": "348248800869",
            "PeeringOptions": {
                "AllowDnsResolutionFromRemoteVpc": false,
                "AllowEgressFromLocalClassicLinkToRemoteVpc": false,
                "AllowEgressFromLocalVpcToRemoteClassicLink": false
            },
            "VpcId": "vpc-0d9f2cb6a3b6a5e58",
            "Region": "ap-southeast-2"
        },
        "RequesterVpcInfo": {
            "CidrBlock": "172.16.0.0/16",
            "CidrBlockSet": [
                {
                    "CidrBlock": "172.16.0.0/16"
                }
            ],
            "OwnerId": "348662207501",
            "VpcId": "vpc-0351acfbc7aed9c1f",
            "Region": "ap-southeast-2"
        },
        "Status": {
            "Code": "provisioning",
            "Message": "Provisioning"
        },
        "Tags": [],
        "VpcPeeringConnectionId": "pcx-087eda232944f0c93"
    }
}


## add routes from origin VPC to target VPC - only for private subnets 

# From My Instance -  route table Creation  

aws ec2 create-route --route-table-id rtb-067a4e39920e79162 --destination-cidr-block 10.0.16.0/20 --vpc-peering-connection-id pcx-087eda232944f0c93
{
    "Return": true
}

# From the  partner instance - route table Creation

aws ec2 create-route --route-table-id rtb-0a1055786946aafc5 --destination-cidr-block 172.16.0.0/16 --vpc-peering-connection-id pcx-087eda232944f0c93
{
    "Return": true
}


## Adding NACL Rules on Private Subnets with limited restrictions.

##  My Ip address - 10.0.0.237 , 
    My VPC CIDR - 172.16.0.0/16
    Partner VPC CIDR  - 10.0.0.0/16

>>>  Below entries are from my VPC  <<<

Inbound: 
1. aws ec2 create-network-acl-entry --network-acl-id acl-3e73c758 --ingress --rule-number 12 --protocol tcp --port-range From=1024,To=65535 --cidr-block 10.0.0.0/16 --rule-action allow

2. aws ec2 create-network-acl-entry --network-acl-id acl-3e73c758 --ingress --rule-number 100 --protocol tcp --port-range From=1024,To=65535 --cidr-block 172.16.0.0/16 --rule-action allow

3. aws ec2 create-network-acl-entry --network-acl-id acl-3e73c758 --ingress --rule-number 105 --protocol tcp --port-range From=22,To=22 --cidr-block 10.0.0.0/16 --rule-action allow

4. aws ec2 create-network-acl-entry --network-acl-id acl-3e73c758 --ingress --rule-number 105 --protocol tcp --port-range From=22,To=22 --cidr-block 10.0.0.0/16 --rule-action allow

Outbound :
1. aws ec2 create-network-acl-entry --network-acl-id acl-3e73c758 --egress --rule-number 12 --protocol tcp --port-range From=1024,To=65535 --cidr-block 10.0.0.0/16 --rule-action allow

2. aws ec2 create-network-acl-entry --network-acl-id acl-3e73c758 --egress --rule-number 100 --protocol tcp --port-range From=1024,To=65535 --cidr-block 172.16.0.0/16 --rule-action allow

3. aws ec2 create-network-acl-entry --network-acl-id acl-3e73c758 --egress --rule-number 105 --protocol tcp --port-range From=22,To=22 --cidr-block 10.0.0.0/16 --rule-action allow

4. aws ec2 create-network-acl-entry --network-acl-id acl-3e73c758 --egress --rule-number 105 --protocol tcp --port-range From=22,To=22 --cidr-block 10.0.0.0/16 --rule-action allow



>>> Below Entries are from my partner VPC. <<<

Inbound: 

1. aws ec2 create-network-acl-entry --network-acl-id acl-3e73c758 --ingress --rule-number 12 --protocol tcp --port-range From=1024,To=65535 --cidr-block 10.0.0.0/16 --rule-action allow

2. aws ec2 create-network-acl-entry --network-acl-id acl-3e73c758 --ingress --rule-number 100 --protocol tcp --port-range From=1024,To=65535 --cidr-block 172.16.0.0/16 --rule-action allow

3. aws ec2 create-network-acl-entry --network-acl-id acl-3e73c758 --ingress --rule-number 105 --protocol tcp --port-range From=22,To=22 --cidr-block 10.0.0.0/16 --rule-action allow

4. aws ec2 create-network-acl-entry --network-acl-id acl-3e73c758 --ingress --rule-number 105 --protocol tcp --port-range From=22,To=22 --cidr-block 10.0.0.0/16 --rule-action allow

Outbound: 

1. aws ec2 create-network-acl-entry --network-acl-id acl-3e73c758 --egress --rule-number 12 --protocol tcp --port-range From=1024,To=65535 --cidr-block 10.0.0.0/16 --rule-action allow

2. aws ec2 create-network-acl-entry --network-acl-id acl-3e73c758 --egress --rule-number 100 --protocol tcp --port-range From=1024,To=65535 --cidr-block 172.16.0.0/16 --rule-action allow

3. aws ec2 create-network-acl-entry --network-acl-id acl-3e73c758 --egress --rule-number 105 --protocol tcp --port-range From=22,To=22 --cidr-block 10.0.0.0/16 --rule-action allow

4. aws ec2 create-network-acl-entry --network-acl-id acl-3e73c758 --egress --rule-number 105 --protocol tcp --port-range From=22,To=22 --cidr-block 10.0.0.0/16 --rule-action allow

## Adding Security Group rule to allow the traffic from the partner instance to my instance over the vpc peering . 

aws ec2 authorize-security-group-ingress --group-id sg-02e215e5364c59504  --ip-permissions IpProtocol=tcp,FromPort=22,ToPort=22,UserIdGroupPairs='[{GroupId=sg-0ceb8e72908d2449c,Description="Allow VPC Peering SSH connection"}]'

Doing the same on my instance. 

aws ec2 authorize-security-group-ingress --group-id sg-0ceb8e72908d2449c --ip-permissions IpProtocol=tcp,FromPort=22,ToPort=22,UserIdGroupPairs='[{GroupId=sg-02e215e5364c59504,Description="Allow VPC Peering SSH connection"}]'

##  Shared the Pem keys between the servers 

1. uploaded my EC2 instance's pem key in partner's s3 bucket.
2. Attached ec2 instance profile with s3 bucket access

## Outputs: 

<< From my Private Instance to partners private instance >>

My Private instance ip address - 172-16-0-8
Partner's private ip address - 10.0.31.227
Partner's bastion ip address - 10-0-31-227

[root@ip-172-16-0-8 ec2-user]#  ssh -i "k8s.pem" ec2-user@10.0.31.227
Last login: Mon Jul  6 07:11:44 2020 from ip-10-0-1-236.ap-southeast-2.compute.internal

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-10-0-31-227 ~]$

<< From my Partner Instance to my Private Instance >>


[root@ip-10-0-31-227 ec2-user]# ssh -i "Devopsacademy.pem" ec2-user@172.16.0.8
The authenticity of host '172.16.0.8 (172.16.0.8)' can't be established.
ECDSA key fingerprint is SHA256:lva9BSmO4DPNGWcw1mVfSg/z+rc6rCrmwtDYU2pXELM.
ECDSA key fingerprint is MD5:03:d0:46:e9:02:9c:b6:f5:48:57:f9:d3:e6:c5:dc:13.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '172.16.0.8' (ECDSA) to the list of known hosts.
Last login: Mon Jul  6 07:27:17 2020 from 172.16.53.6

       _|  _|_  )
       _|  (     /   Amazon Linux 2 AMI
      _|\__|__|

https://aws.amazon.com/amazon-linux-2/
15 package(s) needed for security, out of 24 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-16-0-8 ~]$


```

- Any extra challenges faced?

Yes a lot :( 
    
1. Initially at NACL I tried with ALL traffic for both the cidr blocks (172.16.0.0/16 , 10.0.0.0/16) and it worked fine :) . Since this is not a best practise,I updated with port 22 , but didn't work at all . 

2. I came through ephermal ports in few websites and modified the NACL rules . Finally it worked like a charm. 

References: 

https://docs.aws.amazon.com/vpc/latest/userguide/vpc-network-acls.html
https://linuxacademy.com/guide/19824-basic-security-of-your-vpc/
https://acloud.guru/forums/aws-certified-solutions-architect-associate/discussion/-KXTbI9WQu5KThwFn7wN/why-do-ephemeral-ports-need-be-added-to-the-acl-inbound-rule-set

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network12](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network12/README.md)