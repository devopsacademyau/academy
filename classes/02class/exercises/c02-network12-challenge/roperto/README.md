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
### Carlos details (requester) ###
    VPC: vpc-012017b09f0dae62e
   CIDR: 10.10.0.0/16
ACCOUNT: 016454647794
PEER_ID: pcx-09108b1bc914ab7cf 

### My details (accepter) ###
    VPC: vpc-0b374a631c3066687
   CIDR: 10.42.0.0/16
ACCOUNT: roperto (073145331885)
 PUBKEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCm4Hjs49ygbsW83/1VXvSTWjlfb9daCYkSFYq7YP2SXTfLW5VP1LRbKPsbyvZBEruxiR3DAQS1pgRuME+9NWr9peeEq23kivOQqj+nyyxMUFZQyohDuhSdV0PQyQEacma6NT8tqexBoHVPjsvfLBUVBlnhgpZaw2muNs31Q+eW7PVD3dtf5TdQJu6VzKjY4YEA3O8F5pVpxD2iDwAjmtsAHHd6MRqi4fE8azlXL3/zWUW/FuPv5oTxXOJ4z+Zji74KIWelmotDrzTIQ5hrulq2oUJC97G9P2FVOvHnnjTHh/4LOQCU3sG9siymmi0FyRUfwIjCLv4m8/ZpFZAgZVvp daniel@roperto.aws

# NOT USED -- I am the accepter
aws ec2 create-vpc-peering-connection --vpc-id vpc-0b374a631c3066687 \
    --peer-vpc-id vpc-012017b09f0dae62e --peer-owner-id 016454647794 \
    --query VpcPeeringConnection.VpcPeeringConnectionId --output text

# Accept
aws ec2 accept-vpc-peering-connection --vpc-peering-connection-id pcx-09108b1bc914ab7cf \
    --query VpcPeeringConnection.Status --output table
----------------------------------
|   AcceptVpcPeeringConnection   |
+---------------+----------------+
|     Code      |    Message     |
+---------------+----------------+
|  provisioning |  Provisioning  |
+---------------+----------------+

# Wait for it ....
aws ec2 describe-vpc-peering-connections --vpc-peering-connection-ids pcx-09108b1bc914ab7cf --query VpcPeeringConnections[-1].Status --output table
-------------------------------
|DescribeVpcPeeringConnections|
+-------------+---------------+
|    Code     |    Message    |
+-------------+---------------+
|  active     |  Active       |
+-------------+---------------+

# Create route (private)
aws ec2 create-route --route-table-id rtb-0f7e7ba92abad20ec --destination-cidr-block 10.10.0.0/16 --vpc-peering-connection-id pcx-09108b1bc914ab7cf

# Allow in SG (private) -- SSH and PING
aws ec2 authorize-security-group-ingress --group-id sg-08e0247ebdc082d73 --protocol tcp --port 22 --cidr 10.10.0.0/16
aws ec2 authorize-security-group-ingress --group-id sg-08e0247ebdc082d73 --protocol icmp --port 8--1 --cidr 10.10.0.0/16

# SSH into my private machine via the public
ssh -A -J ec2-user@13.236.6.49 ec2-user@10.42.10.182

[ec2-user@ip-10-42-10-182 ~]$ ping 10.10.1.4
PING 10.10.1.4 (10.10.1.4) 56(84) bytes of data.
64 bytes from 10.10.1.4: icmp_seq=1 ttl=255 time=0.805 ms

[ec2-user@ip-10-42-10-182 ~]$ who
ec2-user pts/0        2020-07-09 06:56 (10.42.20.110)
ec2-user pts/1        2020-07-09 07:08 (10.10.1.4) ### Carlos is here

[ec2-user@ip-10-42-10-182 ~]$ ssh 10.10.1.4
[ec2-user@ip-10-10-1-4 ~]$ wall 'I am here!!!'
Broadcast message from ec2-user@ip-10-10-1-4.ap-southeast-2.compute.internal (pts/2) (Thu Jul  9 07:02:11 2020):

I am here!!!

```

- Any extra challenges faced?

> We could not use security-groups sourcing (even prefixing with the account id) which is documented as possible.
> Probably we just didn't try hard enough :-)

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network12](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network12/README.md)