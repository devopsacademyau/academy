# c03-aws03

## Command Execution Output
- Command used to create the Route53 zone:
```
# Private Hosted Zone

$ aws route53 create-hosted-zone \
    --name devopsacademy.com \
    --caller-reference 2020-07-08-14:12 \
    --hosted-zone-config Comment="DevOps Academy Private Hosted Zone",PrivateZone=true \
    --vpc VPCRegion=ap-southeast-2,VPCId=vpc-0721e28436cea8410

{
    "Location": "https://route53.amazonaws.com/2013-04-01/hostedzone/Z096024113V7ZVO0VM1RW",
    "HostedZone": {
        "Id": "/hostedzone/Z096024113V7ZVO0VM1RW",
        "Name": "devopsacademy.com.",
        "CallerReference": "2020-07-08-14:12",
        "Config": {
            "Comment": "DevOps Academy Private Hosted Zone",
            "PrivateZone": true
        },
        "ResourceRecordSetCount": 2
    },
    "ChangeInfo": {
        "Id": "/change/C10407421W51CI7TD1E94",
        "Status": "PENDING",
        "SubmittedAt": "2020-07-08T04:19:17.119000+00:00"
    },
    "VPC": {
        "VPCRegion": "ap-southeast-2",
        "VPCId": "vpc-0721e28436cea8410"
    }
}
```

