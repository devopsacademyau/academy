# AWS VPC + subnets

Commit all your answers to a text file `c02-network11.txt` under your folder name.

Everything is to be done preferable on Sydney region `ap-southeast-2`

## EC2

Repeat exercise from last class where you have to:

- launch an EC2 instance on a public subnet
  - attach your public SG to your public instance
- launch an EC2 instance on the same private subnet that you created your ENI
  - attach ENI created from last exercise
  - attach your private SG to your public instance
- access to your public instance using SSH
- FROM your PUBLIC instance, SSH to your private one

However this time, use your custom created subnets instead of the AWS default ones.

#### post if you had to do any troubleshooting or if that worked straight away


#### DO NOT FORGET TO DELETE YOUR RESOURCES ONCE YOU FINISH:

- ALL EC2 INSTANCES
- NAT GATEWAY
- ANY ELASTIC IP (those are charged only if you allocate one and is not being used)

You can leave the vpc, subnets, route tables, internet gateway, network acl



