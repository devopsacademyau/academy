# c02-network12

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Provide commands used to go through all the below deliverables: (everything should be done using the AWS cli)

  - **explain how was the process to create a VPC peering**
    1. Create a VPC Peering Connection using the requester VPC ID and the accepter Account ID / VPC ID
        ```bash
        $ aws ec2 create-vpc-peering-connection \
            --peer-owner-id 438549961569 \
            --peer-vpc-id vpc-081afcee350babdf5 \
            --vpc-id vpc-08fb60055e82efe81
            
        VpcPeeringConnection:
          AccepterVpcInfo:
            OwnerId: '438549961569'
            Region: ap-southeast-2
            VpcId: vpc-081afcee350babdf5
          ExpirationTime: '2020-07-11T10:02:28+00:00'
          RequesterVpcInfo:
            CidrBlock: 172.32.0.0/16
            CidrBlockSet:
            - CidrBlock: 172.32.0.0/16
            OwnerId: '097922957316'
            PeeringOptions:
              AllowDnsResolutionFromRemoteVpc: false
              AllowEgressFromLocalClassicLinkToRemoteVpc: false
              AllowEgressFromLocalVpcToRemoteClassicLink: false
            Region: ap-southeast-2
            VpcId: vpc-08fb60055e82efe81
          Status:
            Code: initiating-request
            Message: Initiating Request to 438549961569
          Tags: []
          VpcPeeringConnectionId: pcx-0107f45bf4b7e1ea9
        ```
    2. The accepter should accept the VPC Peering Connection
        ```bash
        $ aws ec2 accept-vpc-peering-connection \
            --vpc-peering-connection-id pcx-0107f45bf4b7e1ea9
        ```
    3. Share the public key pair to be used on the requester EC2 instance which will be connected via SSH.
    4. Update the route table used by the requester VPC ID to add the IP Range from the accepter VPC ID and the Peering Connection ID.
    
        4.1 The Requester should also update its route table refering to the IP Range from Accepter VPC ID
        
    5. Update the security group from requester to accept SSH (22) connection from accepter IP Range or specific EC2 Instance IP Address.
    

  - **add routes from origin VPC to target VPC - only for private subnets**
  
    ```bash
    # Requester
    $ aws ec2 create-route \
        --destination-cidr-block 172.16.0.0/16 \
        --vpc-peering-connection-id pcx-094d89b026a8b0740 \
        --route-table-id rtb-0fcbbbb1627418bed
    
    # Accepter
    $ aws ec2 create-route \
        --destination-cidr-block 172.32.0.0/16 \
        --vpc-peering-connection-id pcx-094d89b026a8b0740 \
        --route-table-id rtb-0f5b2e7a42466bb7d
    ```
        
  - **open any network ACL to allow the connection within the subnets -- try to   only open the mininum required**
  
     ```bash
     $ aws ec2 create-network-acl-entry \
        --ingress \
        --protocol tcp \
        --port-range From=22,To=22 \
        --rule-action allow \
        --rule-number 50 \
        --cidr-block 172.16.0.0/16 \
        --network-acl-id acl-0d8c558dce861a252
     ```
  
  - **from an instance in one vpc, SSH to the other instance (will have to share   the ssh keys, create a new one just for this exercise -- pay attention to   security)**
  
      ```bash
        $ ssh -A ec2-user@3.104.111.22
        Last login: Sat Jul  4 09:03:11 2020 from 172.32.0.208
        
               __|  __|_  )
               _|  (     /   Amazon Linux 2 AMI
              ___|\___|___|
        
        https://aws.amazon.com/amazon-linux-2/
        13 package(s) needed for security, out of 22 available
        Run "sudo yum update" to apply all updates.
        [ec2-user@ip-172-16-10-36 ~]$ ssh ec2-user@172.32.0.208
        ^C
        [ec2-user@ip-172-16-10-36 ~]$ ssh ec2-user@172.32.0.208
        The authenticity of host '172.32.0.208 (172.32.0.208)' can't be established.
        ECDSA key fingerprint is SHA256:Megp8TJ6pQ6zYK63gf6PDB6taOvYIdKXwMVqiHcNs4o.
        ECDSA key fingerprint is MD5:60:f8:fe:aa:df:f9:4b:da:e0:21:aa:fa:57:35:11:0f.
        Are you sure you want to continue connecting (yes/no)? yes
        Warning: Permanently added '172.32.0.208' (ECDSA) to the list of known hosts.
        Last login: Sat Jul  4 12:49:13 2020 from 122-148-135-233.sta.wbroadband.net.au
        
               __|  __|_  )
               _|  (     /   Amazon Linux 2 AMI
              ___|\___|___|
        
        https://aws.amazon.com/amazon-linux-2/
        15 package(s) needed for security, out of 24 available
        Run "sudo yum update" to apply all updates.
        [ec2-user@ip-172-32-0-208 ~]$
      ```
  
  - **open any security group to allow the SSH communication between the  instances**
  
    ```bash
    $ aws ec2 authorize-security-group-ingress \
        --group-id sg-035e5a3df769a4114 \
        --protocol tcp \
        --port 22 \
        --cidr 172.16.0.0/16
    ```

- Any extra challenges faced?

    ```
    The steps to update Route Table and Security Group were quite confuse when we started.
    The route table should be update in both accounts (accepter and requester) each one referring to the other VPC.
    
    I deleted a peer connection once and my peer ended up with "blackhole" entries in their route tables.
    Deleting the peer connection using the console will delete the route table entries on my account but not on theirs.
    ```


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network12](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network12/README.md)