# AWS VPC + subnets

Everything is to be done preferable on Sydney region `ap-southeast-2`

## VPC

Create a new AWS VPC with:

- CIDR block `/16`
- Name: devopsacademy-vpc
- No IPv6
- Tenancy default

You will notice that as soon as you create a VPC, a route table, default local routes and network acls are automatically deployed. More to that in the next exercises.
