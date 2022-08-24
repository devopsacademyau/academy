# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
### Create a elastic IP
```
aws --region us-east-1 ec2 allocate-address
{
    "PublicIp": "52.54.176.235",
    "AllocationId": "eipalloc-0fe81d0e3cd6d5e8d",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "us-east-1",
    "Domain": "vpc"
}
```

### Create Nat gateway with elastic ip.
```
aws --region us-east-1 ec2 create-nat-gateway \
    --subnet-id subnet-02531e94ffa2dc32d \
    --allocation-id eipalloc-0fe81d0e3cd6d5e8d
```

- Any extra challenges faced?

***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)