# c03-aws03

## Command Execution Output
- Command used to create the Route53 zone:
```bash
# Get my registered domain dryvonne.net and a Public HostedZone created by Route53 Registrar
aws route53 list-hosted-zones
{
    "HostedZones": [
        {
            "Id": "/hostedzone/Z0487567QK3UCA9HOK0T",
            "Name": "dryvonne.net.",
            "CallerReference": "RISWorkflow-RD:6c331b2d-79b7-4c64-895c-aa21463049ee",
            "Config": {
                "Comment": "HostedZone created by Route53 Registrar",
                "PrivateZone": false
            },
            "ResourceRecordSetCount": 4
        }
    ]
}

# Get the DSNName and CanonicalHosted Zone Id of the ALB
ALB_NAME='da-c03-elb'
aws elbv2 describe-load-balancers  --names $ALB_NAME
{
    "LoadBalancers": [
        {
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:421117346104:loadbalancer/app/da-c03-elb/7fac8f3e640bc61c",
            "DNSName": "da-c03-elb-787858567.ap-southeast-2.elb.amazonaws.com",
            "CanonicalHostedZoneId": "Z1GM3OXH4ZPM65",
            "CreatedTime": "2020-09-05T10:17:45.300000+00:00",
            "LoadBalancerName": "da-c03-elb",
            "Scheme": "internet-facing",
            "VpcId": "vpc-02ec2836691642ace",
            "State": {
                "Code": "active"
            },
            "Type": "application",
            "AvailabilityZones": [
                {
                    "ZoneName": "ap-southeast-2b",
                    "SubnetId": "subnet-00d8a496401ddc8de",
                    "LoadBalancerAddresses": []
                },
                {
                    "ZoneName": "ap-southeast-2a",
                    "SubnetId": "subnet-04709dce111382a62",
                    "LoadBalancerAddresses": []
                }
            ],
            "SecurityGroups": [
                "sg-0071bd92c78cf5467"
            ],
            "IpAddressType": "ipv4"
        }
    ]
}

ALB_CHZ="Z1GM3OXH4ZPM65"
ALB_DNS="da-c03-elb-787858567.ap-southeast-2.elb.amazonaws.com"

#  Create a Private Hosted Zone

VPC_NAME='da-c02-vpc';
VPC_ID=$(aws ec2 describe-vpcs \
    --filter "Name=tag:Name,Values=$VPC_NAME" \
    --query Vpcs[].VpcId --output text);
echo $VPC_ID

# Update VPC to enable DNS as needed
aws ec2 modify-vpc-attribute --vpc-id $VPC_ID --enable-dns-hostnames "{\"Value\":true}"
aws ec2 modify-vpc-attribute --vpc-id $VPC_ID --enable-dns-support "{\"Value\":true}"

VPC_REGION="ap-southeast-2"

aws route53 create-hosted-zone \
    --name devopsplayer.com \
    --caller-reference 2020-09-05-11:06 \
    --vpc VPCRegion=$VPC_REGION,VPCId=$VPC_ID \
    --hosted-zone-config Comment="Devops Player Private Hosted Zone",PrivateZone=true  
{
    "Location": "https://route53.amazonaws.com/2013-04-01/hostedzone/Z06842741GPJFZ93ZXIF1",
    "HostedZone": {
        "Id": "/hostedzone/Z06842741GPJFZ93ZXIF1",
        "Name": "devopsplayer.com.",
        "CallerReference": "2020-09-05-11:06",
        "Config": {
            "Comment": "Devops Player Private Hosted Zone",
            "PrivateZone": true
        },
        "ResourceRecordSetCount": 2
    },
    "ChangeInfo": {
        "Id": "/change/C009432217TH6FNPAEQC0",
        "Status": "PENDING",
        "SubmittedAt": "2020-09-05T13:13:13.022000+00:00"
    },
    "VPC": {
        "VPCRegion": "ap-southeast-2",
        "VPCId": "vpc-02ec2836691642ace"
    }
}

```

