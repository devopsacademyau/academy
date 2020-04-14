# C04-IAC03

## Command Execution Output
- [output.txt](output.txt)

## Questions:
- Describe below why some changes just updated the resource being changed and the other required a full replacement of the resource.
    - This is based on which change is being applied, when we change a VPC CIDR it will impacts network structure and all others subresources will need to be changed. In other words, all changes that will impact subresources will require full replacement whilst other kind of changes will just update the resource that is being changed.

***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/c41e824fb2a2c55e3a30b2371a87e3a7551b6741/classes/04class/exercises/c04-iac03/README.md)