# c03-aws03

## Command Execution Output
- Command used to create the Route53 zone:
```
 1. Login to my.freenom.com and got a domain with name webdevacademy.tk

 2. Created Route53 Hosted Zone using the below command.
  > aws route53 create-hosted-zone --name webdevacademy.tk --caller-reference 2020-07-15-12:12 --hosted-zone-config Comment="webdevacademy r53"
    {
       "Location": "https://route53.amazonaws.com/2013-04-01/hostedzone/Z088299324PNZGNKK7TGW",
       "HostedZone": {
           "Id": "/hostedzone/Z088299324PNZGNKK7TGW",
           "Name": "webdevacademy.tk.",
           "CallerReference": "2020-07-15-12:12",
           "Config": {
               "Comment": "webdevacademy r53",
               "PrivateZone": false
           },
           "ResourceRecordSetCount": 2
       },
       "ChangeInfo": {
           "Id": "/change/C1037158IPCO6Z2VNNK9",
           "Status": "PENDING",
           "SubmittedAt": "2020-07-14T14:12:52.909000+00:00"
       },
       "DelegationSet": {
           "NameServers": [
               "ns-1512.awsdns-61.org",
               "ns-1642.awsdns-13.co.uk",
               "ns-244.awsdns-30.com",
               "ns-949.awsdns-54.net"
           ]
       }
   }
 3. Login to the my.freenom.com and changed the name servers to the above name server details.  
 
```

- Command used to add any new records to the zone 
```

 1. First created a json file "simpleroute53.json" with below contents - 
    > cat simpleroute53.json
	{
	  "Comment": "optional comment about the changes in this change batch request",
	  "Changes": [
	    {
	      "Action": "CREATE",
	      "ResourceRecordSet": {
	        "Name": "www.webdevacademy.tk",
	        "Type":"A",
	        "AliasTarget": {
	           "HostedZoneId": "Z1GM3OXH4ZPM65",
	           "DNSName": "devops-web-lb-1515827713.ap-southeast-2.elb.amazonaws.com",
	           "EvaluateTargetHealth": false
	         }
	      }
	    }
	  ]
	}

 2. Created the Record set with the below command - 
    > aws route53 change-resource-record-sets --hosted-zone-id Z088299324PNZGNKK7TGW  --change-batch file://simpleroute53.json
	{
	    "ChangeInfo": {
	        "Id": "/change/C07722483MSSQCJMUQ3PL",
	        "Status": "PENDING",
	        "SubmittedAt": "2020-07-14T14:49:02.836000+00:00",
	        "Comment": "optional comment about the changes in this change batch request"
	    }
	}

 3. Confirmed the Recordset creation by running below command.
    > aws route53 list-resource-record-sets --hosted-zone-id Z088299324PNZGNKK7TGW 
	{
	    "ResourceRecordSets": [
	        {
	     	    "Name": "webdevacademy.tk.",
	            "Type": "NS",
	            "TTL": 172800,
 	            "ResourceRecords": [
	                {
	                    "Value": "ns-1512.awsdns-61.org."
	                },
	                {
	                    "Value": "ns-1642.awsdns-13.co.uk."
	                },
	                {
	                    "Value": "ns-244.awsdns-30.com."
	                },
	                {
	                    "Value": "ns-949.awsdns-54.net."
	                }
	            ]
	        },
	        {
	            "Name": "webdevacademy.tk.",
	            "Type": "SOA",
	            "TTL": 900,
	            "ResourceRecords": [
	                {
 	                   "Value": "ns-1512.awsdns-61.org. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"
	                }
	            ]
	        },
	        {
	            "Name": "www.webdevacademy.tk.",
	            "Type": "A",
	            "AliasTarget": {
	                "HostedZoneId": "Z1GM3OXH4ZPM65",
	                "DNSName": "devops-web-lb-1515827713.ap-southeast-2.elb.amazonaws.com.",
	                "EvaluateTargetHealth": false
	            }
	        }
	    ]
	}
 
 4. VERIFY whether the webserver is reachable using the domain name www.webdevacademy.tk
    > curl http://www.webdevacademy.tk
      ip-10-10-1-44.ap-southeast-2.compute.internal
 
    > curl http://www.webdevacademy.tk
      ip-10-10-2-205.ap-southeast-2.compute.internal


```

- Post any findings, how option you decided to go with, records created, domain created, and anything else that you find interesting.
```

 I first created a hosted zone and recordset for a test domain using AWS console. This gave me an idea what step to follow and information is expected in AWS CLI for respective creation. But, I was struggling with the record set creation with the below error
   "An error occurred (InvalidChangeBatch) when calling the ChangeResourceRecordSets operation: [Tried to create an alias that targets devops-web-lb-1515827713.ap-southeast-2.elb.amazonaws.com., type A in zone Z088299324PNZGNKK7TGW, but the alias target name does not lie within the target zone, Tried to create an alias that targets devops-web-lb-1515827713.ap-southeast-2.elb.amazonaws.com., type A in zone Z088299324PNZGNKK7TGW, but that target was not found]"

 Then I found that there was Hosted Zone for load balancer as well which needs to be provided in the json file (and not the HostedzoneID of Hosted Zone). 
 When creating the record set using AWS console, it never asked for this information and think these information are mapped automatically when providing the LB details.
 Great Learning exercise. 
 

```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws03](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws03/README.md)
