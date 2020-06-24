# c02-network02

## Commands Execution Output
I used the link http://www.davidc.net/sites/default/subnets/subnets.html to find the subnets for below easily.
- Answers for `10.0.0.0/16`:

|Subnet|Network|Host Range|Usable Hosts|Broadcast|AWS Reserved|
|-|-|-|-|-|-|
|subnet-a|10.0.0.0/18|10.0.0.4-10.0.63.254|16379|10.0.63.255|10.0.0.0-10.0.0.3|
|subnet-b|10.0.64.0/18|10.0.64.4-10.0.127.254|16379|10.0.127.255|10.0.64.0-10.0.64.3|
|subnet-c|10.0.128.0/18|10.0.128.4-10.0.191.254|16379|10.0.191.255|10.0.128.0-10.0.128.3|
|subnet-d|10.0.192.0/18|10.0.192.4-10.0.255.254|16379|10.0.255.255|10.0.192.0-10.0.192.3|

subnet /18 has 14 host digits. Hence 2power 14 minus 5 (4 AWS Reserved + 1 Broadcast) = 16379
- Answers for `192.168.0.0/24`:

|Subnet|Network|Host Range|Usable Hosts|Broadcast|AWS Reserved|
|-|-|-|-|-|-|
|subnet-a|192.168.0.0/26|192.168.0.4-192.168.0.62|59|192.168.0.63|192.168.0.0-192.168.0.3|
|subnet-b|192.168.0.64/26|192.168.0.68-192.168.0.126|59|192.168.0.127|192.168.0.64-192.168.0.67|
|subnet-c|192.168.0.128/26|192.168.0.132-192.168.0.190|59|192.168.0.191|192.168.0.128-192.168.0.131|
|subnet-d|192.168.0.192/26|192.168.0.196-192.168.0.254|59|192.168.0.255|192.168.0.192-192.168.0.195|

subnet /26 has 6 host digits. Hence 2power 6 minus 5 (4 AWS Reserved + 1 Broadcast) = 59
<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network02](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network02/README.md)
