# AWS VPC + subnets

Everything is to be done preferable on Sydney region `ap-southeast-2`

## Subnets

Create 2 subnets (private and public) per Availability Zone (6 subnets in total) with following details:

- name: <private/public>-<az-identifier> -- e.g.: `private-a` `private-b` 
- VPC: use the VPC created on last exercise
- AZ: refer to the name -- e.g.: subnet `private-a` will be `Availability Zone A` `ap-southeast-2a`
- IPv4 CIDR: make it room for at least 250 hosts
