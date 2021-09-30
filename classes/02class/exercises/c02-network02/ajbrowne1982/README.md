# c02-network02

## Commands Execution Output

- Answers for `10.0.0.0/16`:

|Subnet|Network|Host Range|Usable Hosts|Broadcast|AWS Reserved|
|---|---|---|---|---|---|
|subnet-a| 10.0.0.0 | 10.0.0.1 - 10.0.63.254 | 16377 | 10.0.63.255 | 10.0.0.1 - 10.0.0.3 + 10.0.63.255
|subnet-b| 10.0.64.0 | 10.0.64.1 - 10.0.127.254 | 16377 | 10.0.127.255 | 10.0.64.1 - 10.0.64.3 + 10.0.127.255
|subnet-c| 10.0.128.0 | 10.0.128.1 - 10.0.191.254 | 16377 | 10.0.191.255 | 10.0.128.1 - 10.0.128.3 + 10.0.191.255
|subnet-d| 10.0.192.0 | 10.0.192.1 - 10.0.255.254 | 16377 | 10.0.255.255 | 10.0.192.1 - 10.0.192.3 + 10.0.255.255

- Answers for `192.168.0.0/24`:

|Subnet|Network|Host Range|Usable Hosts|Broadcast|AWS Reserved|
|---|---|---|---|---|---|
|subnet-a| 192.168.0.0/26 | 192.168.0.1 - 192.168.0.63 | 59 | 192.168.0.1 - 3 |
|subnet-b| 192.168.0.64/26 | 192.168.0.65 - 192.168.0.127 | 59 | 192.168.0.65 - 127 |
|subnet-c| 192.168.0.128/26 | 192.168.0.129 - 192.168.0.191 | 59 | 192.168.0.129 - 132 |
|subnet-d| 192.168.0.192/26 | 192.168.0.193 - 192.168.0.254 | 59 | 192.168.0.193 - 196 |

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network02](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network02/README.md)