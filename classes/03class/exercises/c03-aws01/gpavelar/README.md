# C03-aws01

## Command Execution Output

- Commands used to create your autoscaling group:

```bash
## Now c03-aws01
## First of all, we need to create a launch configuration.
aws autoscaling create-launch-configuration --launch-configuration-name my-first-launch-cfg --image-id ami-0a58e22c727337c51 --instance-type t2.nano --user-data file://user-data.txt --associate-public-ip-address --security-groups sg-0d721e2362c8a6508
# Output
NONE

## Describe
aws autoscaling describe-launch-configurations
# Output
LAUNCHCONFIGURATIONS    True    2020-07-15T01:25:44.579000+00:00        False   ami-0a58e22c727337c51   t2.nano                 arn:aws:autoscaling:ap-southeast-2:478433196210:launchConfiguration:daab38ed-cc23-4e2e-a7a1-9e3f286e2884:launchConfigurationName/my-first-launch-cfg    my-first-launch-cfg
             IyEgL2Jpbi9iYXNoCnl1bSB1cGRhdGUgLXkKeXVtIGluc3RhbGwgLXkgaHR0cGQKY3VybCAxNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9ob3N0bmFtZSA+IGluZGV4Lmh0bWwKbXYgaW5kZXguaHRtbCAvdmFyL3d3dy9odG1sLwpzeXN0ZW1jdGwgc3RhcnQgaHR0cGQK
INSTANCEMONITORING      True
SECURITYGROUPS  sg-0d721e2362c8a6508

## Public subnets IDs: subnet-0f867dac87c7e75b4, subnet-01ef5462d19df360c, subnet-01ac1852278e631c7
## Secondly, Create autoscaling group
aws autoscaling create-auto-scaling-group --auto-scaling-group-name my-first-autoscaling-group --launch-configuration-name my-first-launch-cfg --min-size 1 --max-size 2 --desired-capacity 2 --vpc-zone-identifier "subnet-0f867dac87c7e75b4,subnet-01ef5462d19df360c"
# Output
None

## Describe
aws autoscaling describe-auto-scaling-instances
# Output
AUTOSCALINGINSTANCES    my-first-autoscaling-group      ap-southeast-2b HEALTHY i-08c123aba18d30374     t2.nano my-first-launch-cfg     InService
       False
AUTOSCALINGINSTANCES    my-first-autoscaling-group      ap-southeast-2a HEALTHY i-0f36a08a446c52c7d     t2.nano my-first-launch-cfg     InService
       False
```

- Command used to get each asg instance hostname through the webserver

```
#
aws ec2 describe-instances --instance-ids i-08c123aba18d30374 i-0f36a08a446c52c7d --query 'Reservations[*].Instances[*].PublicIpAddress' --output text
# Output
13.210.206.144
3.106.58.58


## Brower or curl
curl http://3.106.58.58/
# Output
ip-10-0-4-135.ap-southeast-2.compute.internal

curl http://13.210.206.144/
# Output
ip-10-0-2-246.ap-southeast-2.compute.internal
```

[[1](https://stackoverflow.com/questions/38679346/get-public-ip-address-on-current-ec2-instance/38681638)]

- Details of the security group used on the asg

```bash
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

- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`

```bash
## Curl command
Curl is command line that transfer data to or from a server using any available protocol such as HTTP, FTP, IMAP, etc. It is widely used to work with automation.

So this command is getting the answer from this webserver and send to a file called `index.html`
```

---

Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)
