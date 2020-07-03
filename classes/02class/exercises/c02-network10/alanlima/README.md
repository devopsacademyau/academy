# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
$ aws ec2 create-network-interface \
    --subnet-id subnet-0b24a09de741ecd50 \
    --description "Fixed IP for private subnet A" \
    --private-ip-address 172.16.20.10

NetworkInterface:
  AvailabilityZone: ap-southeast-2a
  Description: Fixed IP for private subnet A
  Groups:
  - GroupId: sg-00d7287fdbffc50db
    GroupName: default
  InterfaceType: interface
  Ipv6Addresses: []
  MacAddress: 06:f1:06:ca:50:f0
  NetworkInterfaceId: eni-08dbd042b048496d7
  OwnerId: '097922957316'
  PrivateIpAddress: 172.16.20.10
  PrivateIpAddresses:
  - Primary: true
    PrivateIpAddress: 172.16.20.10
  RequesterId: AIDARNTFJYACARJ76NBBM
  RequesterManaged: false
  SourceDestCheck: true
  Status: pending
  SubnetId: subnet-0b24a09de741ecd50
  TagSet: []
  VpcId: vpc-027019faaf6756407
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)