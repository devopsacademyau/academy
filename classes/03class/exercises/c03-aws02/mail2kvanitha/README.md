# c03-aws02

## Command Execution Output
- Command used to create the Application Load Balancer (ALB)
```
 1.Command to create Load Balancer:

  > aws elb create-load-balancer --load-balancer-name devops-web-lb \
                                 --listeners "Protocol=HTTP,LoadBalancerPort=80,InstanceProtocol=HTTP,InstancePort=80" \
                                 --subnets subnet-0c8c2609ac6874ace subnet-09fef27936067ada2 \
                                 --security-groups sg-0816f7b7fd2f99678 \
                                 --tags "Key=Name,Value=devops-web-lb"
  {
    "DNSName": "devops-web-lb-1515827713.ap-southeast-2.elb.amazonaws.com"
  }


 2. Attach the Load Balancer Created to the Auto Scaling Group
 
 > aws autoscaling attach-load-balancers --auto-scaling-group-name webserver-asg --load-balancer-names devops-web-lb 

```

- Details of the security group used
```
 > aws ec2 describe-security-groups --group-ids sg-0816f7b7fd2f99678

  {
    "SecurityGroups": [
        {
            "Description": "devopsacademy public SG",
            "GroupName": "public-sg",
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
                },
                {
                    "FromPort": 22,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "203.221.131.65/32"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 22,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "238730634896",
            "GroupId": "sg-0816f7b7fd2f99678",
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
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "public-sg"
                }
            ],
            "VpcId": "vpc-042fd98e61209aa1e"
        }
    ]
  }


```

Questions:
- Run a few times `curl <load-balancer-cname>` and explain what do you see?
```

  > curl http://devops-web-lb-1515827713.ap-southeast-2.elb.amazonaws.com:80
    ip-10-10-1-44.ap-southeast-2.compute.internal

  > curl http://devops-web-lb-1515827713.ap-southeast-2.elb.amazonaws.com:80
    ip-10-10-2-205.ap-southeast-2.compute.internal

 Could see that the Loadbalancer is getting the hostname of the instances in the ASG in roundrobin fashion most of the time. This is because the load balancer loads the traffic equally between the instances in Auto-scaling group.

```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws02](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws02/README.md)
