# c03-aws03

## Command Execution Output
- Command used to create the Route53 zone:
```
$  aws route53 create-hosted-zone \
>     --name ramiraydevopstest.com \
>     --hosted-zone-config Comment="Devops test hosted zone" \
>     --caller-reference 2020-07-19-15:10
{
    "HostedZone": {
        "ResourceRecordSetCount": 2,
        "CallerReference": "2020-07-19-15:10",
        "Config": {
            "Comment": "Devops test hosted zone",
            "PrivateZone": false
        },
        "Id": "/hostedzone/Z0106739366V4VQV7U9EG",
        "Name": "ramiraydevopstest.com."
    },
    "DelegationSet": {
        "NameServers": [
            "ns-893.awsdns-47.net",
            "ns-1605.awsdns-08.co.uk",
            "ns-283.awsdns-35.com",
            "ns-1492.awsdns-58.org"
        ]
    },
    "Location": "https://route53.amazonaws.com/2013-04-01/hostedzone/Z0106739366V4VQV7U9EG",
    "ChangeInfo": {
        "Status": "PENDING",
        "SubmittedAt": "2020-07-10T05:11:12.675Z",
        "Id": "/change/C0548840OM8LTHYSLBMG"
    }
}


```

- Command used to add any new records to the zone 
```
$  aws route53 change-resource-record-sets --hosted-zone-id Z0106739366V4VQV7U9EG --change-batch file://ramirayr53rs.json
{
    "ChangeInfo": {
        "Status": "PENDING",
        "SubmittedAt": "2020-07-10T13:14:30.719Z",
        "Id": "/change/C05406561G88HKU11Q0I8"
    }
}

ramirayr53rs.json file content: 

{
    "Changes": [
        {
            "Action": "CREATE",
            "ResourceRecordSet": {
                "Name": "web.ramiraydevopstest.com",
                "Type": "A",
                "AliasTarget": {
                    "HostedZoneId": "Z1GM3OXH4ZPM65",
                    "DNSName": "ramyadevopsalb-1247553232.ap-southeast-2.elb.amazonaws.com",
                    "EvaluateTargetHealth": false
                }
            }
        }
    ]
}


Load Balancer(created in last exercise) dns name used : ramyadevopsalb-1247553232.ap-southeast-2.elb.amazonaws.com

```

- Post any findings, how option you decided to go with, records created, domain created, and anything else that you find interesting.
```
1. I did'n't create CNAME as aws charge for it. Instead created Alias record.

2. I got the below error  :( and after number of tries figured out that I should specify AWS hostedzoneid during the recordset creation:

An error occurred (InvalidChangeBatch) when calling the ChangeResourceRecordSets operation: [Tried to create an alias that targets ramyadevopsalb-1247553232.ap-southeast-2.elb.amazonaws.com., type A in zone Z0106739366V4VQV7U9EG, but the alias target name does not lie within the target zone, Tried to create an alias that targets ramyadevopsalb-1247553232.ap-southeast-2.elb.amazonaws.com., type A in zone Z0106739366V4VQV7U9EG, but that target was not found]


```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws03](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws03/README.md)