# c02-network01

## Commands Execution Output

- Answers for `10.0.0.1/24`:

  - IP in binary: `00001010.00000000.00000000.00000001`
  - netmask in binary: `11111111.11111111.11111111.00000000` 
  - netmask in decimals: `255.255.255.0`
  - private/public: `Private internet`
  - hosts: `254`

- Answers for `192.168.0.1/16`:

  - IP in binary: `11000000.10101000.00000000.00000001`
  - netmask in binary: `11111111.11111111.00000000.00000000` 
  - netmask in decimals: `255.255.0.0`
  - private/public: `Private`
  - hosts: `65534`

- Answers for `249.165.166.135/30`:

  - IP in binary: `11111001.10100101.10100110.10000111`
  - netmask in binary: ` 11111111.11111111.11111111.11111100` 
  - netmask in decimals: `255.255.255.252`
  - private/public: `Public`
  - hosts: `2` (not suitable for AWS as it needs in ranges of /16 & /28)

- Answers for `236.68.223.18/32`:

  - IP in binary: `11101100.01000100.11011111.00010010`
  - netmask in binary: ` 11111111.11111111.11111111.11111111` 
  - netmask in decimals: `255.255.255.255`
  - private/public: `Public`
  - hosts: `1`

- Answers for `172.31.0.0/16`:

  - IP in binary: `10101100.00011111.00000000.00000000`
  - netmask in binary: `11111111.11111111.00000000.00000000` 
  - netmask in decimals: `255.255.0.0`
  - private/public: `Private internet`
  - hosts: `65534`


Tool to assist in calculation - https://jodies.de/ipcalc?host=10.0.0.1&mask1=24&mask2=

***
Answer for exercise [c02-network01](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network01/README.md)
