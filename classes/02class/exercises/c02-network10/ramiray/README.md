# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
# Creating ENI with Private IP address

aws ec2 create-network-interface --subnet-id subnet-06cf55d01bbed75dc --description "my ENI network" --groups sg-0ceb8e72908d2449c --private-ip-address 172.16.0.8
{
    "NetworkInterface": {
        "Status": "pending", 
        "MacAddress": "02:3f:ff:00:ab:ce", 
        "SourceDestCheck": true, 
        "AvailabilityZone": "ap-southeast-2a", 
        "Description": "my ENI network", 
        "NetworkInterfaceId": "eni-0627bb821b8118e05", 
        "PrivateIpAddresses": [
            {
                "Primary": true, 
                "PrivateIpAddress": "172.16.0.8"
            }
        ], 
        "RequesterManaged": false, 
        "SubnetId": "subnet-06cf55d01bbed75dc", 
        "VpcId": "vpc-0351acfbc7aed9c1f", 
        "InterfaceType": "interface", 
        "RequesterId": "AIDAVCLPDCQGZYJ2PUZXK", 
        "Groups": [
            {
                "GroupName": "private-sg", 
                "GroupId": "sg-0ceb8e72908d2449c"
            }
        ], 
        "Ipv6Addresses": [], 
        "OwnerId": "348662207501", 
        "TagSet": [], 
        "PrivateIpAddress": "172.16.0.8"
    }
}

```

- Any extra challenges faced?

No the command is available in the aws document.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)