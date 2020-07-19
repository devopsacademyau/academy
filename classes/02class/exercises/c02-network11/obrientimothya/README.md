# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
PUBLIC="subnet-0038a09635262c6ff"
SGPUB="sg-0cd45d74d97eef58c"
aws ec2 run-instances \
    --image-id ami-020d764f9372da231 \
    --instance-type t2.small \
    --subnet-id "${PUBLIC}" \
    --security-group-ids "${SGPUB}" \
    --key-name "devopsacademy-keypair" \
    --associate-public-ip-address \
    --profile tobrien

OUTPUT

437637330966	r-0b5342d5df688fe23
INSTANCES	0	x86_64		False	xen	ami-020d764f9372da231	i-02b3cd53bb605064d	t2.small	devopsacademy-keypair	2020-07-19T15:09:50+00:00	ip-10-0-1-84.ap-southeast-2.compute.internal	10.0.1.84		/dev/xvda	ebs	True		subnet-0038a09635262c6ff	hvm	vpc-09a3c6830a6d58479
CAPACITYRESERVATIONSPECIFICATION	open
CPUOPTIONS	1	1
METADATAOPTIONS	enabled	1	optional	pending
MONITORING	disabled
NETWORKINTERFACES		interface	06:ca:d1:74:c8:0a	eni-0c44c8a6aea30c68b	437637330966	10.0.1.84	Truein-use	subnet-0038a09635262c6ff	vpc-09a3c6830a6d58479
ATTACHMENT	2020-07-19T15:09:50+00:00	eni-attach-0b19ef6e8eda5ad4d	True	0	attaching
GROUPS	sg-0cd45d74d97eef58c	public-sg
PRIVATEIPADDRESSES	True	10.0.1.84
PLACEMENT	ap-southeast-2a		default
SECURITYGROUPS	sg-0cd45d74d97eef58c	public-sg
STATE	0	pending
STATEREASON	pending	pending
```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
SGPVT="sg-03ff58ddb03705ebb"
ENI="eni-0f34b7548156621a4"
aws ec2 run-instances \
    --image-id ami-020d764f9372da231 \
    --instance-type t2.small \
    --key-name "devopsacademy-keypair" \
    --network-interface '[{"DeviceIndex":0,"NetworkInterfaceId":"'$ENI'"}]' \
    --profile tobrien
aws ec2 modify-network-interface-attribute \
    --network-interface-id "${ENI}" \
    --groups "${SGPVT}" \
    --profile tobrien

OUTPUT

437637330966	r-05e7e020f94635a63
INSTANCES	0	x86_64		False	xen	ami-020d764f9372da231	i-093aa873a17862692	t2.small	devopsacademy-keypair	2020-07-19T15:22:08+00:00	ip-10-0-0-100.ap-southeast-2.compute.internal	10.0.0.100		/dev/xvda	ebs	True		subnet-054b35b29f8a0b7b8	hvm	vpc-09a3c6830a6d58479
CAPACITYRESERVATIONSPECIFICATION	open
CPUOPTIONS	1	1
METADATAOPTIONS	enabled	1	optional	pending
MONITORING	disabled
NETWORKINTERFACES		interface	06:24:ce:b6:8c:96	eni-0f34b7548156621a4	437637330966	10.0.0.100	Truein-use	subnet-054b35b29f8a0b7b8	vpc-09a3c6830a6d58479
ATTACHMENT	2020-07-19T15:22:08+00:00	eni-attach-0f7a683f66b58c52e	False	0	attaching
GROUPS	sg-09b85019578b25de6
PRIVATEIPADDRESSES	True	10.0.0.100
PLACEMENT	ap-southeast-2a		default
SECURITYGROUPS	sg-09b85019578b25de6
STATE	0	pending
STATEREASON	pending	pending
```

- Commands for accessing your public instance using ssh

```
ssh-add -K ~/.ssh/devopsacademy-keypair.pem
ssh -A ec2-user@3.25.62.85
```

- Commands for accessing your private instance from public one

```
ssh -A ec2-user@3.25.62.85
ssh ec2-user@10.0.0.100
```

- Commands for testing ping to `8.8.8.8` from private instance

```
ssh -A ec2-user@3.25.62.85
ssh ec2-user@10.0.0.100
ping 8.8.8.8

OUTPUT

[ec2-user@ip-10-0-0-100 ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=113 time=2.63 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=113 time=1.88 ms
```

- Any extra challenges faced? Nil


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)
