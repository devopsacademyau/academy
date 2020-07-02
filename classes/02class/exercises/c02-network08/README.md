# AWS VPC + subnets

Everything is to be done preferable on Sydney region `ap-southeast-2`

## Network ACL (NACL's)

#### Look for the network ACL created for your VPC and answer the following:

Your ACL has both inbound and outbound rules as follow:

|Rule#|Type|Protocol|Port Range|Source|Allow/Deny|
|-|-|-|-|-|-|
|100|ALL Traffic|ALL|ALL|`<vpc-network>`|ALLOW|
|101|ALL Traffic|ALL|ALL|0.0.0.0/0|ALLOW|
|*|ALL Traffic|ALL|ALL|0.0.0.0/0|DENY

- What is the difference between inbound x outbound?
- What is going to happen by default? Everything allowed or denied?
- How would you block SSH an incoming connection from a network `172.16.200.0/24`?
- How would you block access from your network to an external network `180.200.50.0/24`?

## Submit a PR with the following files

> Remember to follow the instructions on [how to submit a PR here](/README.md#exercises)s

- **README.md**: copy from file [ANSWER.md](ANSWER.md), containing your answers.
