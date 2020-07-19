# c02-network02

## Commands Execution Output

- Answers for `10.0.0.0/16`:

| Subnet | Network | Host Range | Usable Hosts | Broadcast | AWS Reserved |
| --- | --- | --- | --- | --- | --- |
| subnet-a | 10.0.0.0/18 | 10.0.[.0.0-.63.255] | 16382 | 10.0.63.255 | 10.0.0.[.0.0-3, .63.255] |
| subnet-b | 10.0.64.0/18 | 10.0.[.64.0-.127.255] | 16382 | 10.0.127.255 | 10.0.[.64.0-3, .127.255] |
| subnet-c | 10.0.128.0/18 | 10.0.[128.0-.191.255] | 16382 | 10.0.191.255 | 10.0.[.128.0-3, 191.255] |
| subnet-d | 10.0.192.0/18 | 10.0.[192.0-.255.255] | 16382 | 10.0.255.255 | 10.0.[.192.0-3, .255.255] |

- Answers for `192.168.0.0/24`:

| Subnet | Network | Host Range | Usable Hosts | Broadcast | AWS Reserved |
| --- | --- | --- | --- | --- | --- |
| subnet-a | 192.168.0.0/26 | 192.168.0.[0-63] | 62 | 192.168.0.63 | 192.168.0.[1-3, 63] |
| subnet-b | 192.168.0.64/26 | 192.168.0.[64-127] | 62 | 192.168.0.127 | 192.168.0.[65-67, 127] |
| subnet-c | 192.168.0.128/26 | 192.168.0.[128-191] | 62 | 192.168.0.191 | 192.168.0.[129-131, 191] |
| subnet-d | 192.168.0.192/26 | 192.168.0.[192-255] | 62 | 192.168.0.255 | 192.168.0.[193-195, 255] |

<!-- Don't change anything below this point-->

---

Answer for exercise [c02-network02](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network02/README.md)
