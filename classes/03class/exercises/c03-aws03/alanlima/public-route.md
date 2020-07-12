# c03-aws03

## Command Execution Output

- Command used to create the Route53 zone:

    - *Public Domain Name:* **alan-devops.tk**

        ```bash
        $ aws route53 create-hosted-zone \
            --name alan-devops.tk \
            --caller-reference thisIsUnique7 \
            --hosted-zone-config Comment="Public Devops site rocks"
        ```
        
        ```yaml
        ChangeInfo:
          Id: /change/C08510871ISZHV6NN5639
          Status: PENDING
          SubmittedAt: '2020-07-09T09:59:05.680000+00:00'
        DelegationSet:
          NameServers:
          - ns-120.awsdns-15.com
          - ns-1816.awsdns-35.co.uk
          - ns-516.awsdns-00.net
          - ns-1225.awsdns-25.org
        HostedZone:
          CallerReference: thisIsUnique7
          Config:
            Comment: Public Devops site rocks
            PrivateZone: false
          Id: /hostedzone/Z0196050222F6QCNUZ2I2
          Name: alan-devops.tk.
          ResourceRecordSetCount: 2
        Location: https://route53.amazonaws.com/2013-04-01/hostedzone/Z0196050222F6QCNUZ2I2
        ```
    
    ```bash
    # Modify VPC to enable DNS support
    $ aws ec2 modify-vpc-attribute --vpc-id vpc-027019faaf6756407 --enable-dns-hostnames "{\"Value\":true}"
    $ aws ec2 modify-vpc-attribute --vpc-id vpc-027019faaf6756407 --enable-dns-support "{\"Value\":true}"
    ```

- Command used to add any new records to the zone 

    ```bash
    $ aws route53 change-resource-record-sets \
        --hosted-zone-id Z0196050222F6QCNUZ2I2 \
        --change-batch file://public-route-record-set.json
    ```
    
    ```yaml
    ChangeInfo:
      Comment: Add A to Load Balancer
      Id: /change/C0901101SUX11VIQ2MG0
      Status: PENDING
      SubmittedAt: '2020-07-09T10:10:12.611000+00:00'
    ```
    
    **[public-route-record-set.json](public-route-record-set.json)**
 
    ```json
    {
        "Comment": "Add A to Load Balancer",
        "Changes": [
            {
                "Action": "UPSERT",
                "ResourceRecordSet": {
                    "Name": "alan-devops.tk",
                    "Type": "A",
                    "AliasTarget": {
                        "HostedZoneId": "Z1GM3OXH4ZPM65",
                        "DNSName": "devopsacademy-lb-1691285263.ap-southeast-2.elb.amazonaws.com",
                        "EvaluateTargetHealth": false
                    }
                    
                }
            }
        ]
    }
    ```

- Checking that it actually works..

    ```bash
    D://source on ☁️  ap-southeast-2
    ⚡ curl alan-devops.tk
    ip-172-16-10-117.ap-southeast-2.compute.internal
    
    D://source on ☁️  ap-southeast-2
    ⚡ curl alan-devops.tk
    ip-172-16-10-104.ap-southeast-2.compute.internal
    
    D://source on ☁️  ap-southeast-2
    ⚡ curl alan-devops.tk
    ip-172-16-10-104.ap-southeast-2.compute.internal
    
    D://source on ☁️  ap-southeast-2
    ⚡ curl alan-devops.tk
    ip-172-16-10-117.ap-southeast-2.compute.internal
    
    D://source on ☁️  ap-southeast-2
    ⚡ curl alan-devops.tk
    ip-172-16-10-117.ap-southeast-2.compute.internal
    
    D://source on ☁️  ap-southeast-2
    ⚡ curl alan-devops.tk
    ip-172-16-10-104.ap-southeast-2.compute.internal
    
    D://source on ☁️  ap-southeast-2
    ⚡
    ```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws03](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws03/README.md)