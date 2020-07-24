# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
>>>Command to check current region[Sydney [ap-southeast-2]]
aws configure get region

>>>Command to create an internet gateway 
aws ec2 create-internet-gateway
>The command returns:
{
    "InternetGateway": {
        "Attachments": [],
        "InternetGatewayId": "igw-036a26c6352dfb84f",
        "Tags": []
    }
}

>>>Command to associate the internet gateway with the VPC created.
aws ec2 attach-internet-gateway \
 --vpc-id vpc-081afcee350babdf5 \
 --internet-gateway-id igw-036a26c6352dfb84f 

>>>Command to give a name to the internet gateway
aws ec2 create-tags \
 --resources igw-036a26c6352dfb84f \
 --tags Key=Name,Value=devopsacademy-igw

```

- Any extra challenges faced?
>>>Assigning names to the intenet gateway is done separately.


***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)
