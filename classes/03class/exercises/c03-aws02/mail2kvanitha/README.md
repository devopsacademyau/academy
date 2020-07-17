# c03-aws02

## Command Execution Output
- Command used to create the Application Load Balancer (ALB)
```
  1. CREATE APPLICATION LOAD BALANCER:
  > aws elbv2 create-load-balancer --name devops-web-lb \
                                   --subnets subnet-0c8c2609ac6874ace subnet-09fef27936067ada2 \
                                   --security-groups sg-0816f7b7fd2f99678 \
                                   --type application --ip-address-type ipv4 \
                                   --scheme internet-facing --tags "Key=Name,Value=devops-web-lb" 

   {
       "LoadBalancers": [
        {
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:238730634896:loadbalancer/app/devops-web-lb/dfa2d9d44b22dbf7",
            "DNSName": "devops-web-lb-1082779302.ap-southeast-2.elb.amazonaws.com",
            "CanonicalHostedZoneId": "Z1GM3OXH4ZPM65",
            "CreatedTime": "2020-07-17T10:21:56.690000+00:00",
            "LoadBalancerName": "devops-web-lb",
            "Scheme": "internet-facing",
            "VpcId": "vpc-042fd98e61209aa1e",
            "State": {
                "Code": "provisioning"
            },
            "Type": "application",
            "AvailabilityZones": [
                {
                    "ZoneName": "ap-southeast-2b",
                    "SubnetId": "subnet-09fef27936067ada2",
                    "LoadBalancerAddresses": []
                },
                {
                    "ZoneName": "ap-southeast-2a",
                    "SubnetId": "subnet-0c8c2609ac6874ace",
                    "LoadBalancerAddresses": []
                }
            ],
            "SecurityGroups": [
                "sg-0816f7b7fd2f99678"
            ],
            "IpAddressType": "ipv4"
          }
       ]
   }
 
   2. CREATE TARGET GROUP:

   > aws elbv2 create-target-group --name devops-web-lb-tg --protocol HTTP --port 80 --target-type instance --vpc-id vpc-042fd98e61209aa1e
     
     {
       "TargetGroups": [
           {
               "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:238730634896:targetgroup/devops-web-lb-tg/48e62e4838881688",
               "TargetGroupName": "devops-web-lb-tg",
               "Protocol": "HTTP",
               "Port": 80,
               "VpcId": "vpc-042fd98e61209aa1e",
               "HealthCheckProtocol": "HTTP",
               "HealthCheckPort": "traffic-port",
               "HealthCheckEnabled": true,
               "HealthCheckIntervalSeconds": 30,
               "HealthCheckTimeoutSeconds": 5,
               "HealthyThresholdCount": 5,
               "UnhealthyThresholdCount": 2,
               "HealthCheckPath": "/",
               "Matcher": {
                   "HttpCode": "200"
               },
               "TargetType": "instance"
           }
        ]
     }

   3. REGISTER TARGET GROUPS TO APPLICATION LOAD BALANCER:

   > aws elbv2 register-targets --target-group-arn arn:aws:elasticloadbalancing:ap-southeast-2:238730634896:targetgroup/devops-web-lb-tg/48e62e4838881688 \
                                   --targets Id=i-0ce5576108a335363 Id=i-0e1a45bfa58abf23e
   
   4. CREATE LISTENERS FOR APPLICATION LB TO HEALTH CHECK THE INSTANCES IN TARGET GROUP:

   > aws elbv2 create-listener --load-balancer-arn arn:aws:elasticloadbalancing:ap-southeast-2:238730634896:loadbalancer/app/devops-web-lb/dfa2d9d44b22dbf7 \
                               --protocol HTTP --port 80 \
                               --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:ap-southeast-2:238730634896:targetgroup/devops-web-lb-tg/48e62e4838881688
     {
       "Listeners": [
           {
               "ListenerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:238730634896:listener/app/devops-web-lb/dfa2d9d44b22dbf7/036ca990c846bfe1",
               "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:238730634896:loadbalancer/app/devops-web-lb/dfa2d9d44b22dbf7",
               "Port": 80,
               "Protocol": "HTTP",
               "DefaultActions": [
                   {
                       "Type": "forward",
                       "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:238730634896:targetgroup/devops-web-lb-tg/48e62e4838881688",
                       "ForwardConfig": {
                           "TargetGroups": [
                               {
                                   "TargetGroupArn": "arn:aws:elasticloadbalancing:ap-southeast-2:238730634896:targetgroup/devops-web-lb-tg/48e62e4838881688",
                                   "Weight": 1
                               }
                           ],
                           "TargetGroupStickinessConfig": {
                               "Enabled": false
                            }
                        }
                    }
                ]
            }
        ]
     }

   5. HEALTH CHECK OF TARGET INSTANCES IN LOAD BALANCER:

   > aws elbv2 describe-target-health --target-group-arn arn:aws:elasticloadbalancing:ap-southeast-2:238730634896:targetgroup/devops-web-lb-tg/48e62e4838881688
    {
        "TargetHealthDescriptions": [
            {
                "Target": {
                    "Id": "i-0ce5576108a335363",
                    "Port": 80
                },
                "HealthCheckPort": "80",
                "TargetHealth": {
                    "State": "healthy"
                }
            },
            {
                "Target": {
                    "Id": "i-0e1a45bfa58abf23e",
                    "Port": 80
                },
                "HealthCheckPort": "80",
                "TargetHealth": {
                    "State": "healthy"
                }
            }
        ]
    }

  6. CHECK THE LOAD BALANCE RETURNS THE WEB PAGE:
  
   curl http://devops-web-lb-1082779302.ap-southeast-2.elb.amazonaws.com
   ip-10-10-2-70.ap-southeast-2.compute.internal

   curl http://devops-web-lb-1082779302.ap-southeast-2.elb.amazonaws.com
   ip-10-10-1-130.ap-southeast-2.compute.internal

   curl http://devops-web-lb-1082779302.ap-southeast-2.elb.amazonaws.com
   ip-10-10-2-70.ap-southeast-2.compute.internal

   curl http://devops-web-lb-1082779302.ap-southeast-2.elb.amazonaws.com
   ip-10-10-1-130.ap-southeast-2.compute.internal


```

- Details of the security group used
```

  > aws ec2 describe-security-groups --group-id sg-0816f7b7fd2f99678 --profile mumma
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

   curl http://devops-web-lb-1082779302.ap-southeast-2.elb.amazonaws.com
   ip-10-10-2-70.ap-southeast-2.compute.internal

   curl http://devops-web-lb-1082779302.ap-southeast-2.elb.amazonaws.com
   ip-10-10-1-130.ap-southeast-2.compute.internal

   curl http://devops-web-lb-1082779302.ap-southeast-2.elb.amazonaws.com
   ip-10-10-2-70.ap-southeast-2.compute.internal

   curl http://devops-web-lb-1082779302.ap-southeast-2.elb.amazonaws.com
   ip-10-10-1-130.ap-southeast-2.compute.internal

   The Load Balancer distributes the load between the two instances attached in the target group, in a round robin fashion.

```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws02](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws02/README.md)
