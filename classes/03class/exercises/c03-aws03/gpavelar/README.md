# c03-aws03

## Command Execution Output

- Command used to create the Route53 zone:

```bash
## I've created a domain
aws route53 create-hosted-zone --name whatyouneedtoday.tk --caller-reference 2014-04-01-18:47 --hosted-zone-config Comment="command-line version"

# Output
https://route53.amazonaws.com/2013-04-01/hostedzone/Z0967044QTZPG22Z4Q5R
CHANGEINFO      /change/C1008161ODPJBZXTI2MZ    PENDING 2020-07-16T03:42:25.893000+00:00
NAMESERVERS     ns-860.awsdns-43.net
NAMESERVERS     ns-267.awsdns-33.com
NAMESERVERS     ns-1209.awsdns-23.org
NAMESERVERS     ns-1781.awsdns-30.co.uk
HOSTEDZONE      2014-04-01-18:47        /hostedzone/Z0967044QTZPG22Z4Q5R        whatyouneedtoday.tk.    2
CONFIG  command-line version    False

```

- Command used to add any new records to the zone

```bash
## Second test
aws route53 change-resource-record-sets --hosted-zone-id Z0967044QTZPG22Z4Q5R --change-batch file://first-resource-record-sets.json

# Output
CHANGEINFO      Creating Alias resource record sets in Route 53 /change/C00105473W3HM4M36FR7O   PENDING 2020-07-16T05:39:18.551000+00:00
```

File used:

```json
{
  "Comment": "Creating Alias resource record sets in Route 53",
  "Changes": [
    {
      "Action": "CREATE",
      "ResourceRecordSet": {
        "Name": "one.whatyouneedtoday.tk",
        "Type": "CNAME",
        "TTL": 300,
        "ResourceRecords": [{ "Value": "my-first-load-balancer-2068798985.ap-southeast-2.elb.amazonaws.com" }]
      }
    }
  ]
}
```

- Post any findings, how option you decided to go with, records created, domain created, and anything else that you find interesting.

```
1. I've created a public domain using .tk

2. I was trying to use record using type A. It was not possible and a little bit confusing for me. Kiko Helped me to find another way and a I could make it.

3. First time, I didn't know that I should put all nameservers to .tk.

```

---

Answer for exercise [c03-aws03](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws03/README.md)
