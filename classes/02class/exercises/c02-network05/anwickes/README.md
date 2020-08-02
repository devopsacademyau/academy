## Internet Gateway (IGW)

Create an Internet Gateway called `devopsacademy-igw` and attach it to your `devopsacademy-vpc` VPC.

# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
VPC_ID: vpc-064f8156856e7ef9e

aws ec2 create-internet-gateway
{
    "InternetGateway": {
        "Attachments": [],
        "InternetGatewayId": "igw-0c0123065cb86ee80",
        "OwnerId": "595178663294",
        "Tags": []
    }
}

aws ec2 create-tags --resources igw-0c0123065cb86ee80 --tags Key=Name,Value=devopsacademy-igw
aws ec2 attach-internet-gateway --internet-gateway-id igw-0c0123065cb86ee80 --vpc-id vpc-064f8156856e7ef9e
```

- Any extra challenges faced?

No challenges


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)