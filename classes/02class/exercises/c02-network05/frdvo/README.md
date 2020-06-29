# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
$ aws ec2 create-internet-gateway

{
    "InternetGateway": {
        "Attachments": [],
        "InternetGatewayId": "igw-0116304685cc6f00b",
        "Tags": []
    }
}

$ frdvo/c02-network05  fer 🐧  >  aws ec2 create-tags --resources igw-0116304685cc6f00b --tags Key=Name,Value=devopsacademy-igw

$ aws ec2 attach-internet-gateway --internet-gateway-id igw-0116304685cc6f00b --vpc-id vpc-0a2b7db4956438d22

$ aws ec2 describe-internet-gateways --internet-gateway-ids igw-0116304685cc6f00b

{
    "InternetGateways": [
        {
            "Attachments": [
                {
                    "State": "available",
                    "VpcId": "vpc-0a2b7db4956438d22"
                }
            ],
            "InternetGatewayId": "igw-0116304685cc6f00b",
            "OwnerId": "165765640813",
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "devopsacademy-igw"
                }
            ]
        }
    ]
}

````

- Any extra challenges faced?

Name and attach in separated steps


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)