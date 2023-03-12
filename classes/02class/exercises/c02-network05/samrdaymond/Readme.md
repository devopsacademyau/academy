# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
Add your commands and their outputs here
```

sam.daymond@contino.io@Sams-MacBook-Pro academy % aws ec2 create-internet-gateway                                                                                    
{
    "InternetGateway": {
        "Attachments": [],
        "InternetGatewayId": "igw-030783c95c09fb1dd",
        "OwnerId": "152848913167",
        "Tags": []
    }
}

aws ec2 create-tags --resources igw-030783c95c09fb1dd --tags Key=Name,Value=devopsacademy-igw

aws ec2 attach-internet-gateway --internet-gateway-id igw-030783c95c09fb1dd --vpc-id vpc-082db14641294a216

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)