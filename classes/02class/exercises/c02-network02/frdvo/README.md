# c02-network02

## Commands Execution Output

- Answers for `10.0.0.0/16`:

|Subnet|Network|Host Range|Usable Hosts|Broadcast|AWS Reserved|
|-|-|-|-|-|-|
| subnet-a | 10.0.0.0/18   | 10.0.0.0 - 10.0.63.255    | 10.0.0.4 - 10.0.63.254    | 10.0.63.255  | 10.0.0.1, 10.0.0.2, 10.0.0.3        |
| subnet-b | 10.0.64.0/18  | 10.0.64.0 - 10.0.127.255  | 10.0.64.4 - 10.0.127.254  | 10.0.127.255 | 10.0.64.1, 10.0.64.2, 10.0.64.3     |
| subnet-c | 10.0.128.0/18 | 10.0.128.0 - 10.0.191.255 | 10.0.128.4 - 10.0.191.254 | 10.0.191.255 | 10.0.128.1, 10.0.128.2, 10.0.128.3  |
| subnet-d | 10.0.192.0/18 | 10.0.192.0 - 10.0.255.255 | 10.0.192.4 - 10.0.255.254 | 10.0.255.255 | 10.0.192.1, 10.0.192.2, 10.0.192.3  |

Usable hosts per subnet: 16379

- Answers for `192.168.0.0/24`:

|Subnet|Network|Host Range|Usable Hosts|Broadcast|AWS Reserved|
|-|-|-|-|-|-|
|subnet-a| | | | |
|subnet-b| | | | |
|subnet-c| | | | |
|subnet-d| | | | |

Usable hosts per subnet: 16379

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network02](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network02/README.md)