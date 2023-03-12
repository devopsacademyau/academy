# C03-aws01

## Command Execution Output
- Commands used to create your autoscaling group:
```
I used the console for this exercise. 

# 1. Create an Auto Scaling Group 
-Select 'Auto Scaling Groups' in the EC2 section. 
-Click on 'Create an Auto Scaling group' button 
-Name this AG: ag-c03-aws01
-Create a new launch template (Step 2 in more details)
-Select a new VPC called devopsacademy-vpc)
-Select 2 AZ 
-Modify desired, minimum, and maximum capacity of the Auto Scaling Gruop 

#2. Create a launch template 
-Name the launch template 
-Select 'Amazon Linux 2 AMI (HVM)'
-Select previous key pair: kp-devops-c01-aws

```

- Command used to get each asg instance hostname through the webserver
```
aws autoscaling describe-auto-scaling-groups \
    --auto-scaling-group-names ag-c03-aws01

aws ec2 describe-instances \
    --instance-id i-0305fdc7d315ffaf7 \
    --query 'Reservations[].Instances[].PublicIpAddress'
"54.253.108.225"

curl 54.253.108.225
ip-172-31-7-139.ap-southeast-2.compute.internal


aws ec2 describe-instances \
    --instance-id i-0c06a42744c1793df \
    --query 'Reservations[].Instances[].PublicIpAddress'
"13.239.28.12"

curl 13.239.28.12
ip-172-31-37-126.ap-southeast-2.compute.internal


Add commands here
```

- Details of the security group used on the asg
```

aws ec2 describe-security-groups \
    --group-ids sg-0b147c2305057e4b3


{
    "SecurityGroups": [
        {
            "Description": "Allow connection from anywhere to port 80",
            "GroupName": "c03-aws01-sg",
            "IpPermissions": [
                {
                    "FromPort": 80,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 80,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "191273369808",
            "GroupId": "sg-0b147c2305057e4b3",
            "IpPermissionsEgress": [
                {
                    "IpProtocol": "-1",
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "UserIdGroupPairs": []
                }
            ],
            "VpcId": "vpc-0ee20c2dc739f6937"
        }
    ]
}
```

- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`
```
It is reading the hostname and putting it on the index.html file. This file will be shown when webserver's public IP is typed into a browser or 'curled'.
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)