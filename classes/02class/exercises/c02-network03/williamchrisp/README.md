# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
aws ec2 create-vpc --cidr-block 192.168.0.0/16 \
--instance-tenancy default \
--no-amazon-provided-ipv6-cidr-block \
--query Vpc.VpcId \
--output text

vpc-0bbfeb575dfceef83
```

- Any extra challenges faced?

***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)