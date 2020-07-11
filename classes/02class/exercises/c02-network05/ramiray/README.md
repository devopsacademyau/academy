# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
## Creating IGW:

aws ec2 create-internet-gateway

aws ec2 create-internet-gateway
{
    "InternetGateway": {
        "Tags": [], 
        "Attachments": [], 
        "InternetGatewayId": "igw-0b50e51e2cf01b373"
    }
}

## Naming the igw as "devopsacademy-igw":

aws ec2 create-tags --resources igw-0b50e51e2cf01b373 --tags Key=Name,Value=devopsacademy-igw

## Attaching the IGW to our VPC :

aws ec2 attach-internet-gateway --internet-gateway-id igw-0b50e51e2cf01b373 --vpc-id vpc-0351acfbc7aed9c1f

## Viewing the output :

aws ec2 describe-internet-gateways --region ap-southeast-2 --filters Name=attachment.vpc-id,Values=vpc-0351acfbc7aed9c1f
{
    "InternetGateways": [
        {
            "Tags": [
                {
                    "Value": "devopsacademy-igw", 
                    "Key": "Name"
                }
            ], 
            "Attachments": [
                {
                    "State": "available", 
                    "VpcId": "vpc-0351acfbc7aed9c1f"
                }
            ], 
            "InternetGatewayId": "igw-0b50e51e2cf01b373"
        }
    ]
}
```

- Any extra challenges faced?

Its not a challenge but it would be better if we have a single command to do all at once. 

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)