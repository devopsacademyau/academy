# c02-network04

## Commands Execution Output

- Commands for creating the subnets:

```bash

## Creating 2 Subnets on each Availability Zone
## Last exercise we created a VPC and its ID is vpc-074c260483405f2bb
## First Subnet -
aws ec2 create-subnet --vpc-id vpc-074c260483405f2bb --cidr-block 10.0.1.0/24 --availability-zone ap-southeast-2a
# Output
SUBNET  False   ap-southeast-2a apse2-az3       251     10.0.1.0/24     False   False   478433196210    available       arn:aws:ec2:ap-southeast-2:478433196210:subnet/subnet-08da4676baf658cb2 subnet-08da4676baf658cb2        vpc-074c260483405f2bb

## Tag Private-A
aws ec2 create-tags --resources subnet-08da4676baf658cb2 --tags Key=Name,Value=private-a

## Second Subnet
aws ec2 create-subnet --vpc-id vpc-074c260483405f2bb --cidr-block 10.0.2.0/24 --availability-zone ap-southeast-2a
# Output
SUBNET  False   ap-southeast-2a apse2-az3       251     10.0.2.0/24     False   False   478433196210    available       arn:aws:ec2:ap-southeast-2:478433196210:subnet/subnet-0f867dac87c7e75b4 subnet-0f867dac87c7e75b4        vpc-074c260483405f2bb

## Tag Public-A
aws ec2 create-tags --resources subnet-0f867dac87c7e75b4 --tags Key=Name,Value=public-a

## Third Subnet
aws ec2 create-subnet --vpc-id vpc-074c260483405f2bb --cidr-block 10.0.3.0/24 --availability-zone ap-southeast-2b
# Output
SUBNET  False   ap-southeast-2b apse2-az1       251     10.0.3.0/24     False   False   478433196210    available       arn:aws:ec2:ap-southeast-2:478433196210:subnet/subnet-09383d1e51392c852 subnet-09383d1e51392c852        vpc-074c260483405f2bb

## Tag Private-B
aws ec2 create-tags --resources subnet-09383d1e51392c852 --tags Key=Name,Value=private-b

## Fourth Subnet
aws ec2 create-subnet --vpc-id vpc-074c260483405f2bb --cidr-block 10.0.4.0/24 --availability-zone ap-southeast-2b
# Output
SUBNET  False   ap-southeast-2b apse2-az1       251     10.0.4.0/24     False   False   478433196210    available       arn:aws:ec2:ap-southeast-2:478433196210:subnet/subnet-01ef5462d19df360c subnet-01ef5462d19df360c        vpc-074c260483405f2bb

## Tag Public-B
aws ec2 create-tags --resources subnet-01ef5462d19df360c --tags Key=Name,Value=public-b

## Fifth Subnet
aws ec2 create-subnet --vpc-id vpc-074c260483405f2bb --cidr-block 10.0.5.0/24 --availability-zone ap-southeast-2c

# Output
SUBNET  False   ap-southeast-2c apse2-az2       251     10.0.5.0/24     False   False   478433196210    available       arn:aws:ec2:ap-southeast-2:478433196210:subnet/subnet-0d78ad19a4b86f369 subnet-0d78ad19a4b86f369        vpc-074c260483405f2bb

## Tag Private-C
aws ec2 create-tags --resources subnet-0d78ad19a4b86f369 --tags Key=Name,Value=private-c

## Sixth Subnet
aws ec2 create-subnet --vpc-id vpc-074c260483405f2bb --cidr-block 10.0.6.0/24 --availability-zone ap-southeast-2c

# Output
SUBNET  False   ap-southeast-2c apse2-az2       251     10.0.6.0/24     False   False   478433196210    available       arn:aws:ec2:ap-southeast-2:478433196210:subnet/subnet-01ac1852278e631c7 subnet-01ac1852278e631c7        vpc-074c260483405f2bb

## Tag Public-C
aws ec2 create-tags --resources subnet-01ac1852278e631c7 --tags Key=Name,Value=public-c

```

- Any extra challenges faced?

  > Not really, but when I am digging through AWS HELP of each command to get more information. There are so many options. In most cases I am just using just `obrigatory` options/parameters.

  > I realize that I had created in the wrong way when I started c02-network07. Now I had to use aws create-tag commands to tag it as private or public.

---

Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)
