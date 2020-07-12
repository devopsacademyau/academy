# c03-aws03

## Command Execution Output
- Command used to create the Route53 zone:
```
>>Command to create Private hosted zone
aws route53 create-hosted-zone\
    --name pvt-zone.da\
    --vpc VPCRegion=ap-southeast-2,VPCId=vpc-081afcee350babdf5\ --caller-reference 12 JUL 2020\
    --hosted-zone-config Comment="DA-PVT ZONE",PrivateZone=true

>The command returns:
{
    "Location": "https://route53.amazonaws.com/2013-04-01/hostedzone/Z028320826FOJTFR4SOVJ",
    "HostedZone": {
        "Id": "/hostedzone/Z028320826FOJTFR4SOVJ",
        "Name": "pvt-zone.da.",
        "CallerReference": "12-07-2020",
        "Config": {
            "Comment": "DA-PVT ZONE",
            "PrivateZone": true
        },
        "ResourceRecordSetCount": 2
    },
    "ChangeInfo": {
        "Id": "/change/C0244904UBVXPVHK2EY2",
        "Status": "PENDING",
        "SubmittedAt": "2020-07-12T00:46:27.743000+00:00"
    },
    "VPC": {
        "VPCRegion": "ap-southeast-2",
        "VPCId": "vpc-081afcee350babdf5"
    }
}
```

- Command used to add any new records to the zone 
```
aws route53 change-resource-record-sets --hosted-zone-id /hostedzone/Z028320826FOJTFR4SOVJ  --change-batch file://da-record.json

>FILE: da-record.json
{
            "Comment": "CREATE a record ",
            "Changes": [{
            "Action": "CREATE",
                        "ResourceRecordSet": {
                                    "Name": "myalb.pvt-zone.da",
                                    "Type": "CNAME",
                                    "TTL": 300,
                                 "ResourceRecords": [{ "Value": "my-load-balancer-203056255.ap-southeast-2.elb.amazonaws.com"}]
}}]
}

>The command returns:
{
    "ChangeInfo": {
        "Id": "/change/C07888573JBCET5FJ32M3",
        "Status": "PENDING",
        "SubmittedAt": "2020-07-12T00:53:53.587000+00:00",
        "Comment": "CREATE a record "
    }
}

>> Command to check the change status
aws route53  get-change --id /change/C07888573JBCET5FJ32M3
{
    "ChangeInfo": {
        "Id": "/change/C012091729908YN2ESM0K",
        "Status": "INSYNC",
        "SubmittedAt": "2020-07-12T00:22:34.386000+00:00",
        "Comment": "CREATE a record "
    }
}

>> SSH into instance to check the working

ssh ec2-user@13.210.164.11 -i /home/nimmi/C01-AWS01KeyPair.pem
Last login: Sun Jul 12 00:58:21 2020 from 220.240.12.112

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
9 package(s) needed for security, out of 16 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-16-87-149 ~]$ curl my-alb.pvt-zone.da
curl: (6) Could not resolve host: my-alb.pvt-zone.da

>> Command to enable DNS support in EC2
aws ec2 modify-vpc-attribute --vpc-id vpc-081afcee350babdf5 --enable-dns-hostnames "{\"Value\":true}"

aws ec2 modify-vpc-attribute --vpc-id vpc-081afcee350babdf5 --enable-dns-support "{\"Value\":true}"

>> SSH again
Last login: Sun Jul 12 01:16:00 2020 from 220.240.12.112

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
9 package(s) needed for security, out of 16 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-16-87-149 ~]$ curl my-alb.pvt-zone.da
ip-172-16-87-149.ap-southeast-2.compute.internal
[ec2-user@ip-172-16-87-149 ~]$ curl my-alb.pvt-zone.da
ip-172-16-25-226.ap-southeast-2.compute.internal
[ec2-user@ip-172-16-87-149 ~]$ curl my-alb.pvt-zone.da
ip-172-16-87-149.ap-southeast-2.compute.internal
[ec2-user@ip-172-16-87-149 ~]$ curl my-alb.pvt-zone.da
ip-172-16-87-149.ap-southeast-2.compute.internal

Route53 DNS query resolves to our Elastic Loab Balancer successfully!!!!!


```

- Post any findings, how option you decided to go with, records created, domain created, and anything else that you find interesting.
```
After you create a hosted zone for your domain, such as example.com, you create records to tell the Domain Name System (DNS) how you want traffic to be routed for that domain.
For hosted zones, Route 53 automatically creates a default SOA record and four NS records for the zone.When the NS and SOA records are available, the status of the zone changes to INSYNC .
As per the best practice, creating an A record with an alias target as your ALB is always better than cname. 
Public hosted zone took a while as it needed a confirmation email for free domain registration. Created the below hosted zone.
aws route53 create-hosted-zone --name netizen.ga --caller-reference 2020-07-12-10:00 --hosted-zone-config Comment="DA Route53 Exercise"
If DNS support is not enabled in EC2, curl dns query will not work.

```


***
Answer for exercise [c03-aws03](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws03/README.md)
