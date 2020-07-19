# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
<<<<<<< HEAD

```
aws ec2 create-vpc --cidr-block 10.0.0.0/16 \
--tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=devopsacademy-vpc}]'
```

- Any extra challenges faced?

<!-- Don't change anything below this point-->

---

=======
```
cat <<EOF > /tmp/vpc.json
{
    "CidrBlock": "10.0.0.0/16",
    "AmazonProvidedIpv6CidrBlock": false,
    "InstanceTenancy": "default"
}
EOF
aws ec2 create-vpc --cli-input-json file:///tmp/vpc.json --output text --profile tobrien | \
awk '{print $8}' | \
xargs -I {} aws ec2 create-tags --resources {} --tags "Key=Name,Value=devopsacademy-vpc" --profile tobrien


OUTPUT

No output using this method (unless it fails).

```

- Any extra challenges faced?
No issues.

<!-- Don't change anything below this point-->
***
>>>>>>> Add solution for exercise c02-network03
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)
