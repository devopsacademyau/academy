## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| common\_tags | list of common tags to apply every resource | `map(string)` | n/a | yes |
| devops\_class | devops academy class identifier for the resources | `string` | n/a | yes |
| image\_id | ami image id for the ec2 instances created by ASG | `string` | n/a | yes |
| key\_pair | key pair to allow ssh connection with the ec2 instances | `string` | `"kp-devops"` | no |
| lb\_subnets | list of subnets for the autoscalling group | `list(string)` | n/a | yes |
| scale\_in\_when\_cpu\_usage\_lower\_than | define that instances can be terminated when CPU usage is lower than | `number` | n/a | yes |
| scale\_out\_when\_cpu\_usage\_greater\_than | define that new instances should be created when CPU usage is greater than | `number` | n/a | yes |
| vpc\_id | aws vpc id for the autoscalling group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| load\_balancer | the load balancer definition created. |

