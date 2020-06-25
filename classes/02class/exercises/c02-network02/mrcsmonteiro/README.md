# c02-network02

## Commands Execution Output

- Answers for `10.0.0.0/16`:

|Subnet|Network|Host Range|Usable Hosts|Broadcast|AWS Reserved|
|-|-|-|-|-|-|
|subnet-a|10.0.0.0/18|10.0.0.4 -> 10.0.63.254|16,379|10.0.0.0 (Network Address), 10.0.0.1 (VPC Router), 10.0.0.2 (DNS), 10.0.0.3 (AWS Future Use), 10.0.63.255 (Network Broadcast)|
|subnet-b|10.0.64.0/18|10.0.64.4 -> 10.0.127.254|16,379|10.0.64.0 (Network address), 10.0.64.1 (VPC Router), 10.0.64.2 (DNS), 10.0.64.3 (AWS Future Use), 10.0.127.255 (Network Broadcast)|
|subnet-c|10.0.128.0/18|10.0.128.4 -> 10.0.191.254|16,379|10.0.128.0 (Network address), 10.0.128.1 (VPC Router), 10.0.128.2 (DNS), 10.0.128.3 (AWS Future Use), 10.0.191.255 (Network Broadcast)|
|subnet-d|10.0.192.0/18|10.0.192.4 -> 10.0.255.254|16,379|10.0.192.0 (Network address), 10.0.192.1 (VPC Router), 10.0.192.2 (DNS), 10.0.192.3 (AWS Future Use), 10.0.255.255 (Network Broadcast)|

- Answers for `192.168.0.0/24`:

|Subnet|Network|Host Range|Usable Hosts|Broadcast|AWS Reserved|
|-|-|-|-|-|-|
|subnet-a|192.168.0.0/26|192.168.0.4 -> 192.168.0.62|59|192.168.0.0 (Network Address), 192.168.0.1 (VPC Router), 192.168.0.2 (DNS), 192.168.0.3 (AWS Future Use), 192.168.0.63 (Network Broadcast)|
|subnet-b|192.168.0.64/26|192.168.0.68 -> 192.168.0.126|59|192.168.0.64 (Network Address), 192.168.0.65 (VPC Router), 192.168.0.66 (DNS), 192.168.0.67 (AWS Future Use), 192.168.0.127 (Network Broadcast)|
|subnet-c|192.168.0.128/26|192.168.0.132 -> 192.168.0.190|59|192.168.0.128 (Network Address), 192.168.0.129 (VPC Router), 192.168.0.130 (DNS), 192.168.0.131 (AWS Future Use), 192.168.0.191 (Network Broadcast)|
|subnet-d|192.168.0.192/26|192.168.0.196 -> 192.168.0.254|59|192.168.0.192 (Network Address), 192.168.0.193 (VPC Router), 192.168.0.194 (DNS), 192.168.0.195 (AWS Future Use), 192.168.0.255 (Network Broadcast)|

***
Answer for exercise [c02-network02](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network02/README.md)
