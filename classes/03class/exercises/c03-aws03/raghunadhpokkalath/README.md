# c03-aws03

## Command Execution Output
- Command used to create the Route53 zone:
```
Created a private zone using below command
> aws route53  create-hosted-zone --name www.devopsacademyroute53.com --vpc VPCRegion=ap-southeast-2,VPCId="vpc-076a05ec0f3be4895" --caller-reference raghu2307202010PM

{
    "Location": "https://route53.amazonaws.com/2013-04-01/hostedzone/Z00090642S8F2T4TXPD0J",
    "HostedZone": {
        "Id": "/hostedzone/Z00090642S8F2T4TXPD0J",
        "Name": "www.devopsacademyroute53.com.",
        "CallerReference": "raghu2307202010PM",
        "Config": {
            "PrivateZone": true
        },
        "ResourceRecordSetCount": 2
    },
    "ChangeInfo": {
        "Id": "/change/C08306303J11Q4EV6SCQD",
        "Status": "PENDING",
        "SubmittedAt": "2020-07-23T12:52:24.467000+00:00"
    },
    "VPC": {
        "VPCRegion": "ap-southeast-2",
        "VPCId": "vpc-076a05ec0f3be4895"
    }
}
```

- Command used to add any new records to the zone 
```
create alias record set in json
> cat alias.json
{
    "Comment": "Creating Alias Record for devopsacademyroute53 ",
    "Changes": [
        {
            "Action": "CREATE",
            "ResourceRecordSet": {
                "Name": "www.devopsacademyroute53.com",
                "Type": "A",
                "AliasTarget": {
                    "HostedZoneId": "Z1GM3OXH4ZPM65",
                    "DNSName": "devopsacademylb-1333495920.ap-southeast-2.elb.amazonaws.com",
                    "EvaluateTargetHealth": false
                }
            }
        }
    ]
}

>  aws route53 change-resource-record-sets --hosted-zone-id Z00090642S8F2T4TXPD0J --change-batch file://alias.json

{
    "ChangeInfo": {
        "Id": "/change/C0020449142SCDBT1NCWF",
        "Status": "PENDING",
        "SubmittedAt": "2020-07-23T13:29:52.218000+00:00",
        "Comment": "Creating Alias Record for devopsacademyroute53 "
    }
}



EnableDnsSupport attribute
> aws ec2 modify-vpc-attribute --vpc-id vpc-076a05ec0f3be4895 --enable-dns-hostnames "{\"Value\":true}"

EnableDnsHostName attribute
> aws ec2 modify-vpc-attribute --vpc-id vpc-076a05ec0f3be4895 --enable-dns-support "{\"Value\":true}"

Connect to EC2 instance and verify DNS resoultion works

ssh -i "EC2KeyPair.pem" ec2-user@13.211.84.52
> curl www.devopsacademyroute53.com
ip-10-0-201-194.ap-southeast-2.compute.internal
>curl www.devopsacademyroute53.com
ip-10-0-101-215.ap-southeast-2.compute.internal


```

- Post any findings, how option you decided to go with, records created, domain created, and anything else that you find interesting.
```
The command create-hosted-zone options to pass vpc id was not very clear in AWS documentation

I kept on getting below error. Took a while to realize i was passing hosted zone id of route53 domain instead of ELB domain hosted zone id.

An error occurred (InvalidChangeBatch) when calling the ChangeResourceRecordSets operation: [Tried to create an alias that targets devopsacademylb-1333495920.ap-southeast-2.elb.amazonaws.com., type A in zone Z00090642S8F2T4TXPD0J, but the alias target name does not lie within the target zone, Tried to create an alias that targets devopsacademylb-1333495920.ap-southeast-2.elb.amazonaws.com., type A in zone Z00090642S8F2T4TXPD0J, but that target was not found]

I had to modify the DNS attribute of VPC to resolve the DNS.For non-default vpc, this option is disabled by default.Without this option, DNS can't be resolved from Ec2



```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws03](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws03/README.md)