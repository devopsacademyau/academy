# c02-network02

## Commands Execution Output

- Answers for `10.0.0.0/16`:

| Subnet | Network | Host Range | Usable Hosts | Broadcast | AWS Reserved |
| --- | --- | --- | --- | --- | --- |
| subnet-a | 10.0.0.0/24 | 10.0.0.[1-254] | 254 | 10.0.0.255 | 10.0.0.[0-3, 255] |
| subnet-b | 10.0.1.0/24 | 10.0.1.[1-254] | 254 | 10.0.1.255 | 10.0.1.[0-3, 255] |
| subnet-c | 10.0.2.0/24 | 10.0.2.[1-254] | 254 | 10.0.2.255 | 10.0.2.[0-3, 255] |
| subnet-d | 10.0.3.0/24 | 10.0.3.[1-254] | 254 | 10.0.3.255 | 10.0.3.[0-3, 255] |

- Answers for `192.168.0.0/24`:

| Subnet | Network | Host Range | Usable Hosts | Broadcast | AWS Reserved |
| --- | --- | --- | --- | --- | --- |
| subnet-a | 192.168.0.0/28 | 192.168.0.[1-14] | 14 | 192.168.0.15 | 192.168.0.[1-3, 15] |
| subnet-b | 192.168.0.16/28 | 192.168.0.[17-30] | 14 | 192.168.0.31 | 192.168.0.[17-19, 31] |
| subnet-c | 192.168.0.32/28 | 192.168.0.[33-46] | 14 | 192.168.0.47 | 192.168.0.[33-35, 47] |
| subnet-d | 192.168.0.48/28 | 192.168.0.[49-62] | 14 | 192.168.0.63 | 192.168.0.[49-51, 63] |

<!-- Don't change anything below this point-->

---

Answer for exercise [c02-network02](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network02/README.md)
