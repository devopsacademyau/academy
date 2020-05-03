# C04-IAC03

## Command Execution Output
- [output.txt](output.txt)

## Questions:
- Describe below why some changes just updated the resource being changed and the other required a full replacement of the resource.

Changing the VPC CIDR forces replacement of VPC.
Subnets also have to be replaced, as VPC ID has changed with new VPC creation.
Subnet CIDR also forces replacement.
Subnet name could be just updated if nothing else has changed.
Route Tables have to be replaced, as subnet IDs have changed.
IGW will just be updated with new VPC ID.
    

***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/c41e824fb2a2c55e3a30b2371a87e3a7551b6741/classes/04class/exercises/c04-iac03/README.md)
