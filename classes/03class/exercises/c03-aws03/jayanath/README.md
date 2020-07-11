# c03-aws03

## Command Execution Output
- Command used to create the Route53 zone:
```
> aws route53 create-hosted-zone \
    --name jayforweb.com \
    --hosted-zone-config Comment="DOA test hosted zone" \
    --caller-reference "Wed  8 Jul 2020 22:54:18 AEST"

    {
        "Location": "https://route53.amazonaws.com/2013-04-01/hostedzone/Z0495682VQJK7N9GFOQI",
        "HostedZone": {
            "Id": "/hostedzone/Z0495682VQJK7N9GFOQI",
            "Name": "jayforweb.com.",
            "CallerReference": "Wed  8 Jul 2020 22:54:18 AEST",
            "Config": {
                "Comment": "DOA test hosted zone",
                "PrivateZone": false
            },
            "ResourceRecordSetCount": 2
        },
        "ChangeInfo": {
            "Id": "/change/C05579482YU2IUG15KA2Y",
            "Status": "PENDING",
            "SubmittedAt": "2020-07-08T12:54:43.525000+00:00"
        },
        "DelegationSet": {
            "NameServers": [
                "ns-1937.awsdns-50.co.uk",
                "ns-340.awsdns-42.com",
                "ns-525.awsdns-01.net",
                "ns-1117.awsdns-11.org"
            ]
        }
    }

```

- Command used to add any new records to the zone
```
## Create the record set

> aws route53 change-resource-record-sets \
    --hosted-zone-id Z0495682VQJK7N9GFOQI \
    --change-batch file://doa-r53-record.json

## Find out the hosted zone of the ELB
> aws elbv2 describe-load-balancers \
    --load-balancer-arns arn:aws:elasticloadbalancing:ap-southeast-2:907095435092:loadbalancer/app/doa-alb/a7bfff31e9d009b3

    {
        "LoadBalancers": [
            {
                "LoadBalancerArn": "arn:aws:elasticloadbalancing:ap-southeast-2:907095435092:loadbalancer/app/doa-alb/a7bfff31e9d009b3",
                "DNSName": "doa-alb-1952384790.ap-southeast-2.elb.amazonaws.com",
                "CanonicalHostedZoneId": "Z1GM3OXH4ZPM65",
                "CreatedTime": "2020-07-08T11:28:07.730000+00:00",
                "LoadBalancerName": "doa-alb",
                "Scheme": "internet-facing",
                "VpcId": "vpc-007774900b7f4c596",
                "State": {
                    "Code": "active"
                },
                "Type": "application",
                "AvailabilityZones": [
                    {
                        "ZoneName": "ap-southeast-2a",
                        "SubnetId": "subnet-05ba54dadeae3a83c",
                        "LoadBalancerAddresses": []
                    },
                    {
                        "ZoneName": "ap-southeast-2b",
                        "SubnetId": "subnet-068196b22d394d652",
                        "LoadBalancerAddresses": []
                    }
                ],
                "SecurityGroups": [
                    "sg-06f9585a118ad6821"
                ],
                "IpAddressType": "ipv4"
            }
        ]
    }

## Content of the doa-r53-record.json file
    {
    "Changes": [
        {
        "Action": "CREATE",
        "ResourceRecordSet": {
            "Name": "doa.jayforweb.com",
            "Type": "A",
            "AliasTarget": {
            "HostedZoneId": "Z1GM3OXH4ZPM65",
            "DNSName": "doa-alb-1952384790.ap-southeast-2.elb.amazonaws.com",
            "EvaluateTargetHealth": false
            }
        }
        }
    ]
    }

## Result of the record creation
    {
        "ChangeInfo": {
            "Id": "/change/C00424081CXEVMTANUL5W",
            "Status": "PENDING",
            "SubmittedAt": "2020-07-08T13:43:47.866000+00:00"
        }
    }

## Worked like a charm at the end :-)

➜  jay curl doa.jayforweb com
ip-192-168-103-107.ap-southeast-2.compute.internal%


```

- Post any findings, how option you decided to go with, records created, domain created, and anything else that you find interesting.
```
I used my own test domain, jayforweb.com for this task. I had to update the name servers on the domain provider as usual.
There were few challenges when doing this using AWS CLI.

1 - Needed to provide a --caller-reference for creating hosted zone. This value should be unique and the same value does not work
even if we delete the hosted zone and try again.

2 - Received below error which took a bit of time to figure out.
    An error occurred (InvalidChangeBatch) when calling the ChangeResourceRecordSets operation: [Tried to create an alias that targets doa-alb-1952384790.ap-southeast-2.elb.amazonaws.com., type A in zone Z0495682VQJK7N9GFOQI, but the alias target name does not lie within the target zone, Tried to create an alias that targets doa-alb-1952384790.ap-southeast-2.elb.amazonaws.com., type A in zone Z0495682VQJK7N9GFOQI, but that target was not found]
I was using the hosted zone ID that I created for the hosted zone ID field of the ALIAS target :-)

3 - Received the following error.
    An error occurred (InvalidChangeBatch) when calling the ChangeResourceRecordSets operation: [RRSet with DNS name doa. is not permitted in zone jayforweb.com.]
This was because I was using just doa, instead of fully qualified name.

4 - Could not create a CNAME as an ALIAS for the ELB DNS record. I had to create an A record instead. I tried to create a CNAME using console but the drop down does not provide ELB as a possible target.

```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws03](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws03/README.md)