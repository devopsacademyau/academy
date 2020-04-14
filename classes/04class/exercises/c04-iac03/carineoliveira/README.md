# C04-IAC03

## Command Execution Output
- [output.txt](output.txt)

## Questions:
- Describe below why some changes just updated the resource being changed and the other required a full replacement of the resource.
    - It will depend of the resource type and the change made, for example: if the VPC CIDR changes the subnets will also require a change, the whole network structure will be different. In another hand, when just the name is updated, it wont impact on the structure and its dependencies.
    
***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/c41e824fb2a2c55e3a30b2371a87e3a7551b6741/classes/04class/exercises/c04-iac03/README.md)