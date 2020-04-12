# C04-IAC03

## Command Execution Output
- [output.txt](output.txt)

## Questions:
- Describe below why some changes just updated the resource being changed and the other required a full replacement of the resource.
    - changed and the other required a full replacement of the resource.
Because some resources in AWS can't be changed once they are created (eg: S3 bucket name, vpc and subnet cidr, nat gateway) and the only way to change them is to replace them (destroying the existing resources and creating new ones). When we replace those resources, the other resources that associated with them will subsequently need to be replaced as well.

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/c41e824fb2a2c55e3a30b2371a87e3a7551b6741/classes/04class/exercises/c04-iac03/README.md)