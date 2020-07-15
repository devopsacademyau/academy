# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|-|-|-|-|-|-|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
# Creating Public Security Group 

aws ec2 create-security-group --group-name public-sg --description "My public security group" --vpc-id vpc-0351acfbc7aed9c1f
{
    "GroupId": "sg-09bccdac9778bb908"
}

# Creating Private Security Group

aws ec2 create-security-group --group-name private-sg --description "My private security group" --vpc-id vpc-0351acfbc7aed9c1f
{
    "GroupId": "sg-0ceb8e72908d2449c"
}

# Adding rules to SG
aws ec2 authorize-security-group-ingress --group-id sg-09bccdac9778bb908 --protocol tcp --port 22 --cidr 101.181.75.88/32

aws ec2 authorize-security-group-ingress --group-id sg-0ceb8e72908d2449c --protocol tcp --port 22 --source-group sg-09bccdac9778bb908

# output of public SG:
 aws ec2 describe-security-groups --group-ids sg-09bccdac9778bb908
{
    "SecurityGroups": [
        {
            "IpPermissionsEgress": [
                {
                    "IpProtocol": "-1", 
                    "PrefixListIds": [], 
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ], 
                    "UserIdGroupPairs": [], 
                    "Ipv6Ranges": []
                }
            ], 
            "Description": "My public security group", 
            "IpPermissions": [
                {
                    "PrefixListIds": [], 
                    "FromPort": 22, 
                    "IpRanges": [
                        {
                            "CidrIp": "101.181.75.88/32"
                        }
                    ], 
                    "ToPort": 22, 
                    "IpProtocol": "tcp", 
                    "UserIdGroupPairs": [], 
                    "Ipv6Ranges": []
                }
            ], 
            "GroupName": "public-sg", 
            "VpcId": "vpc-0351acfbc7aed9c1f", 
            "OwnerId": "348662207501", 
            "GroupId": "sg-09bccdac9778bb908"
        }
    ]
}


# Output of private SG: 
{
    "SecurityGroups": [
        {
            "IpPermissionsEgress": [
                {
                    "IpProtocol": "-1", 
                    "PrefixListIds": [], 
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ], 
                    "UserIdGroupPairs": [], 
                    "Ipv6Ranges": []
                }
            ], 
            "Description": "My private security group", 
            "IpPermissions": [
                {
                    "PrefixListIds": [], 
                    "FromPort": 22, 
                    "IpRanges": [], 
                    "ToPort": 22, 
                    "IpProtocol": "tcp", 
                    "UserIdGroupPairs": [
                        {
                            "UserId": "348662207501", 
                            "GroupId": "sg-09bccdac9778bb908"
                        }
                    ], 
                    "Ipv6Ranges": []
                }
            ], 
            "GroupName": "private-sg", 
            "VpcId": "vpc-0351acfbc7aed9c1f", 
            "OwnerId": "348662207501", 
            "GroupId": "sg-0ceb8e72908d2449c"
        }
    ]
}


```

- Any extra challenges faced?
 No 

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)