# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
First create the IGW:
➜  jaysues aws ec2 create-internet-gateway
Then we add tags to name it:
➜  jaysues aws ec2 create-tags --resources igw-003f27538abfc25b6 --tags Key=Name,Value=DevopsAcademy-igw
We then attach the IGW  onto the VPC:
➜  jaysues aws ec2 attach-internet-gateway --internet-gateway-id igw-003f27538abfc25b6 --vpc-id vpc-01cf6494735903d97
➜  jaysues aws ec2 describe-internet-gateways
---------------------------------------------
|         DescribeInternetGateways          |
+-------------------------------------------+
||            InternetGateways             ||
|+------------------------+----------------+|
||    InternetGatewayId   |    OwnerId     ||
|+------------------------+----------------+|
||  igw-003f27538abfc25b6 |  738343455957  ||
|+------------------------+----------------+|
|||              Attachments              |||
||+------------+--------------------------+||
|||    State   |          VpcId           |||
||+------------+--------------------------+||
|||  available |  vpc-01cf6494735903d97   |||
||+------------+--------------------------+||
|||                 Tags                  |||
||+---------+-----------------------------+||
|||   Key   |            Value            |||
||+---------+-----------------------------+||
|||  Name   |  DevopsAcademy-igw          |||
||+---------+-----------------------------+||
||            InternetGateways             ||
|+------------------------+----------------+|
||    InternetGatewayId   |    OwnerId     ||
|+------------------------+----------------+|
||  igw-09de37ae93a25c498 |  738343455957  ||
|+------------------------+----------------+|
|||              Attachments              |||
||+------------+--------------------------+||
|||    State   |          VpcId           |||
||+------------+--------------------------+||
|||  available |  vpc-04220c24c443ac9b4   |||
||+------------+--------------------------+||
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)