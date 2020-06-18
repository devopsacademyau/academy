# C04-IAC03

## Command Execution Output

- [output.txt](output.txt)

## Questions:

- Describe below why some changes just updated the resource being changed and the other required a full replacement of the resource.

- I've noticed that updating the variable's value of a resource (eg. subnet name) would not cause issues since terraform reads the .tf file and use the value associated to that variable.
- Other resources require a full replacement of the resource, they need to be recreated (eg. VPC cidr) as they change the network infrastructure.
  (For this exercise, I literally did what was asked and changed only the 1 Subnet cidr, maintaining all others subnets cidr from the previous exercise. However, that does not make much sence if I "apply" terraform with the new VPC cidr only, all the sub-regions of the network - the subnets - would have to change their cidr,too.)

---

Answer for exercise [c04-iac03](https://github.com/devopsacademyau/academy/blob/c41e824fb2a2c55e3a30b2371a87e3a7551b6741/classes/04class/exercises/c04-iac03/README.md)
