# c02-network01

## Commands Execution Output

- Answers for `10.0.0.1/24`:

  - IP in binary: `00001010.00000000.00000000.00000001`
  - subnet in binary: `11111111.11111111.11111111.00000000`
  - subnet in decimals: `255.255.255.0`
  - private/public: `private`
  - hosts: `254` if you include network and broadcast address `256`

- Answers for `192.168.0.1/16`:

  - IP in binary: `11000000.10101000.00000000.00000001`
  - subnet in binary: `11111111.11111111.00000000.00000000`
  - subnet in decimals: `255.255.0.0`
  - private/public: `private`
  - hosts: `65534`

- Answers for `249.165.166.135/30`:

  - IP in binary: `11111001.10100101.10100110.10000111`
  - subnet in binary: `11111111.11111111.11111111.11111100`
  - subnet in decimals: `255.255.255.252`
  - private/public: `public`
  - hosts: `2`

- Answers for `236.68.223.18/32`:

  - IP in binary: `11101100.01000100.11011111.00010010`
  - subnet in binary: `11111111.11111111.11111111.11111111`
  - subnet in decimals: `255.255.255.255`
  - private/public: `public`/`multicast`
  - hosts: `N/A`

- Answers for `172.31.0.0/16`:

  - IP in binary: `10101100.00011111.00000000.00000000`
  - subnet in binary: `11111111111111110000000000000000`
  - subnet in decimals: `255.255.0.0`
  - private/public: `private`
  - hosts: `65534`

## Discussion

- Example: `192.168.0.1/24`

IP in binary: `11000000.10101000.00000000.00000001`
subnet in binary: `11111111.11111111.11111111.00000000`
subnet in decimals: `255.255.255.0`
private/public: `private`
hosts: `251`

> I just copied this examploe from README.md. But About the hosts, Should it not be 254?

## Resource

[[1]](https://en.m.wikipedia.org/wiki/Private_network#Dedicated_space_for_carrier-grade_NAT_deployment) Private Network

[[2]](https://www.iplocation.net/subnet-calculator) Subnet Calculator

[[3]](https://www.browserling.com/tools/ip-to-bin) IP to Bin

---

Answer for exercise [c02-network01](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network01/README.md)
