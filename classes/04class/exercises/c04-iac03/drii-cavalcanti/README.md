# C04-IAC03

## Terraform code 
- [_backend.tf](_backend.tf)
- [_provider.tf](_provider.tf)
- [vpc.tf](vpc.tf)
- [output.tf](output.tf)
- [variables.tf](variables.tf)
- [main.tfvars](main.tfvars)

## Command Execution Output
- [output.txt](output.txt)

## Question:
 - Describe below why some changes just updated the resource being changed and the other required a full replacement of the resource.
 -- All dependencies will be replaced due to the new resources. In other words, everything will be re-created (destroyed and created) according to the changes. However, I got some issues when I was trying to run Terraform apply. I believe that was because as just some resources were destroyed and the VPC still connected to other resources so this doesn't allow the VPC gets deleted.

***
Answer for exercise [c04-iac03](chttps://github.com/devopsacademyau/academy/blob/c41e824fb2a2c55e3a30b2371a87e3a7551b6741/classes/04class/exercises/c04-iac03/README.md)