# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:

  - `aws ec2 create-vpc --cidr-block 192.168.0.0/16 --no-amazon-provided-ipv6-cidr-block --instance-tenancy default`
    - ## response:
      ```
      {
        "Vpc": {
        "CidrBlock": "192.168.0.0/16",
        "DhcpOptionsId": "dopt-47c7ec20",
        "State": "pending",
        "VpcId": "vpc-0c50c0a08b2a7dc7e",
        "OwnerId": "667211700992",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-00f4c6f5372c20da4",
                "CidrBlock": "192.168.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false
        }
      }
      ```

- Command for adding a name tag to it

  - `aws ec2 create-tags --resources vpc-0c50c0a08b2a7dc7e --tags Key=Name,Value=devopsacademy-vpc`

- ## Any extra challenges faced?
  ```
  To be honest, no. I think this was the least difficult AWS exercise for me. I hope it stays that way 😅
  ```

---

Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)
