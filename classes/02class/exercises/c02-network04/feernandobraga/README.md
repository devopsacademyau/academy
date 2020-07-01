# c02-network04

## Commands Execution Output

- Commands for creating the subnets:

  - Public A

    - 192.168.10.0/24
    - AZ: ap-southeast-2a
    - name: public-a

      ```
      aws ec2 create-subnet --vpc-id vpc-0c50c0a08b2a7dc7e --cidr-block 192.168.10.0/24 --availability-zone ap-southeast-2a

        response:
        {
            "Subnet": {
                "AvailabilityZone": "ap-southeast-2a",
                "AvailabilityZoneId": "apse2-az1",
                "AvailableIpAddressCount": 251,
                "CidrBlock": "192.168.10.0/24",
                "DefaultForAz": false,
                "MapPublicIpOnLaunch": false,
                "State": "available",
                "SubnetId": "subnet-059cef47dffda418b",
                "VpcId": "vpc-0c50c0a08b2a7dc7e",
                "OwnerId": "667211700992",
                "AssignIpv6AddressOnCreation": false,
                "Ipv6CidrBlockAssociationSet": [],
                "SubnetArn": "arn:aws:ec2:ap-southeast-2:667211700992:subnet/subnet-059cef47dffda418b"
            }
        }

      aws ec2 create-tags --resources subnet-059cef47dffda418b --tags Key=Name,Value=public-a
      ```

  - Private A

    - 192.168.11.0/24
    - AZ: ap-southeast-2a
    - name: private-a

      ```
      aws ec2 create-subnet --vpc-id vpc-0c50c0a08b2a7dc7e --cidr-block 192.168.11.0/24 --availability-zone ap-southeast-2a

        response:
        {
            "Subnet": {
                "AvailabilityZone": "ap-southeast-2a",
                "AvailabilityZoneId": "apse2-az1",
                "AvailableIpAddressCount": 251,
                "CidrBlock": "192.168.11.0/24",
                "DefaultForAz": false,
                "MapPublicIpOnLaunch": false,
                "State": "available",
                "SubnetId": "subnet-005ca83a5dbeb51d7",
                "VpcId": "vpc-0c50c0a08b2a7dc7e",
                "OwnerId": "667211700992",
                "AssignIpv6AddressOnCreation": false,
                "Ipv6CidrBlockAssociationSet": [],
                "SubnetArn": "arn:aws:ec2:ap-southeast-2:667211700992:subnet/subnet-005ca83a5dbeb51d7"
            }
        }

      aws ec2 create-tags --resources subnet-005ca83a5dbeb51d7 --tags Key=Name,Value=private-a
      ```

    ***

  - Public B

    - 192.168.20.0/24
    - AZ: ap-southeast-2b
    - name: public-b

      ```
      aws ec2 create-subnet --vpc-id vpc-0c50c0a08b2a7dc7e --cidr-block 192.168.20.0/24 --availability-zone ap-southeast-2b

        response:
        {
            "Subnet": {
                "AvailabilityZone": "ap-southeast-2b",
                "AvailabilityZoneId": "apse2-az3",
                "AvailableIpAddressCount": 251,
                "CidrBlock": "192.168.20.0/24",
                "DefaultForAz": false,
                "MapPublicIpOnLaunch": false,
                "State": "available",
                "SubnetId": "subnet-065dc1da939f981f6",
                "VpcId": "vpc-0c50c0a08b2a7dc7e",
                "OwnerId": "667211700992",
                "AssignIpv6AddressOnCreation": false,
                "Ipv6CidrBlockAssociationSet": [],
                "SubnetArn": "arn:aws:ec2:ap-southeast-2:667211700992:subnet/subnet-065dc1da939f981f6"
            }
        }

      aws ec2 create-tags --resources subnet-065dc1da939f981f6 --tags Key=Name,Value=public-b

      ```

  - Private B

    - 192.168.21.0/24
    - AZ: ap-southeast-2b
    - name: private-b

      ```
      aws ec2 create-subnet --vpc-id vpc-0c50c0a08b2a7dc7e --cidr-block 192.168.21.0/24 --availability-zone ap-southeast-2b

        response:
        {
            "Subnet": {
                "AvailabilityZone": "ap-southeast-2b",
                "AvailabilityZoneId": "apse2-az3",
                "AvailableIpAddressCount": 251,
                "CidrBlock": "192.168.21.0/24",
                "DefaultForAz": false,
                "MapPublicIpOnLaunch": false,
                "State": "available",
                "SubnetId": "subnet-0754f8492197090db",
                "VpcId": "vpc-0c50c0a08b2a7dc7e",
                "OwnerId": "667211700992",
                "AssignIpv6AddressOnCreation": false,
                "Ipv6CidrBlockAssociationSet": [],
                "SubnetArn": "arn:aws:ec2:ap-southeast-2:667211700992:subnet/subnet-0754f8492197090db"
            }
        }

      aws ec2 create-tags --resources subnet-0754f8492197090db --tags Key=Name,Value=private-b

      ```

    ***

  - Public C

    - 192.168.30.0/24
    - AZ: ap-southeast-2c
    - name: public-c

      ```
      aws ec2 create-subnet --vpc-id vpc-0c50c0a08b2a7dc7e --cidr-block 192.168.21.0/24 --availability-zone ap-southeast-2b

        response:
        {
            "Subnet": {
                "AvailabilityZone": "ap-southeast-2b",
                "AvailabilityZoneId": "apse2-az3",
                "AvailableIpAddressCount": 251,
                "CidrBlock": "192.168.21.0/24",
                "DefaultForAz": false,
                "MapPublicIpOnLaunch": false,
                "State": "available",
                "SubnetId": "subnet-0754f8492197090db",
                "VpcId": "vpc-0c50c0a08b2a7dc7e",
                "OwnerId": "667211700992",
                "AssignIpv6AddressOnCreation": false,
                "Ipv6CidrBlockAssociationSet": [],
                "SubnetArn": "arn:aws:ec2:ap-southeast-2:667211700992:subnet/subnet-0754f8492197090db"
            }
        }

      aws ec2 create-tags --resources subnet-0754f8492197090db --tags Key=Name,Value=private-b

      ```

  - Private C

    - 192.168.31.0/24
    - AZ: ap-southeast-2c
    - name: private-c

      ```
      aws ec2 create-subnet --vpc-id vpc-0c50c0a08b2a7dc7e --cidr-block 192.168.31.0/24 --availability-zone ap-southeast-2c

        response:
        {
            "Subnet": {
                "AvailabilityZone": "ap-southeast-2c",
                "AvailabilityZoneId": "apse2-az2",
                "AvailableIpAddressCount": 251,
                "CidrBlock": "192.168.31.0/24",
                "DefaultForAz": false,
                "MapPublicIpOnLaunch": false,
                "State": "available",
                "SubnetId": "subnet-0f7c3a73d65825d6b",
                "VpcId": "vpc-0c50c0a08b2a7dc7e",
                "OwnerId": "667211700992",
                "AssignIpv6AddressOnCreation": false,
                "Ipv6CidrBlockAssociationSet": [],
                "SubnetArn": "arn:aws:ec2:ap-southeast-2:667211700992:subnet/subnet-0f7c3a73d65825d6b"
            }
        }

      aws ec2 create-tags --resources subnet-0f7c3a73d65825d6b --tags Key=Name,Value=private-c
      ```

* Any extra challenges faced?

At this point, no.

---

Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)
