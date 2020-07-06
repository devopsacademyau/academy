# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:

```bash
## Allocate IP
aws ec2 allocate-address --domain vpc

# Output
eipalloc-010a8d79c6b92cab9      vpc     ap-southeast-2  3.105.89.245    amazon

## SubnetId = subnet-08da4676baf658cb2 (10.0.1.0/24)
## allocation-id = eipalloc-010a8d79c6b92cab9
## Create NAT gateway
aws ec2 create-nat-gateway --allocation-id eipalloc-010a8d79c6b92cab9 --subnet-id subnet-08da4676baf658cb2 --tag-specifications 'ResourceType="natgateway",Tags=[{Key="Name",Value="devopsacademy-ngw"}]'

# Output
6dc3915e-46c1-4233-9c9d-3780e295691a
NATGATEWAY      2020-07-06T04:24:39+00:00       nat-0dcad8a11bc5686fa   pending subnet-08da4676baf658cb2        vpc-074c260483405f2bb
NATGATEWAYADDRESSES     eipalloc-010a8d79c6b92cab9
TAGS    Name    devopsacademy-ngw

## Release Address
# Releases the specified Elastic IP address
aws ec2 release-address --allocation-id eipalloc-010a8d79c6b92cab9
## Output
NONE

## Detele NAT gateway
aws ec2 delete-nat-gateway --nat-gateway-id nat-0dcad8a11bc5686fa

# Output
nat-0dcad8a11bc5686fa
```

- Any extra challenges faced?

> 1. Understand which `ResourceType` use on --tag-specification parameter and which I should use on it.

> 2. I've tried to use a specific address on aws ec2 allocate-address, and I got that the Address does not exist or is not avaiable. I would like to create it with an specific address.

> 3. aws ec2 release-address --public-ip 3.105.89.245. I got '`An error occurred (InvalidParameterValue) when calling the ReleaseAddress operation: You must specify an allocation id when releasing a VPC elastic IP address`'. So Always use allocation-id instead of public-ip, right?

---

Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)
