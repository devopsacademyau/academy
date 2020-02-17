# AWS VPC + subnets

Create a txt file under your folder name to add deliverables.

Everything is to be done preferable on Sydney region `ap-southeast-2`

### 1) VPC

Create a new AWS VPC with:

- CIDR block `/16`
- Name: devopsacademy-vpc
- No IPv6
- Tenancy default

#### Post details from the vpc created.

You will notice that as soon as you create a VPC, a route table, default local routes and network acls are automatically deployed. More to that in the next exercises.


### 2) Subnets

Create 2 subnets (private and public) per Availability Zone (6 subnets in total) with following details:

- name: <private/public>-<az-identifier> -- e.g.: `private-a` `private-b` 
- VPC: use the VPC created on last exercise
- AZ: refer to the name -- e.g.: subnet `private-a` will be `Availability Zone A` `ap-southeast-2a`
- IPv4 CIDR: make it room for at least 250 hosts

#### Post details from subnets created.


### 3) Internet Gateway (IGW)

Create an Internet Gateway called `devopsacademy-igw` and attach it to your `devopsacademy-vpc` VPC.

Post how did you accomplish that on AWS console.

### 4) NAT Gateway (NGW) (optional)

Be aware that NAT Gateway is out of the free-tier. If you just use it while you are doing your exercises and MAKE SURE TO DELETE afterwards it should incurr less than 1$ cost. We highly recommend you testing this step but we understand if you decide not to.

Create a NAT Gateway called `devopsacademy-ngw` and attach it to one of your public subnets (any) with an Elastic IP. 

Post how did you accomplish that on AWS console.


### 5) Route Table

Create the above route tables and associate with referred subnets:

|route table|subnet|
|devopsacademy-rt-public|all public subnets|
|devopsacademy-rt-private|all private subnets|

#### Post how did you accomplish that on AWS console.


### 6) Routes

Add the following routes to your new route tables:

- devopsacademy-rt-public

|destination|target|
|-|-|
|0.0.0.0|`devopsacademy-igw`|

- devopsacademy-rt-private

|destination|target|
|-|-|
|0.0.0.0|`devopsacademy-ngw`|

#### Then post your answers for the following:

- How did you accomplish both instructions?
- Why did you add 0.0.0.0 route to the IGW on public route table?
- Why did you add 0.0.0.0 route to the NGW on private route table?
- What is the difference of IGW and NGW?
- Can you delete the destination route to your VPC network? Why?
- What happens if you do not associate your route table with any subnets?

### Network ACL

#### Look for the network ACL created for your VPC and answer the following:

Your ACL rule inbound and outbound should look like this:

|Rule#|Type|Protocol|Port Range|Source|Allow/Deny|
|-|-|-|-|-|-|
|100|ALL Traffic|ALL|ALL|<vpc-network>|ALLOW|
|101|ALL Traffic|ALL|ALL|0.0.0.0/0|ALLOW|
|*|ALL Traffic|ALL|ALL|0.0.0.0/0|DENY

- What is the difference between inbound x outbound?
- What is going to happen by default? Everything allowed or denied?
- How would you block SSH connection comming from the network `172.16.200.200/24`?
- How would you block access from your network to an external network `180.200.50.0/24`?

### Security Group (SG)

Create two new security groups with attached to your new VPC with the following:

|Security Group Name|Rule|Type|Port Range|Source|Description
|-|-|-|-|-|-|
|public-sg|inbound|Custom TCP Rule|22|<your-home-ip-address>|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|<public-sg-id>|SSH access only from public instances on AWS|

#### post details on how did you achieve that

### EC2

Repeat exercise from last class where you have to:

- launch an EC2 instance on a public subnet
- attach your public SG to your public instance
- launch an EC2 instance on a private subnet
- attach your private SG to your publoc instance
- access to your public instance using SSH
- FROM your PUBLIC instance, SSH to your private one

However this time, use your custom created subnets instead of the AWS default ones.

#### post if you had to do any troubleshooting or if that worked straight away


#### DO NOT FORGET TO DELETE YOUR RESOURCES ONCE YOU FINISH:

- ALL EC2 INSTANCES
- NAT GATEWAY
- ANY ELASTIC IP (those are charged only if you allocate one and is not being used)

You can leave the vpc, subnets, route tables, internet gateway, network acl



