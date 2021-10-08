# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:

Create an elastic IP

```
aws ec2 allocate-address --domain vpc --tag-specifications 'ResourceType=elastic-ip,Tags=[{Key=Name,Value=tk-dojo-elastic-ip}]'
```

Create a NAT Gateway with attached elastic IP on public subnet

```
aws ec2 create-nat-gateway \
    --subnet-id subnet-035eecc54395ab403 \
    --allocation-id eipalloc-0ba0b2c6229509571
```

- Any extra challenges faced?
```
Limit of 5 elastic IPs per region by default, need to make sure you have enough elastic IPs available
```
<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)