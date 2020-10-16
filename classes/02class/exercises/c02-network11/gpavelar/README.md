# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```bash
#
aws ec2 create-key-pair --key-name devops-class --query 'KeyMaterial' --output text > DevOps-academy.pem

# Check my key
aws ec2 describe-key-pairs --key-name devops-class

## output
KEYPAIRS        79:67:2d:97:cc:8f:e2:90:81:a7:47:77:eb:f1:28:a6:2d:f4:26:bf     devops-class    key-03f38cdf9b7e0a379

## Creating VPC
aws ec2 create-vpc --cidr-block 10.0.0.0/16 --no-amazon-provided-ipv6-cidr-block --instance-tenancy default
## output
VPC     10.0.0.0/16     dopt-9dc3e8fa   default False   478433196210    pending vpc-06827fa1483ceefbb
CIDRBLOCKASSOCIATIONSET vpc-cidr-assoc-07f9ab9cb7afa1333        10.0.0.0/16
CIDRBLOCKSTATE  associated

# Tag VPC
aws ec2 create-tags --resources vpc-06827fa1483ceefbb --tags Key="Name",Value="devopsacademy-vpc"


## First Subnet -
aws ec2 create-subnet --vpc-id vpc-06827fa1483ceefbb --cidr-block 10.0.1.0/24 --availability-zone ap-southeast-2a
# Output
SUBNET  False   ap-southeast-2a apse2-az3       251     10.0.1.0/24     False   False   478433196210    available       arn:aws:ec2:ap-southeast-2:478433196210:subnet/subnet-07d346a3d6352cd1d subnet-07d346a3d6352cd1d        vpc-06827fa1483ceefbb

## Tag Private-A
aws ec2 create-tags --resources subnet-07d346a3d6352cd1d --tags Key=Name,Value=private-a

## Second Subnet
aws ec2 create-subnet --vpc-id vpc-06827fa1483ceefbb --cidr-block 10.0.2.0/24 --availability-zone ap-southeast-2a
# Output
SUBNET  False   ap-southeast-2a apse2-az3       251     10.0.2.0/24     False   False   478433196210    available       arn:aws:ec2:ap-southeast-2:478433196210:subnet/subnet-0199a74fced47a556 subnet-0199a74fced47a556        vpc-06827fa1483ceefbb

## Tag Public-A
  aws ec2 create-tags --resources subnet-0199a74fced47a556 --tags Key=Name,Value=public-a

####################
## Third Subnet
aws ec2 create-subnet --vpc-id vpc-06827fa1483ceefbb --cidr-block 10.0.3.0/24 --availability-zone ap-southeast-2b
# Output
SUBNET  False   ap-southeast-2b apse2-az1       251     10.0.3.0/24     False   False   478433196210
    available       arn:aws:ec2:ap-southeast-2:478433196210:subnet/subnet-03d7f9104edf72974 subnet-03d7f9104edf72974        vpc-06827fa1483ceefbb

## Tag Private-B
aws ec2 create-tags --resources subnet-03d7f9104edf72974  --tags Key=Name,Value=private-b

## Fourth Subnet
aws ec2 create-subnet --vpc-id vpc-06827fa1483ceefbb --cidr-block 10.0.4.0/24 --availability-zone ap-southeast-2b
# Output
SUBNET  False   ap-southeast-2b apse2-az1       251     10.0.4.0/24     False   False   478433196210
    available       arn:aws:ec2:ap-southeast-2:478433196210:subnet/subnet-0840caef3cf6097e1 subnet-0840caef3cf6097e1        vpc-06827fa1483ceefbb

## Tag Public-B
aws ec2 create-tags --resources subnet-0840caef3cf6097e1 --tags Key=Name,Value=public-b

## Fifth Subnet
aws ec2 create-subnet --vpc-id vpc-06827fa1483ceefbb --cidr-block 10.0.5.0/24 --availability-zone ap-southeast-2c

