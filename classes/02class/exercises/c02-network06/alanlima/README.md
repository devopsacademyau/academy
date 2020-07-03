# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
## Allocate an Elastic IP

$ aws ec2 allocate-address

AllocationId: eipalloc-0e33c7a5d65aec2a3
Domain: vpc
NetworkBorderGroup: ap-southeast-2
PublicIp: 3.104.46.217
PublicIpv4Pool: amazon

## Create a NAT in subnet public-a ( subnet-0f82d6e49b9a6dafd ) with elastic IP

$ aws ec2 create-nat-gateway --subnet-id subnet-0f82d6e49b9a6dafd --allocation-id eipalloc-0e33c7a5d65aec2a3

ClientToken: 5a612dd0-e92a-4ce8-8d8e-4468c8042a32
NatGateway:
  CreateTime: '2020-07-02T20:53:42+00:00'
  NatGatewayAddresses:
  - AllocationId: eipalloc-0e33c7a5d65aec2a3
  NatGatewayId: nat-0a94bb95ae2e3f566
  State: pending
  SubnetId: subnet-0f82d6e49b9a6dafd
  VpcId: vpc-027019faaf6756407

## Set tag name on created NAT

$ aws ec2 create-tags --resources nat-0a94bb95ae2e3f566 --tags Key=Name,Value=devopsacademy-ngw

## Describe NAT to check the tag

$ aws ec2 describe-nat-gateways --nat-gateway-ids nat-0a94bb95ae2e3f566

NatGateways:
- CreateTime: '2020-07-02T20:53:42+00:00'
  DeleteTime: '2020-07-02T20:55:18+00:00'
  FailureCode: Gateway.NotAttached
  FailureMessage: Network vpc-027019faaf6756407 has no Internet gateway attached
  NatGatewayAddresses:
  - AllocationId: eipalloc-0e33c7a5d65aec2a3
    NetworkInterfaceId: eni-0ed7811bfb436ffa8
    PrivateIp: 172.16.10.14
  NatGatewayId: nat-0a94bb95ae2e3f566
  State: pending
  SubnetId: subnet-0f82d6e49b9a6dafd
  Tags:
  - Key: Name
    Value: devopsacademy-ngw
  VpcId: vpc-027019faaf6756407


```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)