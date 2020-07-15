# c03-aws02

## Command Execution Output

- Command used to create the Application Load Balancer (ALB)

```bash
## 4 steps
## Public subnets IDs: subnet-0f867dac87c7e75b4, subnet-01ef5462d19df360c, subnet-01ac1852278e631c7
## Create load balancer
aws elbv2 create-load-balancer \
  --name my-first-load-balancer \
  --subnets subnet-0f867dac87c7e75b4 subnet-01ef5462d19df360c \
  --security-groups sg-0d721e2362c8a6508 \
  --scheme internet-facing

# Output
LOADBALANCERS   Z1GM3OXH4ZPM65  2020-07-15T03:30:16.270000+00:00        my-first-load-balancer-2068798985.ap-southeast-2.elb.amazonaws.com      ipv4
    arn:aws:elasticloadbalancing:ap-southeast-2:478433196210:loadbalancer/app/my-first-load-balancer/04b623114d234ce9       my-first-load-balancer  internet-facing application     vpc-074c260483405f2bb
AVAILABILITYZONES       subnet-01ef5462d19df360c        ap-southeast-2b
AVAILABILITYZONES       subnet-0f867dac87c7e75b4        ap-southeast-2a
SECURITYGROUPS  sg-0d721e2362c8a6508
STATE   provisioning

## Create target group
aws elbv2 create-target-group \
  --name my-first-targets \
  --protocol HTTP \
  --port 80 \
  --vpc-id vpc-074c260483405f2bb \
  --target-type instance

# Output
TARGETGROUPS    True    30      /       traffic-port    HTTP    5       5       80      HTTP    arn:aws:elasticloadbalancing:ap-southeast-2:478433196210:targetgroup/my-first-targets/70121e7e7cabaae3  my-first-targets        instance        2       vpc-074c260483405f2bb
MATCHER 200

## Register targets
aws elbv2 register-targets --target-group-arn arn:aws:elasticloadbalancing:ap-southeast-2:478433196210:targetgroup/my-first-targets/70121e7e7cabaae3 --targets Id=i-08c123aba18d30374  Id=i-0f36a08a446c52c7d
# Output
NONE

## Create listener
aws elbv2 create-listener --load-balancer-arn arn:aws:elasticloadbalancing:ap-southeast-2:478433196210:loadbalancer/app/my-first-load-balancer/04b623114d234ce9 --protocol HTTP --port 80  \
--default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:ap-southeast-2:478433196210:targetgroup/my-first-targets/70121e7e7cabaae3
# Output
LISTENERS       arn:aws:elasticloadbalancing:ap-southeast-2:478433196210:listener/app/my-first-load-balancer/04b623114d234ce9/06822a567be36a71  arn:aws:elasticloadbalancing:ap-southeast-2:478433196210:loadbalancer/app/my-first-load-balancer/04b623114d234ce9       80      HTTP
DEFAULTACTIONS  arn:aws:elasticloadbalancing:ap-southeast-2:478433196210:targetgroup/my-first-targets/70121e7e7cabaae3  forward
TARGETGROUPSTICKINESSCONFIG     False
TARGETGROUPS    arn:aws:elasticloadbalancing:ap-southeast-2:478433196210:targetgroup/my-first-targets/70121e7e7cabaae3  1

## Verify the health of the registered target
aws elbv2 describe-target-health --target-group-arn arn:aws:elasticloadbalancing:ap-southeast-2:478433196210:targetgroup/my-first-targets/70121e7e7cabaae3
# Output
TARGETHEALTHDESCRIPTIONS        80
TARGET  i-0f36a08a446c52c7d     80
TARGETHEALTH    healthy
TARGETHEALTHDESCRIPTIONS        80
TARGET  i-08c123aba18d30374     80
TARGETHEALTH    healthy
```

- Details of the security group used

```
## Create security group
aws ec2 create-security-group --group-name web-sg --description "Access from everywhere" --vpc-id vpc-074c260483405f2bb --tag-specifications 'ResourceType="security-group",Tags=[{Key="Name",Value="web-sg"}]'
# Output
sg-0d721e2362c8a6508
TAGS    Name    web-sg

## Allow ingress from everywhere
aws ec2 authorize-security-group-ingress --group-id sg-0d721e2362c8a6508 --protocol tcp --port 80 --cidr 0.0.0.0/0
# Output
none
```

Questions:

- Run a few times `curl <load-balancer-cname>` and explain what do you see?

```bash
curl my-first-load-balancer-2068798985.ap-southeast-2.elb.amazonaws.com
# Output
ip-10-0-2-246.ap-southeast-2.compute.internal%

curl my-first-load-balancer-2068798985.ap-southeast-2.elb.amazonaws.com
# Output
ip-10-0-4-135.ap-southeast-2.compute.internal%

curl my-first-load-balancer-2068798985.ap-southeast-2.elb.amazonaws.com
# Output
ip-10-0-4-135.ap-southeast-2.compute.internal%

curl my-first-load-balancer-2068798985.ap-southeast-2.elb.amazonaws.com
# Output
ip-10-0-2-246.ap-southeast-2.compute.internal%

```

> As explained before, Load balancer is taking action when receive any http request using a default algorithm to balance load avoiding overload.

## Question

- AZ in this case is considered a subnet? In the previous exercise I just defined the subnets.

---

Answer for exercise [c03-aws02](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws02/README.md)