# Output
SUBNET  False   ap-southeast-2c apse2-az2       251     10.0.5.0/24     False   False   478433196210
    available       arn:aws:ec2:ap-southeast-2:478433196210:subnet/subnet-05490791d29889d99 subnet-05490791d29889d99        vpc-06827fa1483ceefbb

## Tag Private-C
aws ec2 create-tags --resources subnet-05490791d29889d99 --tags Key=Name,Value=private-c

## Sixth Subnet
aws ec2 create-subnet --vpc-id vpc-06827fa1483ceefbb --cidr-block 10.0.6.0/24 --availability-zone ap-southeast-2c

# Output
SUBNET  False   ap-southeast-2c apse2-az2       251     10.0.6.0/24     False   False   478433196210
    available       arn:aws:ec2:ap-southeast-2:478433196210:subnet/subnet-0ba4c64ad00dde7c2 subnet-0ba4c64ad00dde7c2        vpc-06827fa1483ceefbb

## Tag Public-C
aws ec2 create-tags --resources subnet-0ba4c64ad00dde7c2  --tags Key=Name,Value=public-c

########################
aws ec2 create-internet-gateway --tag-specifications 'ResourceType="internet-gateway",Tags=[{Key="Name",Value="devopsacademy-igw"}]'

## Output
INTERNETGATEWAY igw-07d4e7bda06c83726   478433196210
TAGS    Name    devopsacademy-igw

### Attach IGW to VPC
aws ec2 attach-internet-gateway --vpc-id vpc-06827fa1483ceefbb --internet-gateway-id igw-07d4e7bda06c83726

## Describe Internet Gateway
aws ec2 describe-internet-gateways
## Output
INTERNETGATEWAYS        igw-07d4e7bda06c83726   478433196210
ATTACHMENTS     available       vpc-06827fa1483ceefbb
TAGS    Name    devopsacademy-igw

## if you wanna delete IGW, you need to detach
###

## Allocate IP
aws ec2 allocate-address --domain vpc
## Output
eipalloc-04f227f5aee70f732      vpc     ap-southeast-2  54.79.11.148    amazon

## Create NAT gateway in a public subnet.
aws ec2 create-nat-gateway --allocation-id eipalloc-04f227f5aee70f732 --subnet-id subnet-0199a74fced47a556 --tag-specifications 'ResourceType="natgateway",Tags=[{Key="Name",Value="devopsacademy-ngw"}]'

## output
d3e404ab-0988-4a00-8420-e09d133ca0bf
NATGATEWAY      2020-08-18T01:00:37+00:00       nat-0272180ec267ab3e0   pending subnet-0199a74fced47a556        vpc-06827fa1483ceefbb
NATGATEWAYADDRESSES     eipalloc-04f227f5aee70f732
TAGS    Name    devopsacademy-ngw


## Create route table PUBLIC
aws ec2 create-route-table --vpc-id vpc-06827fa1483ceefbb
## output
ROUTETABLE      478433196210    rtb-0d925597d5f91e722   vpc-06827fa1483ceefbb
ROUTES  10.0.0.0/16     local   CreateRouteTable        active

## Tag
aws ec2 create-tags --resources rtb-0d925597d5f91e722 --tags Key=Name,Value=devopsacademy-rt-public

## Create route table PRIVATE
aws ec2 create-route-table --vpc-id vpc-06827fa1483ceefbb
# output
ROUTETABLE      478433196210    rtb-071d69274e1d0dfe3   vpc-06827fa1483ceefbb
ROUTES  10.0.0.0/16     local   CreateRouteTable        active

# Tag route table with specific name
aws ec2 create-tags --resources rtb-071d69274e1d0dfe3  --tags Key=Name,Value=devopsacademy-rt-private

###
# Public Subnets:
# 1.subnet-0199a74fced47a556
# 2.subnet-0840caef3cf6097e1
# 3.subnet-0ba4c64ad00dde7c2
#
## Associate route table to public subnets
aws ec2 associate-route-table  --subnet-id subnet-0199a74fced47a556 --route-table-id rtb-0d925597d5f91e722
## Output
rtbassoc-053590d798c0ae552
ASSOCIATIONSTATE        associated
(END)


