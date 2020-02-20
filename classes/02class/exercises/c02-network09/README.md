# AWS VPC + subnets

Commit all your answers to a text file `c02-network09.txt` under your folder name.

Everything is to be done preferable on Sydney region `ap-southeast-2`

## Security Group (SG)

Create two new security groups with attached to your new VPC with the following:

|Security Group Name|Rule|Type|Port Range|Source|Description
|-|-|-|-|-|-|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

#### post details on how did you achieve that
