# c02-network12

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Provide commands used to go through all the below deliverables: (everything should be done using the AWS cli)

  - explain how was the process to create a VPC peering
  ```
  The process of VPC peering involves the following steps:
  >> Create a VPC Peering Connection using the requester VPC ID and the accepter Account ID / VPC ID
  aws ec2 create-vpc-peering-connection --vpc-id vpc-081afcee350babdf5 --peer-vpc-id vpc-08fb60055e82efe81 --peer-owner-id 097922957316
  >The command returns:
  {
  "VpcPeeringConnection": {
      "AccepterVpcInfo": {
          "OwnerId": "097922957316",
          "VpcId": "vpc-08fb60055e82efe81",
          "Region": "ap-southeast-2"
      },
      "ExpirationTime": "2020-07-13T09:18:50+00:00",
      "RequesterVpcInfo": {
          "CidrBlock": "172.16.0.0/16",
          "CidrBlockSet": [
              {
                  "CidrBlock": "172.16.0.0/16"
              }
          ],
          "OwnerId": "438549961569",
          "PeeringOptions": {
              "AllowDnsResolutionFromRemoteVpc": false,
              "AllowEgressFromLocalClassicLinkToRemoteVpc": false,
              "AllowEgressFromLocalVpcToRemoteClassicLink": false
          },
          "VpcId": "vpc-081afcee350babdf5",
          "Region": "ap-southeast-2"
      },
      "Status": {
          "Code": "initiating-request",
          "Message": "Initiating Request to 097922957316"
      },
      "Tags": [],
      "VpcPeeringConnectionId": "pcx-01cc84cf6f2956ae5"
  }
  }
  >> Peer accepts the peering request
  aws ec2 accept-vpc-peering-connection --vpc-peering-connection-id pcx-01cc84cf6f2956ae5

  >>The SSH public key is shared to be used on the requester instance to connect via SSH
  >>Both the acceptor and requester route tables are modified to allow target as peer VPC.
  >>The NACL rule was allowed for the particular instance IP
  >>The security group of the EC2 instance is updated to accept connection from specific IP.

  ```

  - add routes from origin VPC to target VPC - only for private subnets
  ```
  aws ec2 create-route /
  --route-table-id rtb-068b99ba337982448 /
  --destination-cidr-block 172.32.0.0/16 /
  --vpc-peering-connection-id pcx-01cc84cf6f2956ae5

  Similarly, for acceptor put your CIDR as destination.

  ```
  - open any network ACL to allow the connection within the subnets -- try to   only open the mininum required

  ```
  # Allow for requester ip[Ingress rules[port 22 and 1024-65535]]
  aws ec2 create-network-acl-entry \
  --network-acl-id acl-05783519e8a3187ca \
  --ingress --rule-number 100 \
  --protocol tcp --port-range From=22,To=22 \
  --cidr-block 172.32.0.0/16 \
  --rule-action allow
  
  aws ec2 create-network-acl-entry \
  --network-acl-id acl-05783519e8a3187ca \
  --ingress --rule-number 110 \
  --protocol tcp --port-range From=1024,To=65535 \
  --cidr-block 172.32.0.0/16 \
  --rule-action allow

  # Allow for requester ip[Egress rules [port 22 and 1024-65535]]
  aws ec2 create-network-acl-entry \
  --network-acl-id acl-05783519e8a3187ca \
  --egress --rule-number 100 \
  --protocol tcp --port-range From=22,To=22 \
  --cidr-block 172.32.0.0/16 \
  --rule-action allow
  
  aws ec2 create-network-acl-entry \
  --network-acl-id acl-05783519e8a3187ca \
  --engress --rule-number 110 \
  --protocol tcp --port-range From=1024,To=65535 \
  --cidr-block 172.32.0.0/16 \
  --rule-action allow

  # Allow for home ip
  aws ec2 create-network-acl-entry \
  --network-acl-id acl-05783519e8a3187ca \
  --ingress --rule-number 120 \
  --protocol tcp --port-range From=22,To=22 \
  --cidr-block 203.214.56.109/32 \
  --rule-action allow
  
  aws ec2 create-network-acl-entry \
  --network-acl-id acl-05783519e8a3187ca \
  --egress --rule-number 120 \
  --protocol tcp --port-range From=1024,To=65535 \
  --cidr-block 203.214.56.109/32 \
  --rule-action allow

  > SSH and some others AWS service might need to establish a connection with a random port in order to allow the traffic. Thats is why ephemeral port range is given.

  ```
  - from an instance in one vpc, SSH to the other instance (will have to share   the ssh keys, create a new one just for this exercise -- pay attention to   security)
   ```
  ssh-keygen -t rsa -b 4096 -C "abc@gmail.com"
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/id_rsa

  ssh -A ec2-user@52.23.45.11
  ssh ec2-user@172.32.0.208
   ```
  - open any security group to allow the SSH communication between the   instances
   ```
    aws ec2 authorize-security-group-ingress \
        --group-id sg-0dbcb08b5a1b39c45 \
        --protocol tcp \
        --port 22 \
        --cidr 172.32.0.0/16
   ```  


- Any extra challenges faced?
```
Updating route tables and security groups for both acoounts. Figuring out if VPC peer connection is two way. On deleting a VPC peer connection, the peering ID is shown as black hole in the route entries of your peer.
```



***
Answer for exercise [c02-network12](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network12/README.md)
