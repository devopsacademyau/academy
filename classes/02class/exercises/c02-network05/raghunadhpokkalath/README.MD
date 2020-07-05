# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
Create Internet Gateway
> aws ec2 create-internet-gateway
{
    "InternetGateway": {
        "Attachments": [],
        "InternetGatewayId": "igw-0bd0e5665974cd6f0",
        "OwnerId": "361529347535",
        "Tags": []
    }
}

Tag internet gateway as devopsacademy-igw
> aws ec2 create-tags --resources igw-0bd0e5665974cd6f0 --tags Key=Name,Value=devopsacademy-igw

Attach Internet Gateway with VPC
> aws ec2 attach-internet-gateway --vpc-id vpc-076a05ec0f3be4895  --internet-gateway-id  igw-0bd0e5665974cd6f0

Check the intenet gateway to make sure it is tagged and attached to VPC
> aws ec2  describe-internet-gateways --internet-gateway-id  igw-0bd0e5665974cd6f0

{
    "InternetGateways": [
        {
            "Attachments": [
                {
                    "State": "available",
                    "VpcId": "vpc-076a05ec0f3be4895"
                }
            ],
            "InternetGatewayId": "igw-0bd0e5665974cd6f0",
            "OwnerId": "361529347535",
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "devopsacademy-igw"
                }
            ]
        }
    ]
}

```
- Any extra challenges faced?
```
No challenges faced during internet gateway creation
```
<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)