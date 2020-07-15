# c03-aws03

## Command Execution Output
- Command used to create the Route53 zone:
```
$ aws route53 create-hosted-zone --name testawsroute53.tk --caller-reference "Wed  15 Jul 2020"

{
    "Location": "https://route53.amazonaws.com/2013-04-01/hostedzone/Z05504993IDD1WSQ1IN45",
    "HostedZone": {
        "Id": "/hostedzone/Z05504993IDD1WSQ1IN45",
        "Name": "testawsroute53.tk.",
        "CallerReference": "Wed  15 Jul 2020",
        "Config": {
            "PrivateZone": false
        },
        "ResourceRecordSetCount": 2
    },
    "ChangeInfo": {
        "Id": "/change/C03524424XC8T6FR4QCT",
        "Status": "PENDING",
        "SubmittedAt": "2020-07-15T03:03:45.615Z"
    },
    "DelegationSet": {
        "NameServers": [
            "ns-332.awsdns-41.com",
            "ns-1051.awsdns-03.org",
            "ns-1949.awsdns-51.co.uk",
            "ns-611.awsdns-12.net"
        ]
    }
}

```

- Command used to add any new records to the zone 
```
$ aws route53 change-resource-record-sets --hosted-zone-id Z05504993IDD1WSQ1IN45 --change-batch file:///home/fer/repos/academy/classes/03class/exercises/c03-aws03/frdvo/adnslb.json
{
    "ChangeInfo": {
        "Id": "/change/C051377634BWHLXTSHWZW",
        "Status": "PENDING",
        "SubmittedAt": "2020-07-15T03:19:28.717Z",
        "Comment": "CREATE/DELETE/UPSERT a record "
    }
}

```

- Post any findings, how option you decided to go with, records created, domain created, and anything else that you find interesting.
```
- First of all, it is working!

$ curl dalb.testawsroute53.tk.
ip-172-16-130-199.ap-southeast-2.compute.internal

$ curl dalb.testawsroute53.tk.
ip-172-16-110-158.ap-southeast-2.compute.internal

$ curl dalb.testawsroute53.tk.
ip-172-16-130-199.ap-southeast-2.compute.internal

$ curl dalb.testawsroute53.tk.
ip-172-16-110-158.ap-southeast-2.compute.internal

- I choose Public because it is cool to see the DNS propagating on the real world.
- I create testawsroute53.tk on Freenon, then I created the AWS hosted zone, so I copied and pasted the DNS serves supplied on AWS CLI output on Freenon domain nameserver dashboard
- I created a CNAME pointing dalb.testawsroute53.tk to LB DA-ALB-1725974561.ap-southeast-2.elb.amazonaws.com
- It took almost 10 minutes to start to work on my computer. In this meantime, I used the Test Record Set button on AWS Route 53 Console to check if it is working.
- Creating a hosted zone was straightforward on CLI
- I found how create/modify DNS entries from AWS CLI here https://aws.amazon.com/premiumsupport/knowledge-center/simple-resource-record-route53-cli/
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws03](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws03/README.md)