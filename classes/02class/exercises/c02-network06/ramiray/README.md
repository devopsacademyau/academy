# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
## Command to create elasticip :

aws ec2 allocate-address --domain vpc

Output :

{
    "PublicIp": "52.62.157.119", 
    "Domain": "vpc", 
    "AllocationId": "eipalloc-09711a99451cbd908"
}

## Command to create NAT gateway
aws ec2 create-nat-gateway --subnet-id subnet-04c9d82c36567dcc6 --allocation-id eipalloc-09711a99451cbd908

Output:

{
    "NatGateway": {
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-09711a99451cbd908"
            }
        ], 
        "VpcId": "vpc-0351acfbc7aed9c1f", 
        "State": "pending", 
        "NatGatewayId": "nat-0487605ef5aea2e65", 
        "SubnetId": "subnet-04c9d82c36567dcc6", 
        "CreateTime": "2020-07-01T09:13:50.000Z"
    }
}

## Command to  Name the NAT gateway as devopsacademy-ngw 

aws ec2 create-tags --resources nat-0487605ef5aea2e65 --tags Key=Name,Value=devopsacademy-ngw

## Listing the nat-gateway:

aws ec2 describe-nat-gateways
{
    "NatGateways": [
        {
            "NatGatewayAddresses": [
                {
                    "PublicIp": "52.62.157.119", 
                    "NetworkInterfaceId": "eni-0d4c268c40bf3a9dc", 
                    "AllocationId": "eipalloc-09711a99451cbd908", 
                    "PrivateIp": "172.16.41.252"
                }
            ], 
            "VpcId": "vpc-0351acfbc7aed9c1f", 
            "Tags": [
                {
                    "Value": "devopsacademy-ngw", 
                    "Key": "Name"
                }
            ], 
            "State": "available", 
            "NatGatewayId": "nat-0487605ef5aea2e65", 
            "SubnetId": "subnet-04c9d82c36567dcc6", 
            "CreateTime": "2020-07-01T09:13:50.000Z"
        }
    ]
}
```

- Any extra challenges faced?

Didnt create Elastic ip address at first . 

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)