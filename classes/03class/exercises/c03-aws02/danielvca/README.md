
# c03-aws02

## Command Execution Output
- Command used to create the Application Load Balancer (ALB)
```
aws elbv2 create-load-balancer \
        --name daniel-lb \
        --scheme internet-facing \
        --subnets subnet-b47e94d2 subnet-f70d69af \
        --security-groups sg-0821de9ebd10da406 

- AvailabilityZones:  
- LoadBalancerAddresses: []  
SubnetId: subnet-b47e94d2  
ZoneName: ap-southeast-2a  
- LoadBalancerAddresses: []  
SubnetId: subnet-f70d69af  
ZoneName: ap-southeast-2c  
CanonicalHostedZoneId: Z1GM3OXH4ZPM65  
CreatedTime: '2020-07-13T08:28:29.110000+00:00'  
DNSName: daniel-lb-1286710093.ap-southeast-2.elb.amazonaws.com  
IpAddressType: ipv4  
LoadBalancerArn: arn:aws:elasticloadbalancing:ap-southeast-2:646093908012:loadbalancer/app/daniel-lb/940e01782593d009  
LoadBalancerName: daniel-lb  
Scheme: internet-facing  
SecurityGroups:  
- sg-0821de9ebd10da406  
State:  
Code: provisioning  
Type: application  
VpcId: vpc-8e8b89e9


aws elbv2 create-target-group \
        --name daniel-tg \
        --protocol HTTP \
        --port 80 \
        --target-type instance \
        --vpc-id vpc-8e8b89e9

TargetGroups:  
- HealthCheckEnabled: true  
HealthCheckIntervalSeconds: 30  
HealthCheckPath: /  
HealthCheckPort: traffic-port  
HealthCheckProtocol: HTTP  
HealthCheckTimeoutSeconds: 5  
HealthyThresholdCount: 5  
Matcher:  
HttpCode: '200'  
Port: 80  
Protocol: HTTP  
TargetGroupArn: arn:aws:elasticloadbalancing:ap-southeast-2:646093908012:targetgroup/daniel-tg/118b2f945d053b99  
TargetGroupName: daniel-tg  
TargetType: instance  
UnhealthyThresholdCount: 2  
VpcId: vpc-8e8b89e9

  aws elbv2 register-targets \
        --target-group-arn arn:aws:elasticloadbalancing:ap-southeast-2:646093908012:targetgroup/daniel-tg/118b2f945d053b99 \
        --targets Id=i-0dfa6649c177873bf Id=i-01ccd00cc961b99a7

aws elbv2 create-listener \
        --load-balancer-arn arn:aws:elasticloadbalancing:ap-southeast-2:646093908012:loadbalancer/app/daniel-lb/940e01782593d009 \
        --protocol HTTP --port 80 \
        --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:ap-southeast-2:646093908012:targetgroup/daniel-tg/118b2f945d053b99

Listeners:  
- DefaultActions:  
- ForwardConfig:  
TargetGroupStickinessConfig:  
Enabled: false  
TargetGroups:  
- TargetGroupArn: arn:aws:elasticloadbalancing:ap-southeast-2:646093908012:targetgroup/daniel-tg/118b2f945d053b99  
Weight: 1  
TargetGroupArn: arn:aws:elasticloadbalancing:ap-southeast-2:646093908012:targetgroup/daniel-tg/118b2f945d053b99  
Type: forward  
ListenerArn: arn:aws:elasticloadbalancing:ap-southeast-2:646093908012:listener/app/daniel-lb/940e01782593d009/44821a19d4016fa1  
LoadBalancerArn: arn:aws:elasticloadbalancing:ap-southeast-2:646093908012:loadbalancer/app/daniel-lb/940e01782593d009  
Port: 80  
Protocol: HTTP

```



- Details of the security group used
```
aws ec2 describe-security-groups --group-id sg-0821de9ebd10da406

SecurityGroups:  
- Description: sg-daniel-home  
GroupId: sg-0821de9ebd10da406  
GroupName: sg_daniel  
IpPermissions:  
- IpProtocol: '-1'  
IpRanges:  
- CidrIp: 180.150.58.136/32  
Description: danielhome  
Ipv6Ranges: []  
PrefixListIds: []  
UserIdGroupPairs: []  
IpPermissionsEgress:  
- IpProtocol: '-1'  
IpRanges:  
- CidrIp: 0.0.0.0/0  
Ipv6Ranges: []  
PrefixListIds: []  
UserIdGroupPairs: []  
OwnerId: '646093908012'  
VpcId: vpc-8e8b89e9
```

Questions:
- Run a few times `curl <load-balancer-cname>` and explain what do you see?
```
Traffic is split between my instances.
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws02](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws02/README.md)

> Written with [StackEdit](https://stackedit.io/).