- Command used to add any new records to the zone 
```
# Private Record Set

$ cat << EOF > ~/AWS/files/devops-academy-webserver-private-change-resource-record-sets.json
{
  "Comment": "Private R53 Record Set for DevOps Academy ASG Web Servers",
  "Changes": [
    {
      "Action": "CREATE",
      "ResourceRecordSet": {
        "Name": "webserver.devopsacademy.com",
        "Type": "A",
        "AliasTarget": {
          "HostedZoneId": "Z1GM3OXH4ZPM65",
          "DNSName": "devops-academy-alb-1924525018.ap-southeast-2.elb.amazonaws.com",
          "EvaluateTargetHealth": false
        }}
    }]
}
EOF

$ aws route53 change-resource-record-sets \
    --hosted-zone-id Z096024113V7ZVO0VM1RW \
    --change-batch file://~/AWS/files/devops-academy-webserver-private-change-resource-record-sets.json

{
    "ChangeInfo": {
        "Id": "/change/C025219427WY5MWCOIOHZ",
        "Status": "PENDING",
        "SubmittedAt": "2020-07-08T04:24:19.905000+00:00",
        "Comment": "Private R53 Record Set for DevOps Academy ASG Web Servers"
    }
}

# Name resolution test for private hosted zone (from EC2 instance)

$ host webserver.devopsacademy.com
webserver.devopsacademy.com has address 54.206.26.119
webserver.devopsacademy.com has address 3.105.227.75

$ curl webserver.devopsacademy.com
ip-10-11-33-36.ap-southeast-2.compute.internal[ec2-user@ip-10-11-11-168
$ curl webserver.devopsacademy.com
ip-10-11-11-60.ap-southeast-2.compute.internal[ec2-user@ip-10-11-11-168

# I had an existing domain registred with Route 53

$ aws route53 list-hosted-zones

{
    "HostedZones": [
        {
            "Id": "/hostedzone/Z19TW23E81ZQ92",
            "Name": "marcosms.com.au.",
            "CallerReference": "RISWorkflow-RD:a8df5a82-b244-4015-94bf-1f8795168637",
            "Config": {
                "Comment": "HostedZone created by Route53 Registrar",
                "PrivateZone": false
            },
            "ResourceRecordSetCount": 6
        },
        {
            "Id": "/hostedzone/Z096024113V7ZVO0VM1RW",
            "Name": "devopsacademy.com.",
            "CallerReference": "2020-07-08-14:12",
            "Config": {
                "Comment": "DevOps Academy Private Hosted Zone",
                "PrivateZone": true
            },
            "ResourceRecordSetCount": 3
        }
    ]
}

# Command used to get the Canonical Hosted Zone Id for the ALB

$ aws elbv2 describe-load-balancers \
    --load-balancer-arns arn:aws:elasticloadbalancing:ap-southeast-2:149613515908:loadbalancer/app/devops-academy-alb/d706929f7cd85a67

{
    "LoadBalancers": [
        {
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:149613515908:loadbalancer/app/devops-academy-alb/d706929f7cd85a67",
            "DNSName": "devops-academy-alb-1924525018.ap-southeast-2.elb.amazonaws.com",
            "CanonicalHostedZoneId": "Z1GM3OXH4ZPM65",
            "CreatedTime": "2020-07-08T02:30:36.830000+00:00",
            "LoadBalancerName": "devops-academy-alb",
            "Scheme": "internet-facing",
            "VpcId": "vpc-0721e28436cea8410",
            "State": {
                "Code": "active"
            },
            "Type": "application",
            "AvailabilityZones": [
                {
                    "ZoneName": "ap-southeast-2a",
                    "SubnetId": "subnet-012cc488da2a78bcd",
                    "LoadBalancerAddresses": []
                },
                {
                    "ZoneName": "ap-southeast-2b",
                    "SubnetId": "subnet-01c5db45e8f5eda43",
                    "LoadBalancerAddresses": []
                },
                {
                    "ZoneName": "ap-southeast-2c",
                    "SubnetId": "subnet-0f04d5a771b8895fd",
                    "LoadBalancerAddresses": []
                }
            ],
            "SecurityGroups": [
                "sg-010e9583a629eae27"
            ],
            "IpAddressType": "ipv4"
        }
    ]
}

# Public Record Set

$ cat << EOF > ~/AWS/files/devops-academy-webserver-change-resource-record-sets.json
{
  "Comment": "R53 Record Set for DevOps Academy ASG Web Servers",
  "Changes": [
    {
      "Action": "CREATE",
      "ResourceRecordSet": {
        "Name": "devopsacademy-web.marcosms.com.au",
        "Type": "A",
        "AliasTarget": {
          "HostedZoneId": "Z1GM3OXH4ZPM65",
          "DNSName": "devops-academy-alb-1924525018.ap-southeast-2.elb.amazonaws.com",
          "EvaluateTargetHealth": false
        }}
    }]
}
EOF

$ aws route53 change-resource-record-sets \
    --hosted-zone-id Z19TW23E81ZQ92 \
    --change-batch file://~/AWS/files/devops-academy-webserver-change-resource-record-sets.json

{
    "ChangeInfo": {
        "Id": "/change/C09688392QYALFH00GXJW",
        "Status": "PENDING",
        "SubmittedAt": "2020-07-08T04:03:57.382000+00:00",
        "Comment": "R53 Record Set for DevOps Academy ASG Web Servers"
    }
}

# Name resolution test for public hosted zone (from my laptop)

$ host devopsacademy-web.marcosms.com.au
devopsacademy-web.marcosms.com.au has address 3.105.227.75
devopsacademy-web.marcosms.com.au has address 54.206.26.119

$ curl devopsacademy-web.marcosms.com.au
ip-10-11-11-60.ap-southeast-2.compute.internal
$ curl devopsacademy-web.marcosms.com.au
ip-10-11-33-36.ap-southeast-2.compute.internal
```

- Post any findings, how option you decided to go with, records created, domain created, and anything else that you find interesting.
```
1. My initial name resolution tests for the private record set failed, and I realised the 'DNS resolution' option was enabled in my VPC, but the 'DNS hostnames' option wasn't. I have enabled the second option and after a few minutes the name resolution test succeeded.
2. As I had a public domain registred with Route R53, I created a private hosted zone + record set via AWS CLI, and just a new public record set in my public hosted zone. 
```

***
Answer for exercise [c03-aws03](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws03/README.md)
