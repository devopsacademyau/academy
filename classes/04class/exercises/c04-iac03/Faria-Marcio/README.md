# C04-IAC03

## Command Execution Output
- [output.txt](output.txt)

## Questions:
- Describe below why some changes just updated the resource being changed and the other required a full replacement of the resource.
    - Some resources are independent while others are dependent. For example, VPC CIDR is used by the entire network structure, so subnets and other resources that use VPC will be affected and in this specific case they must be recreated.

***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/tree/master/classes/04class/exercises/c04-iac03/README.md)