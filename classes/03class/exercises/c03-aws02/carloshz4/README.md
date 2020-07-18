# c03-aws02

## Command Execution Output
- Command used to create the Application Load Balancer (ALB)
```
aws elbv2 create-load-balancer --name devopsacademy-alb --subnets subnet-0d38b36b10174c83e subnet-0cc747f574e20158a
---------------------------------------------------------------------------------------------------------------------------------------------
|                                                            CreateLoadBalancer                                                             |
+-------------------------------------------------------------------------------------------------------------------------------------------+
||                                                              LoadBalancers                                                              ||
|+-----------------------+-----------------------------------------------------------------------------------------------------------------+|
||  CanonicalHostedZoneId|  Z1GM3OXH4ZPM65                                                                                                 ||
||  CreatedTime          |  2020-07-17T09:32:19.940Z                                                                                       ||
||  DNSName              |  devopsacademy-alb-654654077.ap-southeast-2.elb.amazonaws.com                                                   ||
||  IpAddressType        |  ipv4                                                                                                           ||
||  LoadBalancerArn      |  arn:aws:elasticloadbalancing:ap-southeast-2:016454647794:loadbalancer/app/devopsacademy-alb/753433fd025f753f   ||
||  LoadBalancerName     |  devopsacademy-alb                                                                                              ||
||  Scheme               |  internet-facing                                                                                                ||
||  Type                 |  application                                                                                                    ||
||  VpcId                |  vpc-012017b09f0dae62e                                                                                          ||
|+-----------------------+-----------------------------------------------------------------------------------------------------------------+|
|||                                                           AvailabilityZones                                                           |||
||+---------------------------------------+-----------------------------------------------------------------------------------------------+||
|||  SubnetId                             |  subnet-0cc747f574e20158a                                                                     |||
|||  ZoneName                             |  ap-southeast-2c                                                                              |||
||+---------------------------------------+-----------------------------------------------------------------------------------------------+||
|||                                                           AvailabilityZones                                                           |||
||+---------------------------------------+-----------------------------------------------------------------------------------------------+||
|||  SubnetId                             |  subnet-0d38b36b10174c83e                                                                     |||
|||  ZoneName                             |  ap-southeast-2a                                                                              |||
||+---------------------------------------+-----------------------------------------------------------------------------------------------+||
|||                                                            SecurityGroups                                                             |||
||+---------------------------------------------------------------------------------------------------------------------------------------+||
|||  sg-05831eeea0ff56d92                                                                                                                 |||
||+---------------------------------------------------------------------------------------------------------------------------------------+||
|||                                                                 State                                                                 |||
||+--------------------------------------------+------------------------------------------------------------------------------------------+||
|||  Code                                      |  provisioning                                                                            |||
||+--------------------------------------------+------------------------------------------------------------------------------------------+||


aws elbv2 create-target-group \
    --name devopsacademy-target-group \
    --protocol HTTP \
    --port 80 \
    --target-type instance \
    --vpc-id vpc-012017b09f0dae62e
------------------------------------------------------------------------------------------------------------------------------------------------------
|                                                                  CreateTargetGroup                                                                 |
+----------------------------------------------------------------------------------------------------------------------------------------------------+
||                                                                   TargetGroups                                                                   ||
|+----------------------------+---------------------------------------------------------------------------------------------------------------------+|
||  HealthCheckEnabled        |  True                                                                                                               ||
||  HealthCheckIntervalSeconds|  30                                                                                                                 ||
||  HealthCheckPath           |  /                                                                                                                  ||
||  HealthCheckPort           |  traffic-port                                                                                                       ||
||  HealthCheckProtocol       |  HTTP                                                                                                               ||
||  HealthCheckTimeoutSeconds |  5                                                                                                                  ||
||  HealthyThresholdCount     |  5                                                                                                                  ||
||  Port                      |  80                                                                                                                 ||
||  Protocol                  |  HTTP                                                                                                               ||
||  TargetGroupArn            |  arn:aws:elasticloadbalancing:ap-southeast-2:016454647794:targetgroup/devopsacademy-target-group/fe7fbe976a539182   ||
||  TargetGroupName           |  devopsacademy-target-group                                                                                         ||
||  TargetType                |  instance                                                                                                           ||
||  UnhealthyThresholdCount   |  2                                                                                                                  ||
||  VpcId                     |  vpc-012017b09f0dae62e                                                                                              ||
|+----------------------------+---------------------------------------------------------------------------------------------------------------------+|
|||                                                                     Matcher                                                                    |||
||+------------------------------------------------------------------------------------------+-----------------------------------------------------+||
|||  HttpCode                                                                                |  200                                                |||
||+------------------------------------------------------------------------------------------+-----------------------------------------------------+||


aws elbv2 register-targets \
    --target-group-arn arn:aws:elasticloadbalancing:ap-southeast-2:016454647794:targetgroup/devopsacademy-target-group/fe7fbe976a539182 \
   --targets Id=i-09f4aebbd093c3bd2 Id=i-0f36f2c30af22e52e


aws elbv2 create-listener \
    --load-balancer-arn arn:aws:elasticloadbalancing:ap-southeast-2:016454647794:loadbalancer/app/devopsacademy-alb/753433fd025f753f \
    --protocol HTTP \
    --port 80 \
    --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:ap-southeast-2:016454647794:targetgroup/devopsacademy-target-group/fe7fbe976a539182
----------------------------------------------------------------------------------------------------------------------------------------------------
|                                                                  CreateListener                                                                  |
+--------------------------------------------------------------------------------------------------------------------------------------------------+
||                                                                    Listeners                                                                   ||
|+-----------------+------------------------------------------------------------------------------------------------------------------------------+|
||  ListenerArn    |  arn:aws:elasticloadbalancing:ap-southeast-2:016454647794:listener/app/devopsacademy-alb/753433fd025f753f/980b361be9350339   ||
||  LoadBalancerArn|  arn:aws:elasticloadbalancing:ap-southeast-2:016454647794:loadbalancer/app/devopsacademy-alb/753433fd025f753f                ||
||  Port           |  80                                                                                                                          ||
||  Protocol       |  HTTP                                                                                                                        ||
|+-----------------+------------------------------------------------------------------------------------------------------------------------------+|
|||                                                                DefaultActions                                                                |||
||+-----------------+----------------------------------------------------------------------------------------------------------------------------+||
|||  TargetGroupArn |  arn:aws:elasticloadbalancing:ap-southeast-2:016454647794:targetgroup/devopsacademy-target-group/fe7fbe976a539182          |||
|||  Type           |  forward                                                                                                                   |||
||+-----------------+----------------------------------------------------------------------------------------------------------------------------+||
||||                                                                ForwardConfig                                                               ||||
|||+--------------------------------------------------------------------------------------------------------------------------------------------+|||
|||||                                                        TargetGroupStickinessConfig                                                       |||||
||||+---------------------------------------------------------------------------+--------------------------------------------------------------+||||
|||||  Enabled                                                                  |  False                                                       |||||
||||+---------------------------------------------------------------------------+--------------------------------------------------------------+||||
|||||                                                               TargetGroups                                                               |||||
||||+-----------------+------------------------------------------------------------------------------------------------------------------------+||||
|||||  TargetGroupArn |  arn:aws:elasticloadbalancing:ap-southeast-2:016454647794:targetgroup/devopsacademy-target-group/fe7fbe976a539182      |||||
|||||  Weight         |  1                                                                                                                     |||||
||||+-----------------+------------------------------------------------------------------------------------------------------------------------+||||


aws elbv2 set-security-groups --load-balancer-arn arn:aws:elasticloadbalancing:ap-southeast-2:016454647794:loadbalancer/app/devopsacademy-alb/753433fd025f753f --security-groups sg-01d50088425fc716b
----------------------------
|     SetSecurityGroups    |
+--------------------------+
||    SecurityGroupIds    ||
|+------------------------+|
||  sg-01d50088425fc716b  ||
|+------------------------+|
```

- Details of the security group used
```
aws ec2 create-security-group --group-name SGPublicWeb --description "DA Public SG Web access" --vpc-id vpc-012017b09f0dae62e
-------------------------------------
|        CreateSecurityGroup        |
+----------+------------------------+
|  GroupId |  sg-01d50088425fc716b  |
+----------+------------------------+

aws ec2 authorize-security-group-ingress --group-id sg-01d50088425fc716b --protocol tcp --port 80 --cidr 0.0.0.0/0
```

Questions:
- Run a few times `curl <load-balancer-cname>` and explain what do you see?
```
It returns the public DNS name of one of the instances every time, alternating between each instance when sending the request multiple times:

curl devopsacademy-alb-654654077.ap-southeast-2.elb.amazonaws.com
ip-10-10-4-191.ap-southeast-2.compute.internal

curl devopsacademy-alb-654654077.ap-southeast-2.elb.amazonaws.com
ip-10-10-0-33.ap-southeast-2.compute.internal
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws02](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws02/README.md)
