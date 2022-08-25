# c03-aws02

## Command Execution Output
- Command used to create the Application Load Balancer (ALB)
```
I used the console to create the ALB. 

# 1. Create ALB 
-Select 'Load Balancers' in ec2 section. 
-Click 'Create load balancer' 
-Select 'Application Load Balancer' 
-Name the ALB 
-Select 'Internet-facing' scheme. 
-Select devopsacademy-vpc and 2 subnets. 
-Create a new security group (more details in Step 2)
-Select listener: HTTP > 80 > Forward to > Create new target group (more details in Step 3)

# 2. Create Security Group 
-Name the security group and include a description 
-Outbound rules > Custom TCP > Port range: 80 > Destination: 0.0.0.0/0

# 3. Create Tareget group 
-Choose 'Instances' as target group 
-Name the Target group 
-Protocol: HTTP > Port: 80 
-Select VPC 
-Select ec2 instances from Auto Scaling Group asg-c03-aws01 (previous exercise)

```

- Details of the security group used
```
aws ec2 describe-security-groups --group-ids sg-0c00c444eb466433a

{
    "SecurityGroups": [
        {
            "Description": "DevOps Academy security group for HTTP traffic",
            "GroupName": "c03-aws02-sg",
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
            "GroupId": "sg-0c00c444eb466433a",
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

Questions:
- Run a few times `curl <load-balancer-cname>` and explain what do you see?
```
curl lb-c03-aws02-7401933.ap-southeast-2.elb.amazonaws.com
ip-172-31-34-125.ap-southeast-2.compute.internal[cloudshell-user@ip-10-0-0-203 ~]$ curl lb-c03-aws02-7401933.ap-southeast-2.elb.amazonaws.com
ip-172-31-34-125.ap-southeast-2.compute.internal[cloudshell-user@ip-10-0-0-203 ~]$ curl lb-c03-aws02-7401933.ap-southeast-2.elb.amazonaws.com
ip-172-31-2-159.ap-southeast-2.compute.internal[cloudshell-user@ip-10-0-0-203 ~]$ curl lb-c03-aws02-7401933.ap-southeast-2.elb.amazonaws.com
ip-172-31-2-159.ap-southeast-2.compute.internal[cloudshell-user@ip-10-0-0-203 ~]$ curl lb-c03-aws02-7401933.ap-southeast-2.elb.amazonaws.com
ip-172-31-34-125.ap-southeast-2.compute.internal[cloudshell-user@ip-10-0-0-203 ~]$ curl lb-c03-aws02-7401933.ap-southeast-2.elb.amazonaws.com
ip-172-31-34-125.ap-southeast-2.compute.internal[cloudshell-user@ip-10-0-0-203 ~]$ curl lb-c03-aws02-7401933.ap-southeast-2.elb.amazonaws.com
ip-172-31-2-159.ap-southeast-2.compute.internal[cloudshell-user@ip-10-0-0-203 ~]$ curl lb-c03-aws02-7401933.ap-southeast-2.elb.amazonaws.com
ip-172-31-34-125.ap-southeast-2.compute.internal[cloudshell-user@ip-10-0-0-203 ~]$ 

The ALB is changing between the 2 available instances. 
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws02](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws02/README.md)