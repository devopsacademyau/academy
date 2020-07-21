# c02-network12

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Provide commands used to go through all the below deliverables: (everything should be done using the AWS cli)

  - explain how was the process to create a VPC peering
  - add routes from origin VPC to target VPC - only for private subnets
  - open any network ACL to allow the connection within the subnets -- try to   only open the mininum required
  - from an instance in one vpc, SSH to the other instance (will have to share   the ssh keys, create a new one just for this exercise -- pay attention to   security)
  - open any security group to allow the SSH communication between the   instances

- Explain how was the process to create a VPC peering

    Requester: Yvonne Yao

    Accepter: Alan Lima

    1. Create a VPC Peering Connection (Requester)
    ```bash
    aws ec2 create-vpc-peering-connection \
        --peer-owner-id 097922957316 \
        --peer-vpc-id vpc-0233a75b29ad6d50d \
        --vpc-id vpc-02ec2836691642ace
    #Output:
     {
        "VpcPeeringConnection": {
            "AccepterVpcInfo": {
                "OwnerId": "097922957316",
                "VpcId": "vpc-0233a75b29ad6d50d",
                "Region": "ap-southeast-2"
            },
            "ExpirationTime": "2020-07-19T07:01:53+00:00",
            "RequesterVpcInfo": {
                "CidrBlock": "10.128.0.0/16",
                "CidrBlockSet": [
                    {
                        "CidrBlock": "10.128.0.0/16"
                    }
                ],
                "OwnerId": "421117346104",
                "PeeringOptions": {
                    "AllowDnsResolutionFromRemoteVpc": false,
                    "AllowEgressFromLocalClassicLinkToRemoteVpc": false,
                    "AllowEgressFromLocalVpcToRemoteClassicLink": false
                },
                "VpcId": "vpc-02ec2836691642ace",
                "Region": "ap-southeast-2"
            },
            "Status": {
                "Code": "initiating-request",
                "Message": "Initiating Request to 097922957316"
            },
            "Tags": [],
            "VpcPeeringConnectionId": "pcx-02c518cc76d701c28"
        }
    }

    ```
    2. Accept the VPC Peering Connection(Accepter)
    ```bash
   VCP_PEER_ID=pcx-02c518cc76d701c28
    $ aws ec2 accept-vpc-peering-connection \
        --vpc-peering-connection-id $VCP_PEER_ID
    ```
    3. Sharing Public Key (Requester)

- Add routes from origin VPC to target VPC - only for private subnets

    ```bash
    # Requester
    aws ec2 create-route \
        --destination-cidr-block 172.32.0.0/16 \
        --vpc-peering-connection-id $VCP_PEER_ID \
        --route-table-id rtb-09372f74dd553e507
    # Output: -- "Return": true
    # Accepter
    aws ec2 create-route \
        --destination-cidr-block 10.128.0.0/16 \
        --vpc-peering-connection-id pcx-02c518cc76d701c28 \
        --route-table-id rtb-002883646030d9b06
    ```

- Open any network ACL to allow the connection within the subnets -- try to only open the mininum required
    ```bash
    # requester: allow ingress/egress from peer
    aws ec2 create-network-acl-entry \
        --network-acl-id acl-0c99c61dea421885c \
        --ingress \
        --rule-number 100 \
        --protocol tcp \
        --port-range From=22,To=22 \
        --cidr-block 172.32.0.0/16 \
       --rule-action allow
    aws ec2 create-network-acl-entry \
        --network-acl-id acl-0c99c61dea421885c \
        --ingress \
        --rule-number 110 \
        --protocol tcp \
        --port-range From=1024,To=65535  \
        --cidr-block 172.32.0.0/16 \
        --rule-action allow
    aws ec2 create-network-acl-entry \
        --network-acl-id acl-0c99c61dea421885c \
        --egress \
        --rule-number 100 \
        --protocol tcp \
        --port-range From=22,To=22 \
        --cidr-block 172.32.0.0/16 \
        --rule-action allow
    aws ec2 create-network-acl-entry \
        --network-acl-id acl-0c99c61dea421885c \
        --egress \
        --rule-number 110 \
        --protocol tcp \
        --port-range From=1024,To=65535 \
        --cidr-block 172.32.0.0/16 \
        --rule-action allow
    ## requester: allow ingress/egress from myself
    aws ec2 create-network-acl-entry \
        --network-acl-id acl-0c99c61dea421885c \
        --ingress \
        --rule-number 200 \
        --protocol tcp \
        --port-range From=22,To=22 \
        --cidr-block 110.144.1.179/32 \
        --rule-action allow
    aws ec2 create-network-acl-entry \
        --network-acl-id acl-0c99c61dea421885c \
        --egress \
        --rule-number 200 \
        --protocol tcp \
        --port-range From=1024,To=65535 \
        --cidr-block 110.144.1.179/32 \
        --rule-action allow    
     ```
- Update security groups to allow the SSH communication between the instances
    ```bash
    # Requester
    aws ec2 authorize-security-group-ingress \
        --group-id sg-03c842207ddde4f96 \
        --protocol tcp \
        --port 22 \
        --cidr 172.32.0.0/16
    # Accepter
    aws ec2 authorize-security-group-ingress \
        --group-id sg-************* \
        --protocol tcp \
        --port 22 \
        --cidr 10.128.0.0/16
    ```

- From an instance in one vpc, SSH to the other instance (will have to share  the ssh keys, create a new one just for this exercise -- pay attention to security)
    ```bash
    From requester:
    use PuTTy ->ec2-user@3.25.113.153
    Using username "ec2-user".
    Authenticating with public key "imported-openssh-key" from agent
    Last login: Sun Jul 12 07:27:14 2020 from 110.144.1.179

           __|  __|_  )
           _|  (     /   Amazon Linux 2 AMI
          ___|\___|___|

    https://aws.amazon.com/amazon-linux-2/
    13 package(s) needed for security, out of 22 available
    Run "sudo yum update" to apply all updates.
    [ec2-user@ip-10-128-10-137 ~]$ ssh ec2-user@172.32.0.92
    Last login: Sun Jul 12 07:38:25 2020 from ip-10-128-10-137.ap-southeast-2.compute.internal

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

    https://aws.amazon.com/amazon-linux-2/
    13 package(s) needed for security, out of 22 available
    Run "sudo yum update" to apply all updates.
    [ec2-user@ip-172-32-0-92 ~]$
    ```


- Any extra challenges faced?
    ```
    It is challenging on how to set NACL rules. Thanks for Alan's kind help, I finished the exercise. Thanks to be a menber of DA, I get helping fom others and communications with them. That is my biggest gain. Thank you all.

    ```


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network12](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network12/README.md)
