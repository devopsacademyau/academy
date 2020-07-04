# c02-network02

## Commands Execution Output

- Answers for `10.0.0.0/16`:

| Subnet   | Network     | Host Range            | Usable Hosts | Broadcast  | AWS Reserved                                                                        |
| -------- | ----------- | --------------------- | ------------ | ---------- | ----------------------------------------------------------------------------------- |
| subnet-a | 10.0.1.0/24 | 10.0.1.4 - 10.0.1.254 | 251          | 10.0.1.255 | 10.0.1.0 (Network), 10.0.1.1 (VPC Router), 10.0.1.2 (AWS) and 10.0.1.3 (Future use) |
| subnet-b | 10.0.2.0/24 | 10.0.2.4 - 10.0.2.254 | 251          | 10.0.2.255 | 10.0.2.0 (Network), 10.0.2.1 (VPC Router), 10.0.2.2 (AWS) and 10.0.2.3 (Future use) |
| subnet-c | 10.0.3.0/24 | 10.0.3.4 - 10.0.3.254 | 251          | 10.0.3.255 | 10.0.3.0 (Network), 10.0.3.1 (VPC Router), 10.0.3.2 (AWS) and 10.0.3.3 (Future use) |
| subnet-d | 10.0.4.0/24 | 10.0.4.4 - 10.0.4.254 | 251          | 10.0.4.255 | 10.0.4.0 (Network), 10.0.4.1 (VPC Router), 10.0.4.2 (AWS) and 10.0.4.3 (Future use) |

Talking about /16. We have network `10.0` and remaining /16 netmasks is possible create about 65536 hosts. I Belive that I will not use all this. I just want 251 hosts per subnet already excluding some IPs that are reserved in AWS CIDR.

- Answers for `192.168.0.0/24`:

| Subnet   | Network          | Host Range                    | Usable Hosts | Broadcast     | AWS Reserved                  |
| -------- | ---------------- | ----------------------------- | ------------ | ------------- | ----------------------------- |
| subnet-a | 192.168.0.0/25   | 192.168.0.4 - 192.168.0.126   | 126-5=121    | 192.168.0.127 | 192.168.0.0 - 192.168.0.3     |
| subnet-b | 192.168.0.128/26 | 192.168.0.132 - 192.168.0.190 | 62-5=57      | 192.168.0.191 | 192.168.0.128 - 192.168.0.131 |
| subnet-c | 192.168.0.192/27 | 192.168.0.195 - 192.168.0.222 | 30-5=25      | 192.168.0.223 | 192.168.0.192 - 192.168.0.194 |
| subnet-d | 192.168.0.224/27 | 192.168.0.226 - 192.168.0.254 | 30-5=25      | 192.168.0.255 | 192.168.0.224 - 192.168.0.226 |

### Resources

[[1](https://www.akadia.com/services/ip_routing_on_subnets.html)] IP Routing on Subnets.
[[2](https://awseducate.instructure.com/courses/197/pages/aws-networking-and-content-delivery-services?module_item_id=9225)] Amazon Virtual Private Cloud (VPC) - AWS re:Invent
[[3]](http://www.davidc.net/sites/default/subnets/subnets.html) Subnet Calculator

---

Answer for exercise [c02-network02](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network02/README.md)
