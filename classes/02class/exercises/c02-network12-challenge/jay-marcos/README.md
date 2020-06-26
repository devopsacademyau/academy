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
# Create peering connection (Marcos)

aws ec2 create-vpc-peering-connection \
    --vpc-id vpc-marcos \
    --peer-vpc-id vpc-jay

# Accept peering connection (Jay)

aws ec2 accept-vpc-peering-connection \
    --vpc-peering-connection-id pcx-???

# Edit route tables that need communication

# Marcos

aws ec2 create-route \
    --route-table-id rtb-0fd603c6c542d8aaf \
    --destination-cidr-block 192.168.0.0/16 \
    --vpc-peering-connection-id pcx-???

# Jay

aws ec2 create-route \
    --route-table-id rtb-??? \
    --destination-cidr-block 10.11.0.0/16 \
    --vpc-peering-connection-id pcx-???

# Verify applicable Security Groups

# Verify applicable NACLs
```

- Any extra challenges faced?


***
Answer for exercise [c02-network12](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network12/README.md)
