# c02-network01

## Commands Execution Output

| IP (dec)           | IP (bin)                              | Subnet (dec)    | Subnet (bin)                          | RFC1918 | Hosts (*) | AWS Hosts (*) |
| -----------------: | :-----------------------------------: | --------------: | :-----------------------------------: | :------ | --------: | ------------: |
|        10.0.0.1/24 | `00001010.00000000.00000000.00000001` |   255.255.255.0 | `11111111.11111111.11111111.00000000` | Private |       254 |           251 |
|     192.168.0.1/16 | `11000000.10101000.00000000.00000001` |     255.255.0.0 | `11111111.11111111.00000000.00000000` | Private |    65,534 |        65,531 |
| 249.165.166.135/30 | `11111001.10100101.10100110.10000111` | 255.255.255.252 | `11111111.11111111.11111111.11111100` | Public  |         2 |      n/a (**) |
|   236.68.223.18/32 | `11101100.01000100.11011111.00010010` | 255.255.255.255 | `11111111.11111111.11111111.11111111` | Public  | n/a (***) |     n/a (***) | 
|      172.31.0.0/16 | `10101100.00011111.00000000.00000000` |     255.255.0.0 | `11111111.11111111.00000000.00000000` | Private |    65,534 |        65,531 |

Notes:

(*) `AWS Hosts` is the number of total addresses minus 5 (network, gateway, DNS, reserved and broadcast) that can be used in a subnet.

(**) Subnets in AWS must at most a `28` netmask which would allow `11 hosts` to be used.

(***) The subnet `/32` is not valid, this notation is used to specify a single IP address instead of a subnet.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network01](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network01/README.md)