# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:

# CREATE ELASTIC IP

> aws ec2 allocate-address --domain vpc

     {
         "PublicIp": "54.252.134.31",
         "AllocationId": "eipalloc-0fdc3348a65a44a19",
         "PublicIpv4Pool": "amazon",
         "NetworkBorderGroup": "ap-southeast-2",
         "Domain": "vpc"
     }

# ASSOCIATE IP WITH NETWORK INTERFACE OR INSTANCE ID

> aws ec2 associate-address --network-interface-id eni-0afa47fab318b4a0a --allocation-id eipalloc-0fdc3348a65a44a19

     {
         "AssociationId": "eipassoc-0d9af7544dfb6f50c"
     }

# CREATE NAT GATEWAY BY ASSIGNING PUBLIC SUBNET TO NAT Gateway

> aws ec2 create-nat-gateway --subnet-id subnet-0ccb8adf5a16bde13 --allocation-id eipalloc-0fdc3348a65a44a19

     {
         "ClientToken": "dd7113c0-067d-450c-8164-e03a66b07afe",
         "NatGateway": {
             "CreateTime": "2020-06-26T12:05:25+00:00",
             "NatGatewayAddresses": [
                 {
                     "AllocationId": "eipalloc-0fdc3348a65a44a19"
                 }
             ],
             "NatGatewayId": "nat-07e99502bd3b011b7",
             "State": "pending",
             "SubnetId": "subnet-0ccb8adf5a16bde13",
             "VpcId": "vpc-0d4cd22a6e87c698a"
        }
     }

# NAME THE NAT GATEWAY

> aws ec2 create-tags --resources nat-07e99502bd3b011b7 --tags Key=Name,Value=devopsacademy-ngw

# VERIFY THE NAT GATEWAY DETAILS

> aws ec2 describe-nat-gateways

     {
         "NatGateways": [
             {
                 "CreateTime": "2020-06-26T12:05:25+00:00",
                 "DeleteTime": "2020-06-26T12:07:07+00:00",
                 "FailureCode": "Resource.AlreadyAssociated",
                 "FailureMessage": "Elastic IP address [eipalloc-0fdc3348a65a44a19] is already associated",
                 "NatGatewayAddresses": [
                     {
                         "AllocationId": "eipalloc-0fdc3348a65a44a19",
                         "NetworkInterfaceId": "eni-0259b3c67bb25a389",
                         "PrivateIp": "10.10.11.178"
                     }
                 ],
                 "NatGatewayId": "nat-07e99502bd3b011b7",
                 "State": "pending",
                 "SubnetId": "subnet-0ccb8adf5a16bde13",
                 "VpcId": "vpc-0d4cd22a6e87c698a",
                 "Tags": [
                    {
                         "Key": "Name",
                         "Value": "devopsacademy-ngw"
                     }
                 ]
             }
         ]
      }

> aws ec2 describe-subnets --subnet-id subnet-0ccb8adf5a16bde13

     {
         "Subnets": [
             {
                 "AvailabilityZone": "ap-southeast-2a",
                 "AvailabilityZoneId": "apse2-az1",
                 "AvailableIpAddressCount": 251,
                 "CidrBlock": "10.10.11.0/24",
                 "DefaultForAz": false,
                 "MapPublicIpOnLaunch": false,
                 "State": "available",
                 "SubnetId": "subnet-0ccb8adf5a16bde13",
                 "VpcId": "vpc-0d4cd22a6e87c698a",
                 "OwnerId": "823151257518",
                 "AssignIpv6AddressOnCreation": false,
                 "Ipv6CidrBlockAssociationSet": [],
                "Tags": [
                     {
                         "Key": "Name",
                         "Value": "public-a"
                     }
                 ],
                 "SubnetArn": "arn:aws:ec2:ap-southeast-2:823151257518:subnet/subnet-0ccb8adf5a16bde13"
             }
         ]
     }


- Any extra challenges faced?
 No Challenges

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)
