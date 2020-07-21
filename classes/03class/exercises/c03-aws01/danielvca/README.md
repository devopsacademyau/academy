
# C03-aws01

## Command Execution Output
- Commands used to create your autoscaling group:
```
SG
aws ec2 create-security-group \
        --group-name da-class03-sg \
        --description "Allow port 80" \
        --vpc-id vpc-0c2c93451cdd28192
		
GroupId: sg-0a60e0c3a717b38ef

aws ec2 authorize-security-group-ingress \
        --group-id sg-0a60e0c3a717b38ef \
        --cidr 0.0.0.0/0 \
        --port 80 \
        --protocol tcp
(No Output)

aws autoscaling create-launch-configuration \
        --launch-configuration-name lc-daniel \
        --user-data file://data.txt \
        --image-id ami-0a58e22c727337c51 \
        --instance-type t2.nano \
        --security-groups sg-0a60e0c3a717b38ef \
        --associate-public-ip-address
(No Output)

aws autoscaling create-auto-scaling-group \
        --auto-scaling-group-name asg-da \
        --min-size 1 --max-size 2 --desired-capacity 2 \
        --launch-configuration-name lc-daniel \
        --vpc-zone-identifier "subnet-091fd751e703a303b,subnet-0d01c4b1f73f8bc78" \
		--tags Key=Name,Value=daniel-asg
(No Output)


```
- Command used to get each asg instance hostname through the webserver
```
---------------------------------------------------------------------------------------------------------------------------  
| DescribeInstances |  
+------------------------------------------------+----------------------+---------------+-------------+-------------------+  
| DnsName | Id | IpAddress | State | Zone |  
+------------------------------------------------+----------------------+---------------+-------------+-------------------+  
| ip-10-0-4-154.ap-southeast-2.compute.internal | i-0dfa6649c177873bf | 3.25.73.235 | running | ap-southeast-2a |  
| | i-0601f266f71000886 | None | terminated | ap-southeast-2b |  
| ip-10-0-5-177.ap-southeast-2.compute.internal | i-01ccd00cc961b99a7 | 13.239.86.86 | running | ap-southeast-2b |  
+------------------------------------------------+----------------------+---------------+-------------+-------------------+

curl http://13.239.86.86
curl http://3.25.73.235
```

- Details of the security group used on the asg
```
		
aws ec2 describe-security-groups --group-id sg-0a60e0c3a717b38ef
  - Description: Allow port 80
  GroupId: sg-0a60e0c3a717b38ef
  GroupName: da-class03-sg
  IpPermissions:
  - FromPort: 80
    IpProtocol: tcp
    IpRanges:
    - CidrIp: 0.0.0.0/0
    Ipv6Ranges:
    - CidrIpv6: ::/0
    PrefixListIds: []
    ToPort: 80
    UserIdGroupPairs: []
  - FromPort: 22
    IpProtocol: tcp
    IpRanges:
    - CidrIp: 180.150.58.136/32
    Ipv6Ranges: []
    PrefixListIds: []
    ToPort: 22
    UserIdGroupPairs: []
  IpPermissionsEgress:
  - IpProtocol: '-1'
    IpRanges:
    - CidrIp: 0.0.0.0/0
    Ipv6Ranges: []
    PrefixListIds: []
    UserIdGroupPairs: []
  OwnerId: '646093908012'
  VpcId: vpc-0c2c93451cdd28192
```

- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`
```
Writes the hostname into the index.html file
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)

> Written with [StackEdit](https://stackedit.io/).
