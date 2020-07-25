# C04-IAC02

## Terraform code
- [_backend.tf](_backend.tf)
- [_provider.tf](_provider.tf)
- [vpc.tf](vpc.tf)
- [output.tf](output.tf)
- [variables.tf](variables.tf)
- [main.tfvars](main.tfvars)

## Command Execution Output
- [output.txt](output.txt)

## Output commands results after terraform apply
```

Apply complete! Resources: 15 added, 0 changed, 0 destroyed.

Outputs:

private_subnet_a_cidr_block = 10.0.0.0/24
private_subnet_b_cidr_block = 10.0.1.0/24
public_subnet_a_cidr_block = 10.0.2.0/24
public_subnet_b_cidr_block = 10.0.3.0/24
vpc_cidr_block = 10.0.0.0/16

```
***
Answer for exercise [c04-iac02](chttps://github.com/devopsacademyau/academy/blob/c41e824fb2a2c55e3a30b2371a87e3a7551b6741/classes/04class/exercises/c04-iac02/README.md)