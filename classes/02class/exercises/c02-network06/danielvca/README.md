
# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
aws ec2 allocate-address \
    --domain vpc

AllocationId: eipalloc-0e307f5d9dac87cf0  
Domain: vpc  
NetworkBorderGroup: ap-southeast-2  
PublicIp: 13.237.222.27  
PublicIpv4Pool: amazon

aws ec2 create-nat-gateway --subnet-id subnet-091fd751e703a303b --allocation-id eipalloc-0e307f5d9dac87cf0

ClientToken: c29ce86a-437a-4ccc-a8d2-ae355b95437f  
NatGateway:  
CreateTime: '2020-06-26T06:53:21+00:00'  
NatGatewayAddresses:  
- AllocationId: eipalloc-0e307f5d9dac87cf0  
NatGatewayId: nat-0dc90bf9294b8fa75  
State: pending  
SubnetId: subnet-091fd751e703a303b  
VpcId: vpc-0c2c93451cdd28192
```


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)

> Written with [StackEdit](https://stackedit.io/).
