# C04-IAC03

## Command Execution Output
- [output.txt](output.txt)

## Questions:
- Describe below why some changes just updated the resource being changed and the other required a full replacement of the resource.
    - Initally when making a change to the CIDR block and planning via Terrform I had no errors appear. After speaking with Caio it made sense logically that when changing the network CIDR block, the subnets also had to change also.
AWS would error out as the CIDR block is different to the subnets allocated
 
    - Changing the Value of the subnet variable won't cause any issues as the .tf file is reading the value from the variable.tf 

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/c41e824fb2a2c55e3a30b2371a87e3a7551b6741/classes/04class/exercises/c04-iac03/README.md)
