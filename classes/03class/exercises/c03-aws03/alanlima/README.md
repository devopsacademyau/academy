# c03-aws03

## Command Execution Output

- Command used to create the Route53 zone:

    - *Private Domain Name:* **devops.rocks**

        ```bash
        # Create Route 53 Private Zone
        $ aws route53 create-hosted-zone \
            --name devops.rocks \
            --vpc VPCRegion=ap-southeast-2,VPCId=vpc-027019faaf6756407 \
            --caller-reference k3o23s \
            --hosted-zone-config Comment="version01",PrivateZone=true
        ```
            
        ```yaml
        ChangeInfo:
          Id: /change/C03080763KC6767YIZL4E
          Status: PENDING
          SubmittedAt: '2020-07-09T09:05:42.779000+00:00'
        HostedZone:
          CallerReference: k3o23s
          Config:
            Comment: version01
            PrivateZone: true
          Id: /hostedzone/Z06064411OE8IA6HY6Q6G
          Name: devops.rocks.
          ResourceRecordSetCount: 2
        Location: https://route53.amazonaws.com/2013-04-01/hostedzone/Z06064411OE8IA6HY6Q6G
        VPC:
          VPCId: vpc-027019faaf6756407
          VPCRegion: ap-southeast-2
        ```
    
    ```bash
    # Modify VPC to enable DNS support
    $ aws ec2 modify-vpc-attribute --vpc-id vpc-027019faaf6756407 --enable-dns-hostnames "{\"Value\":true}"
    $ aws ec2 modify-vpc-attribute --vpc-id vpc-027019faaf6756407 --enable-dns-support "{\"Value\":true}"
    ```

- Command used to add any new records to the zone

    - *Sub Domain*: **c03aws03.devops.rocks**

    ```bash
    $ aws route53 change-resource-record-sets \
        --hosted-zone-id Z06064411OE8IA6HY6Q6G \
        --change-batch file://private-route-record-set.json
    ```
        
    ```yaml
    ChangeInfo:
      Comment: Add CNAME to Load Balancer
      Id: /change/C06262922CL2RPILV3PAJ
      Status: PENDING
      SubmittedAt: '2020-07-09T09:17:10.505000+00:00'
    ```
    
    **[private-route-record-set.json](private-route-record-set.json)**
    
    ```json
    {
        "Comment": "Add CNAME to Load Balancer",
        "Changes": [
            {
                "Action": "UPSERT",
                "ResourceRecordSet": {
                    "Name": "c03aws03.devops.rocks",
                    "Type": "CNAME",
                    "TTL": 600,
                    "ResourceRecords": [
                        {
                            "Value": "devopsacademy-lb-1691285263.ap-southeast-2.elb.amazonaws.com"
                        }
                    ]
                }
            }
        ]
    }
    ```
    
    * Using UPSERT because it is practical and I may need to update it anyway

- Checking that it actually works..

    ```bash
    $ ssh ec2-user@13.236.232.76
    Last login: Thu Jul  9 08:57:30 2020 from 122-148-135-233.sta.wbroadband.net.au
    
           __|  __|_  )
           _|  (     /   Amazon Linux 2 AMI
          ___|\___|___|
    
    https://aws.amazon.com/amazon-linux-2/
    [ec2-user@ip-172-16-10-104 ~]$ curl c03aws03.devops.rocks
    ip-172-16-10-117.ap-southeast-2.compute.internal
    
    [ec2-user@ip-172-16-10-104 ~]$ curl c03aws03.devops.rocks
    ip-172-16-10-117.ap-southeast-2.compute.internal
    
    [ec2-user@ip-172-16-10-104 ~]$ curl c03aws03.devops.rocks
    ip-172-16-10-104.ap-southeast-2.compute.internal
    
    [ec2-user@ip-172-16-10-104 ~]$ curl c03aws03.devops.rocks
    ip-172-16-10-104.ap-southeast-2.compute.internal
    
    [ec2-user@ip-172-16-10-104 ~]$ curl c03aws03.devops.rocks
    ip-172-16-10-117.ap-southeast-2.compute.internal
    
    [ec2-user@ip-172-16-10-104 ~]$ curl c03aws03.devops.rocks
    ip-172-16-10-117.ap-southeast-2.compute.internal
    ```

- Post any findings, how option you decided to go with, records created, domain created, and anything else that you find interesting.

    - I was going to do the public hosted zone, but it took a while until I receive the e-mail for the free domain registration. Then, I started the private, make it works, got excited, received a verification e-mail, did the public zone as well 😅
    - AWS will set the hosted zone to private when VPC is specified, even if you set PrivateZone=False. I needed to recreate the route a couple of times until I release that. The CLI didn't give any warning. 😢
    - I found the docs to update the recordset not as clear as the other docs. I could not find exactly how I should create the A record to link to the ALB. I ended up creating it on the console and listed the resources to check how it was created.
    - I would expect some small delay until the route 53 propagate the changes, but as soon as I set it, I was able to connect to my private hosted zone. Impressive 👌👌.
    - Overall, I found it quite easy to set up a private hosted zone. When I started, I thought that I would need to execute a thousand commands.
    - Forgot to set the key pair to my instances so I needed to recreate the launch configuration, ASG and update the LB register again. 🙄 *I am getting good in recreating things 🤣🤣*
    - I cannot set CNAME record with AliasTarget; the connection will be refused. But it works as expected for the standard way with TTL and string value to DNS alias.
    - There is a helpful tool to test the zone registry: `aws route53 test-dns-answer`

## Attachments

- [Answers for Public Route](public-route.md)
- [Record Set: Public Route](public-route-record-set.json)
- [Record Set: Private Route](private-route-record-set.json)

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws03](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws03/README.md)