## Associate route table to public subnets
aws ec2 associate-route-table  --subnet-id subnet-0840caef3cf6097e1 --route-table-id rtb-0d925597d5f91e722
## output
rtbassoc-0f59c08f07dda5e73
ASSOCIATIONSTATE        associated

## Associate route table to public subnets
aws ec2 associate-route-table  --subnet-id subnet-0ba4c64ad00dde7c2 --route-table-id rtb-0d925597d5f91e722
## output
rtbassoc-0699208abf58c9123
ASSOCIATIONSTATE        associated

###
# PRIVATE Subnets:
# 1.subnet-07d346a3d6352cd1d
# 2.subnet-03d7f9104edf72974
# 3.subnet-05490791d29889d99
#
## Associate route table to PRIVATE subnets
aws ec2 associate-route-table  --subnet-id subnet-07d346a3d6352cd1d --route-table-id rtb-071d69274e1d0dfe3

## Output
rtbassoc-0c8f09008b0703669
ASSOCIATIONSTATE        associated

## Associate route table to PRIVATE subnets
aws ec2 associate-route-table  --subnet-id subnet-03d7f9104edf72974 --route-table-id rtb-071d69274e1d0dfe3
## Output
rtbassoc-061786cb73c10eb00
ASSOCIATIONSTATE        associated

## Associate route table to PRIVATE subnets
aws ec2 associate-route-table  --subnet-id subnet-05490791d29889d99 --route-table-id rtb-071d69274e1d0dfe3
## Output
rtbassoc-01fb27342cc68e1f4
ASSOCIATIONSTATE        associated

##
# Create route between public subnet
# and
# igw
#
aws ec2 create-route --route-table-id rtb-0d925597d5f91e722  --destination-cidr-block 0.0.0.0/0 --gateway-id igw-07d4e7bda06c83726
## Output
True
(END)

##
# Create route between private subnet
# and
# ngw
#
aws ec2 create-route --route-table-id rtb-071d69274e1d0dfe3 --destination-cidr-block 0.0.0.0/0 --gateway-id nat-0272180ec267ab3e0
## Output
True
(END)


###
# Creating ACK
# VPC ID vpc-06827fa1483ceefbb
aws ec2 create-network-acl --vpc-id vpc-06827fa1483ceefbb
# Output
NETWORKACL      False   acl-0126d71a25f1e5840   478433196210    vpc-06827fa1483ceefbb
ENTRIES 0.0.0.0/0       True    -1      deny    32767
ENTRIES 0.0.0.0/0       False   -1      deny    32767

##
# Inbound rule for
#
aws ec2 create-network-acl-entry --ingress --network-acl-id acl-0126d71a25f1e5840 --protocol 6 --rule-action  deny --rule-number 1 --port-range From=22,To=22 --cidr-block 172.16.200.0/24
# output
none

##
# Outbound
#
aws ec2 create-network-acl-entry --egress --network-acl-id acl-0126d71a25f1e5840  --protocol -1 --rule-action deny --rule-number 2 --cidr-block 180.200.50.0/24
# Output
none


## Result
aws ec2 describe-network-acls --filters Name=network-acl-id,Values=acl-0126d71a25f1e5840

# Output
NETWORKACLS     False   acl-0126d71a25f1e5840   478433196210    vpc-06827fa1483ceefbb
ENTRIES 180.200.50.0/24 True    -1      deny    2
ENTRIES 0.0.0.0/0       True    -1      deny    32767
ENTRIES 172.16.200.0/24 False   6       deny    1
PORTRANGE       22      22
ENTRIES 0.0.0.0/0       False   -1      deny    32767



