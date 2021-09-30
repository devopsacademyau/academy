# c02-network02

## Commands Execution Output

- Answers for `10.0.0.0/16`:

|Subnet|Network|Host Range|Usable Hosts|Broadcast|AWS Reserved|
|---|---|---|---|---|---|
|subnet-a| 255.255.192.0 | 10.0.0.0/18   | 10.0.0.1 - 10.0.63.254     | 10.0.63.255  |  
|subnet-b| 255.255.192.0 | 10.0.64.0/18  | 10.0.64.1 - 10.0.127.254   | 10.0.127.255 |
|subnet-c| 255.255.192.0 | 10.0.128.0/18 | 10.0.128.1 - 10.0.191.254  | 10.191.255   |
|subnet-d| 255.255.192.0 | 10.0.192.0/18 | 10.0.192.1 - 10.0.255.254  | 10.0.255.255 |

- Answers for `192.168.0.0/24`:

|Subnet|Network|Host Range|Usable Hosts|Broadcast|AWS Reserved|
|---|---|---|---|---|---|
|subnet-a| 255.255.255.0 | 192.168.0.0/26   | 192.168.0.1 - 192.168.0.62     | 192.168.0.63  |
|subnet-b| 255.255.255.0 | 192.168.0.64/26  | 192.168.0.65 - 192.168.0.126   | 192.168.0.127 |
|subnet-c| 255.255.255.0 | 192.168.0.128/26 | 192.168.0.129 - 192.168.0.190  | 192.168.0.191 |
|subnet-d| 255.255.255.0 | 192.168.0.192/26 | 192.168.0.193 - 192..168.9.254 | 192.168.0.255 |

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network02](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network02/README.md)