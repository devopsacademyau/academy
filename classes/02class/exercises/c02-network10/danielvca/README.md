# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
aws ec2 create-network-interface \
    --subnet-id subnet-0452f4ddac49bb979 \
    --description "DevOps Academy ENI" \
    --groups sg-0f854ba13fa06fc9e \
    --private-ip-address 10.0.1.50

NetworkInterface:  
AvailabilityZone: ap-southeast-2a  
Description: DevOps Academy ENI  
Groups:  
- GroupId: sg-0f854ba13fa06fc9e  
GroupName: da_private-sg  
InterfaceType: interface  
Ipv6Addresses: []  
MacAddress: 02:c0:a8:f6:ed:b2  
NetworkInterfaceId: eni-0a541536aaf7f5302  
OwnerId: '646093908012'  
PrivateIpAddress: 10.0.1.50  
PrivateIpAddresses:  
- Primary: true  
PrivateIpAddress: 10.0.1.50  
RequesterId: AIDAZM3RSVAWLO3JPCBCM  
RequesterManaged: false  
SourceDestCheck: true  
Status: pending  
SubnetId: subnet-0452f4ddac49bb979  
TagSet: []  
VpcId: vpc-0c2c93451cdd28192
```
[https://docs.aws.amazon.com/cli/latest/reference/ec2/create-network-interface.html](https://docs.aws.amazon.com/cli/latest/reference/ec2/create-network-interface.html)
- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)
