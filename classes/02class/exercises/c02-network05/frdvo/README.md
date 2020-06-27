# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
#Create Internet Gateway
aws ec2 create-internet-gateway

#Tag Internet Gateway
aws ec2 create-tags --resources igw-0116304685cc6f00b --tags Key=Name,Value=devopsacademy-igw

#Attach Internet Gateway
aws ec2 attach-internet-gateway --internet-gateway-id igw-0116304685cc6f00b --vpc-id vpc-0a2b7db4956438d22
```
Add your commands and their outputs here
```bash
 🐳 :: 📦 2  📑 :: 1   👉 /home/fer/repos/academy/classes/02class/exercises/c02-network05  
  frdvo/c02-network05  fer 🐧  >  aws ec2 create-internet-gateway
{
    "InternetGateway": {
        "Attachments": [],
        "InternetGatewayId": "igw-0116304685cc6f00b",
        "Tags": []
    }
}
 🐳 :: 📦 2  📑 :: 1   👉 /home/fer/repos/academy/classes/02class/exercises/c02-network05  
  frdvo/c02-network05  fer 🐧  >  aws ec2 create-tags --resources igw-0116304685cc6f00b --tags Key=Name,Value=devopsacademy-igw
 🐳 :: 📦 2  📑 :: 1   👉 /home/fer/repos/academy/classes/02class/exercises/c02-network05  
  frdvo/c02-network05  fer 🐧  >  aws ec2 attach-internet-gateway --internet-gateway-id igw-0116304685cc6f00b --vpc-id vpc-0a2b7db4956438d22
 🐳 :: 📦 2  📑 :: 1   👉 /home/fer/repos/academy/classes/02class/exercises/c02-network05  
  frdvo/c02-network05  fer 🐧  >  
````

- Any extra challenges faced?

Name and attach in separated steps


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)