###
# Create security group to
# be acessed from my HOME
#
aws ec2 create-security-group --group-name public-sg --description "SSH access from home to AWS" --vpc-id vpc-06827fa1483ceefbb --tag-specifications 'ResourceType="security-group",Tags=[{Key="Name",Value="public-sg"}]'
## Output
sg-011626280b4d0b8c1
TAGS    Name    public-sg

###
# Create security group private
#
aws ec2 create-security-group --group-name private-sg --description "SSH access only from public instances on AWS" --vpc-id vpc-06827fa1483ceefbb --tag-specifications 'ResourceType="security-group",Tags=[{Key="Name",Value="private-sg"}]'

## Output
sg-09f8a3ed5ec0236ed
TAGS    Name    private-sg

##
# Allow ingress from my IP
#
##############################
## 122.199.60.10            ##
## Your public IP address   ##
##############################
aws ec2 authorize-security-group-ingress --group-id sg-011626280b4d0b8c1 --protocol tcp --port 22 --cidr 122.199.60.10/32
# Output
none

##
# Allow ingress from public instance
# on private AWS
#
aws ec2 authorize-security-group-ingress --group-id sg-09f8a3ed5ec0236ed --protocol tcp --port 22 --source-group sg-011626280b4d0b8c1
# Output
none

###
# PRIVATE Subnets:
# 1.subnet-07d346a3d6352cd1d
# 2.subnet-03d7f9104edf72974
# 3.subnet-05490791d29889d99
#

###
# Create ENI
#
aws ec2 create-network-interface \
 --subnet-id subnet-07d346a3d6352cd1d \
 --description "my network interface" \
 --groups sg-09f8a3ed5ec0236ed \ --private-ip-address 10.0.1.17
## Output
NETWORKINTERFACE        ap-southeast-2a my network interface    interface       06:8b:83:17:58:fa
       eni-07956508a5eba2f20   478433196210    10.0.1.17       AIDAW6ZGXHCZC7ESLQHIS   False   True    pending subnet-07d346a3d6352cd1d        vpc-06827fa1483ceefbb
GROUPS  sg-09f8a3ed5ec0236ed    private-sg
PRIVATEIPADDRESSES      True    10.0.1.17


#################################
# Public Subnets:               #
# 1.subnet-0199a74fced47a556    #
# 2.subnet-0840caef3cf6097e1    #
# 3.subnet-0ba4c64ad00dde7c2    #
#                               #
#################################
# PRIVATE Subnets:              #
# 1.subnet-07d346a3d6352cd1d    #
# 2.subnet-03d7f9104edf72974    #
# 3.subnet-05490791d29889d99    #
#################################

###
aws ec2 run-instances \
  --image-id ami-0ded330691a314693 \
  --count 1 \
  --instance-type t2.micro \
  --key-name devops-class \
  --subnet-id subnet-0199a74fced47a556 \
  --security-group-ids sg-011626280b4d0b8c1 \
  --associate-public-ip-address
## Output
478433196210    r-0c6d0b6d383ccd3d9
INSTANCES       0       x86_64  12966b4f-0d32-4591-a465-b0f8e9751061    False   xen     ami-0ded330691a314693   i-08c7afc5fab87c880     t2.micro        devops-class    2020-08-18T04:13:37+00:00       ip-10-0-2-227.ap-southeast-2.compute.internal   10.0.2.227              /dev/xvda       ebs     True
        subnet-0199a74fced47a556        hvm     vpc-06827fa1483ceefbb
CAPACITYRESERVATIONSPECIFICATION        open
CPUOPTIONS      1       1
METADATAOPTIONS enabled 1       optional        pending
MONITORING      disabled
NETWORKINTERFACES               interface       06:d8:8e:af:44:4c       eni-085bbfe9c2acf9962   478433196210    10.0.2.227      True    in-use  subnet-0199a74fced47a556        vpc-06827fa1483ceefbb
ATTACHMENT      2020-08-18T04:13:37+00:00       eni-attach-0ddf57f59253f5d02    True    0       attaching
GROUPS  sg-011626280b4d0b8c1    public-sg
PRIVATEIPADDRESSES      True    10.0.2.227
PLACEMENT       ap-southeast-2a         default
SECURITYGROUPS  sg-011626280b4d0b8c1    public-sg
STATE   0       pending
STATEREASON     pending pending

