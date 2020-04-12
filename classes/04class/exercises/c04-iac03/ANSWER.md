# C04-IAC03

## Command Execution Output
- [output.txt](output.txt)

## Questions:
- Describe below why some changes just updated the resource being changed and the other required a full replacement of the resource.
    - VPC has been destroyed and recreated again, cause the cidr block has been change. 
    - Two public subnets and two private subnets have been recreated, cause since the VPC has been recreated, the VPC id has been changed.
    - Routing table for the subnets are recreated, cause all of the subnets are recreated.
    - NAT gatway need to be replaced, cause the subnet has be recreated
    - Internet gateway is updated in place, cause it's the attributes for the IGW remain same.


***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/c41e824fb2a2c55e3a30b2371a87e3a7551b6741/classes/04class/exercises/c04-iac03/README.md)