# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:

  1. Creating an Elastic IP

     ```
     aws ec2 allocate-address --domain vpc

     response:
     {
         "PublicIp": "3.24.131.253",
         "AllocationId": "eipalloc-0d706919c827cc4d5",
         "PublicIpv4Pool": "amazon",
         "NetworkBorderGroup": "ap-southeast-2",
         "Domain": "vpc"
     }
     ```

  2. Creating a NAT gateway and assigning it to a subnet

     ```
     aws ec2 create-nat-gateway --subnet-id subnet-009508e37b719dd77 --allocation-id eipalloc-0d706919c827cc4d5

     response:
     {
         "ClientToken": "dd67659f-4759-4446-8c04-dbb9a560ac12",
         "NatGateway": {
             "CreateTime": "2020-07-01T05:07:29+00:00",
             "NatGatewayAddresses": [
                 {
                     "AllocationId": "eipalloc-0d706919c827cc4d5"
                 }
             ],
             "NatGatewayId": "nat-0b08ff466280436f1",
             "State": "pending",
             "SubnetId": "subnet-009508e37b719dd77",
             "VpcId": "vpc-0c50c0a08b2a7dc7e"
         }
     }
     ```

  3. Tagging the gateway with a name
     ```
     aws ec2 create-tags --resources nat-0b08ff466280436f1 --tags Key=Name,Value=devopsacademy-ngw
     ```

- Any extra challenges faced?
  ```
  I had no idea what an elastic IP was.
  ```

---

Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)
