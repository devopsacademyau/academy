# AWS VPC + subnets

Commit all your answers to a text file `c02-network08.txt` under your folder name.

Everything is to be done preferable on Sydney region `ap-southeast-2`

## Network ACL (NACL's)

#### Look for the network ACL created for your VPC and answer the following:

Your ACL rule inbound and outbound should look like this:

|Rule#|Type|Protocol|Port Range|Source|Allow/Deny|
|-|-|-|-|-|-|
|100|ALL Traffic|ALL|ALL|`<vpc-network>`|ALLOW|
|101|ALL Traffic|ALL|ALL|0.0.0.0/0|ALLOW|
|*|ALL Traffic|ALL|ALL|0.0.0.0/0|DENY

- What is the difference between inbound x outbound?
- What is going to happen by default? Everything allowed or denied?
- How would you block SSH connection comming from the network `172.16.200.200/24`?
- How would you block access from your network to an external network `180.200.50.0/24`?
