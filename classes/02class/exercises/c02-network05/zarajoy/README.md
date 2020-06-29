# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:

create-internet-gateway: Creates an internet gateway for use with a VPC. After creating the internet gateway, you attach it to a VPC using AttachInternetGateway 
```
z@bacon:~$ aws ec2 create-internet-gateway
{
    "InternetGateway": {
        "Attachments": [],
        "InternetGatewayId": "igw-062abdced9341d7f8",
        "OwnerId": "512742231244",
        "Tags": []
    }
}

z@bacon:~$ aws ec2 create-tags --resources igw-062abdced9341d7f8 --tags Key=Name,Value=DevopsAcademy-igw

z@bacon:~$ aws ec2 attach-internet-gateway --internet-gateway-id igw-062abdced9341d7f8 --vpc-id vpc-09d2f2719d50d1f7f

#check igw is created, named and attached to vpc
z@bacon:~$ aws ec2 describe-internet-gateways
{
    "InternetGateways": [
        {
            "Attachments": [
                {
                    "State": "available",
                    "VpcId": "vpc-ce545da9"
                }
            ],
            "InternetGatewayId": "igw-01a2bd65",
            "OwnerId": "512742231244",
            "Tags": []
        },
        {
            "Attachments": [
                {
                    "State": "available",
                    "VpcId": "vpc-09d2f2719d50d1f7f"
                }
            ],
            "InternetGatewayId": "igw-062abdced9341d7f8",
            "OwnerId": "512742231244",
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "DevopsAcademy-igw"
                }
            ]
        }
    ]
}


```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)