```

```bash


######################
###
# Private security group
# sg-09f8a3ed5ec0236ed
###
# Private subnet
# subnet-07d346a3d6352cd1d
#


Add your commands and their outputs here
```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```

## Run instance
aws ec2 run-instances \
  --image-id ami-0ded330691a314693 \
  --count 1 \
  --instance-type t2.micro \
  --key-name devops-class \
  --network-interfaces '[{"NetworkInterfaceId":"eni-07956508a5eba2f20","DeviceIndex":0}]'

## Output
478433196210    r-082ee735570438866
INSTANCES       0       x86_64  b97952a4-da9b-4a7f-b875-ac3d5cadcc98    False   xen     ami-0ded330691a314693   i-08a1a38a94898de0c     t2.micro        devops-class    2020-08-18T04:45:36+00:00       ip-10-0-1-17.ap-southeast-2.compute.internal    10.0.1.17               /dev/xvda       ebs     True
        subnet-07d346a3d6352cd1d        hvm     vpc-06827fa1483ceefbb
CAPACITYRESERVATIONSPECIFICATION        open
CPUOPTIONS      1       1
METADATAOPTIONS enabled 1       optional        pending
MONITORING      disabled
NETWORKINTERFACES       my network interface    interface       06:8b:83:17:58:fa       eni-07956508a5eba2f20   478433196210    10.0.1.17       True    in-use  subnet-07d346a3d6352cd1d        vpc-06827fa1483ceefbb
ATTACHMENT      2020-08-18T04:45:36+00:00       eni-attach-0f53d42129a7aff6f    False   0       attaching
GROUPS  sg-09f8a3ed5ec0236ed
PRIVATEIPADDRESSES      True    10.0.1.17
PLACEMENT       ap-southeast-2a         default
SECURITYGROUPS  sg-09f8a3ed5ec0236ed
STATE   0       pending
STATEREASON     pending pending
```

- Commands for accessing your public instance using ssh

```
### SSH
# IP: 13.239.121.85
ssh-agent bash

ssh-add DevOps-academy.pem

ssh -A ec2-user@13.239.121.85
The authenticity of host '13.239.121.85 (13.239.121.85)' can't be established.
ECDSA key fingerprint is SHA256:d6mTrrZ3IybSZdSBCSQhFSqc8ICTmvw9BMMBe3vJcZ4.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '13.239.121.85' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-0-2-227 ~]$
```

- Commands for accessing your private instance from public one

```
[ec2-user@ip-10-0-2-227 ~]$ ssh -i "DevOps-academy.pem" ec2-user@10.0.1.17
Warning: Identity file DevOps-academy.pem not accessible: No such file or directory.
The authenticity of host '10.0.1.17 (10.0.1.17)' can't be established.
ECDSA key fingerprint is SHA256:vaZ8HfC9HPVLWD4u8NySQ3DCqSgtVNFRizQFweuPX3U.
ECDSA key fingerprint is MD5:f3:16:71:9f:93:c6:4f:5c:e8:4b:c1:3c:8d:b2:78:a7.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '10.0.1.17' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.
```

- Commands for testing ping to `8.8.8.8` from private instance

```
[ec2-user@ip-10-0-1-17 ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=108 time=1.63 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=108 time=1.28 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=108 time=1.25 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=108 time=1.26 ms
64 bytes from 8.8.8.8: icmp_seq=5 ttl=108 time=1.27 ms
64 bytes from 8.8.8.8: icmp_seq=6 ttl=108 time=1.27 ms
64 bytes from 8.8.8.8: icmp_seq=7 ttl=108 time=1.32 ms
```

- Any extra challenges faced?

> I thought I had submitted this exercise. I had deleted all resources, so i had to created it again :/. Checking everything, and I did a mess while saving all importante ids.

---

Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)
