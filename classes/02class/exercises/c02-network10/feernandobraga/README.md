# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

  - Creating an ENI for private-a subnet

    ```
    aws ec2 create-network-interface --subnet-id subnet-005ca83a5dbeb51d7 --description "ENI Private A" --groups sg-0812b53af0fc5725c --private-ip-address 192.168.11.4

    response:
    {
        "NetworkInterface": {
            "AvailabilityZone": "ap-southeast-2a",
            "Description": "ENI Private A",
            "Groups": [
                {
                    "GroupName": "private-sg",
                    "GroupId": "sg-0812b53af0fc5725c"
                }
            ],
            "InterfaceType": "interface",
            "Ipv6Addresses": [],
            "MacAddress": "02:8d:bf:a9:79:1e",
            "NetworkInterfaceId": "eni-0e35adb278b6b26cd",
            "OwnerId": "667211700992",
            "PrivateIpAddress": "192.168.11.4",
            "PrivateIpAddresses": [
                {
                    "Primary": true,
                    "PrivateIpAddress": "192.168.11.4"
                }
            ],
            "RequesterId": "AIDAZWWHKTMAMSSY3OHNN",
            "RequesterManaged": false,
            "SourceDestCheck": true,
            "Status": "pending",
            "SubnetId": "subnet-005ca83a5dbeb51d7",
            "TagSet": [],
            "VpcId": "vpc-0c50c0a08b2a7dc7e"
        }
    }
    ```

- Any extra challenges faced?

  I had no idea what an ENI was.

---

Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)
