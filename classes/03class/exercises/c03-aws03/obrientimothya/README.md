# c03-aws02

## Command Execution Output
- Command used to create the Application Load Balancer (ALB)
```
PUBLICA="subnet-0038a09635262c6ff"
PUBLICB="subnet-076b647b8a2e6aea4"
VPC="vpc-09a3c6830a6d58479"
SG=$(aws ec2 create-security-group \
    --group-name "devopsalb-sg" \
    --description "app load balancer" \
    --vpc-id "${VPC}" \
    --profile tobrien)
aws ec2 authorize-security-group-ingress \
    --group-id "${SG}" \
    --ip-permissions IpProtocol=tcp,FromPort=80,ToPort=80,IpRanges='[{CidrIp=0.0.0.0/0,Description="HTTP 80 Anywhere"}]' \
    --profile tobrien
ALB=$(aws elbv2 create-load-balancer \
    --name devopsacademy-alb  \
    --subnets "${PUBLICA}" "${PUBLICB}" \
    --security-groups "${SG}" \
    --profile tobrien | awk '{print $6}')
TARGET=$(aws elbv2 create-target-group \
    --name devops-target \
    --protocol HTTP \
    --port 80 \
    --vpc-id "${VPC}" \
    --profile tobrien | awk '{print $11}')
aws elbv2 register-targets \
    --target-group-arn "${TARGET}"  \
    --targets Id=i-02393ef194237c3a2 Id=i-0ea81ab00d9859e6e \
    --profile tobrien
aws elbv2 create-listener \
    --load-balancer-arn "${ALB}" \
    --protocol HTTP --port 80  \
    --default-actions Type=forward,TargetGroupArn=$TARGET \
    --profile tobrien

OUTPUT

LISTENERS	arn:aws:elasticloadbalancing:ap-southeast-2:437637330966:listener/app/devopsacademy-alb/0571ab9d80c4c60d/87b2b55e63557d3a	arn:aws:elasticloadbalancing:ap-southeast-2:437637330966:loadbalancer/app/devopsacademy-alb/0571ab9d80c4c60d	80	HTTP
DEFAULTACTIONS	arn:aws:elasticloadbalancing:ap-southeast-2:437637330966:targetgroup/devops-target/7a1660369b5347b7	forward
TARGETGROUPSTICKINESSCONFIG	False
TARGETGROUPS	arn:aws:elasticloadbalancing:ap-southeast-2:437637330966:targetgroup/devops-target/7a1660369b5347b7	1
```

- Details of the security group used
```
aws ec2 describe-security-groups \
    --group-ids "${SG}" \
    --profile tobrien

OUTPUT

SECURITYGROUPS	app load balancer	sg-0f508f34dbfcfd36d	devopsalb-sg	437637330966	vpc-09a3c6830a6d58479
IPPERMISSIONS	80	tcp	80
IPRANGES	0.0.0.0/0	HTTP 80 Anywhere
IPPERMISSIONSEGRESS	-1
IPRANGES	0.0.0.0/0
```

Questions:
- Run a few times `curl <load-balancer-cname>` and explain what do you see?
```
The loadbalancer is distributing the requests between the instances, as shown below, with multiple hostnames being returned:

❯ curl devopsacademy-alb-1756979158.ap-southeast-2.elb.amazonaws.com
ip-10-0-1-83.ap-southeast-2.compute.internal
❯ curl devopsacademy-alb-1756979158.ap-southeast-2.elb.amazonaws.com
ip-10-0-3-222.ap-southeast-2.compute.internal
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws02](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws02/README.md)
