# c02-network02

## Commands Execution Output

- Answers for `10.0.0.0/16`:

|Subnet|Network|Host Range|Usable Hosts|Broadcast|AWS Reserved|
|-|-|-|-|-|-|
|subnet-a| 10.0.0.0/18|10.0.0.1 - 10.0.63.254 |10.0.63.255 |10.0.0.1. 10.0.0.2 10.0.0.3 |
|subnet-b|10.0.64.0/18|10.0.64.1 - 10.0.127.254 |10.0.127.255 | 10.0.64.1 10.0.64.2 10.0.64.3|
|subnet-c|10.0.128.0/18| 10.0.128.1 - 10.0.191.254|10.0.191.255|10.0.128.1 10.0.128.2 10.0.128.3|
|subnet-d|10.0.192.0/18|10.0.192.1 - 10.0.255.254|10.0.255.255|10.0.192.1 10.0.192.1 10.0.192.3|

Total hosts 16384 
-first ip (0) is known as network and last ip (255) is used for broadcasting
3 hosts are reserved in AWS 
-1 is reserved to be used by the VPC Router, 1 is reserved to be used by AWS DNS and 1 is reserved for future use)
16379 hosts of 16384 can be used

- Answers for `192.168.0.0/24`:

|Subnet|Network|Host Range|Usable Hosts|Broadcast|AWS Reserved|
|-|-|-|-|-|-|
|subnet-a|192.168.0.0/26 |192.168.0.1 - 192.168.0.62 |192.168.0.63 |192.168.0.1 192.168.0.2 192.168.0.3|
|subnet-b|192.168.0.64/26 |192.168.0.65 - 192.168.0.126 |192.168.0.127 |192.168.0.65 192.168.0.66, 192.168.0.67|
|subnet-c|192.168.0.128/26 |192.168.0.129 - 192.168.0.190 |192.168.0.191 |192.168.0.129 192.168.0.130 192.168.0.131|
|subnet-d|192.168.0.192/26 |192.168.0.193 - 192.168.0.254 |192.168.0.255 |192.168.0.193 192.168.0.194 192.168.0.195|

Total hosts 64
first ip (0) is known as network and last ip (255) is used for broadcasting
3 hosts are reserved in AWS 
-1 is reserved to be used by the VPC Router, 1 is reserved to be used by AWS DNS and 1 is reserved for future use)
59 hosts of 64 can be used.

https://www.site24x7.com/tools/ipv4-subnetcalculator.html

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network02](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network02/README.md)