# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
Add your commands and their outputs here
```
# Create Internet Gateway:

> aws ec2 create-internet-gateway

     {
         "InternetGateway": {
             "Attachments": [],
             "InternetGatewayId": "igw-0d2c772e61b970c7e",
             "Tags": []
         }
     }

# Attach Internet Gateway to Devopsacademy-vpc VPC:

> aws ec2 attach-internet-gateway --internet-gateway-id igw-0d2c772e61b970c7e --vpc-id vpc-0d4cd22a6e87c698a

> aws ec2 create-tags --resources igw-0d2c772e61b970c7e --tags Key=Name,Value=devopsacademy-igw

# Verify Internet Gateway creation:

> aws ec2 describe-internet-gateways

     {
         "InternetGateways": [
             {
                 "Attachments": [
                     {
                         "State": "available",
                         "VpcId": "vpc-0d4cd22a6e87c698a"
                     }
                 ],
                 "InternetGatewayId": "igw-0d2c772e61b970c7e",
                 "OwnerId": "823151257518",
                 "Tags": [
                     {
                         "Key": "Name",
                         "Value": "devopsacademy-igw"
                     }
                 ]
             },
             {
                 "Attachments": [
                     {
                         "State": "available",
                         "VpcId": "vpc-ee765989"
                     }
                 ],
                 "InternetGatewayId": "igw-81506ce5",
                 "OwnerId": "823151257518",
                 "Tags": []
             }
         ]
     }


- Any extra challenges faced?
 No Challenges faced.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)