- Command used to add any new records to the zone 
```bash

# Create a Record Set from the public host zone

$ cat << EOF > ~/Repo/da-excercises/c03-aws03/afaryy/c03-public-record-sets.json
{
  "Comment": "Route53 A Record Set alias to ASG from public host zone",
  "Changes": [
    {
      "Action": "CREATE",
      "ResourceRecordSet": {
        "Name": "devopsacademy.dryvonne.net",
        "Type": "A",
        "AliasTarget": {
          "HostedZoneId": "Z1GM3OXH4ZPM65",
          "DNSName": "da-c03-elb-787858567.ap-southeast-2.elb.amazonaws.com",
          "EvaluateTargetHealth": false
        }}
    }]
}
EOF

aws route53 change-resource-record-sets \
    --hosted-zone-id Z0487567QK3UCA9HOK0T \
    --change-batch file://~/Repo/da-excercises/c03-aws03/afaryy/c03-public-record-sets.json
{
    "ChangeInfo": {
        "Id": "/change/C00834092WVD8UDEQRLIA",
        "Status": "PENDING",
        "SubmittedAt": "2020-09-05T13:53:42.094000+00:00",
        "Comment": "Route53 A Record Set alias to ASG from public host zone"
    }
}

# Check the result for public hosted zone

$ dig devopsacademy.dryvonne.net
;; ANSWER SECTION:
devopsacademy.dryvonne.net. 60  IN      A       13.55.253.19
devopsacademy.dryvonne.net. 60  IN      A       13.54.106.233

$ host devopsacademy.dryvonne.net
devopsacademy.dryvonne.net has address 13.54.106.233
devopsacademy.dryvonne.net has address 13.55.253

$ for (( c=1; c<=6; c++ )); do curl -w "\n" devopsacademy.dryvonne.net; done
ip-10-128-11-71.ap-southeast-2.compute.internal
ip-10-128-10-126.ap-southeast-2.compute.internal
ip-10-128-10-126.ap-southeast-2.compute.internal
ip-10-128-11-71.ap-southeast-2.compute.internal
ip-10-128-11-71.ap-southeast-2.compute.internal
ip-10-128-11-71.ap-southeast-2.compute.internal


# Create a A Record Set from the private host zone

cat << EOF > ~/Repo/da-excercises/c03-aws03/afaryy/c03-private-record-sets.json
{
  "Comment": "Route53 A Record Set alias to ASG from private host zone",
  "Changes": [
    {
      "Action": "CREATE",
      "ResourceRecordSet": {
        "Name": "devopsacademy.devopsplayer.com",
        "Type": "A",
        "AliasTarget": {
          "HostedZoneId": "Z1GM3OXH4ZPM65",
          "DNSName": "da-c03-elb-787858567.ap-southeast-2.elb.amazonaws.com",
          "EvaluateTargetHealth": false
        }}
    }]
}
EOF


aws route53 change-resource-record-sets \
    --hosted-zone-id Z06842741GPJFZ93ZXIF1 \
    --change-batch file://~/Repo/da-excercises/c03-aws03/afaryy/c03-private-record-sets.json

{
    "ChangeInfo": {
        "Id": "/change/C04003962LDJPN58ZYK46",
        "Status": "PENDING",
        "SubmittedAt": "2020-09-05T14:11:12.718000+00:00",
        "Comment": "Route53 A Record Set alias to ASG from private host zone"
    }
}

# Check the result for private hosted zone

$ ssh -i ~/.ssh/da-key.pem ec2-user@ec2-54-253-211-152.ap-southeast-2.compute.amazonaws.com
 
$ dig devopsacademy.devopsplayer.com
;; ANSWER SECTION:
devopsacademy.devopsplayer.com. 22 IN   A       13.54.106.233
devopsacademy.devopsplayer.com. 22 IN   A       13.55.253.19

$ host devopsacademy.devopsplayer.com
devopsacademy.devopsplayer.com has address 13.54.106.233
devopsacademy.devopsplayer.com has address 13.55.253.19

$ for (( c=1; c<=6; c++ )); do curl -w "\n" devopsacademy.devopsplayer.com; done
ip-10-128-10-126.ap-southeast-2.compute.internal
ip-10-128-10-126.ap-southeast-2.compute.internal
ip-10-128-11-71.ap-southeast-2.compute.internal
ip-10-128-11-71.ap-southeast-2.compute.internal
ip-10-128-10-126.ap-southeast-2.compute.internal
ip-10-128-10-126.ap-southeast-2.compute.internal

```

- Post any findings, how option you decided to go with, records created, domain created, and anything else that you find interesting.
```

I have had a registered public domian and a public host zone created by Route53 register, so on it I create a A record alias to ALB, and get the result of Dns resolution and random traffic redirection to instances. 
I also created a private host zone and then create a A record alias to ALB based on it, after ssh into one EC2 instance, and then I can check the result. 
If we wanna visit website by HTTPS, we need to create ACM certificate for subdomain applied to ALB, also need to update ALB Listener port and protocol and security ingress rule.
 
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws03](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws03/README.md)