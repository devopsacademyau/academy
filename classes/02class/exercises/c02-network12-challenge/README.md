# AWS VPC + subnets

Commit all your answers to a text file `c02-network12.txt` under your folder name.

Everything is to be done preferable on Sydney region `ap-southeast-2`

## VPC Peering

Once you have your custom VPC + Subnets + NACL's + Security Groups in place and tested (up to exercise c02-network-11 completed), pair with someone else and create a VPC peering within your vpc's.

Few definitions assumed in this exercise:

- your VPC = origin VPC
- someone else's VPC = target VPC

#### Deliverables

- explain how was the process to create a VPC peering
- add routes from origin VPC to target VPC - only for private subnets
- open any network ACL to allow the connection within the subnets -- try to only open the mininum required
- from an instance in one vpc, SSH to the other instance (will have to share the ssh keys, create a new one just for this exercise -- pay attention to security)
- open any security group to allow the SSH communication between the instances
- explain any learnings from this process

## References

[What is a VPC Peering and How to do it?](https://docs.aws.amazon.com/vpc/latest/peering/what-is-vpc-peering.html)
