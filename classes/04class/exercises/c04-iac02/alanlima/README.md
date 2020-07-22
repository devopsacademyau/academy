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

## Output

```bash
Apply complete! Resources: 14 added, 0 changed, 0 destroyed.

Outputs:

private_subnets = {
  "subnet-013eed0173e368c23" = {
    "availability_zone" = "ap-southeast-2a"
    "cidr_block" = "10.0.20.0/24"
    "name" = "devops-subnet-private_1"
  }
  "subnet-060f2386a42ee36ce" = {
    "availability_zone" = "ap-southeast-2b"
    "cidr_block" = "10.0.21.0/24"
    "name" = "devops-subnet-private_2"
  }
}
public_subnets = {
  "subnet-05698b81ff20b7095" = {
    "availability_zone" = "ap-southeast-2a"
    "cidr_block" = "10.0.10.0/24"
    "name" = "devops-subnet-public_1"
  }
  "subnet-06dda6bc9a7da10c3" = {
    "availability_zone" = "ap-southeast-2b"
    "cidr_block" = "10.0.11.0/24"
    "name" = "devops-subnet-public_2"
  }
}
vpc_id = vpc-06cdaf29d64760816
```

***
Answer for exercise [c04-iac02](chttps://github.com/devopsacademyau/academy/blob/c41e824fb2a2c55e3a30b2371a87e3a7551b6741/classes/04class/exercises/c04-iac02/README.md)