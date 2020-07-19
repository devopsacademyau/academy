# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
VPC="vpc-09a3c6830a6d58479"
IGW="igw-09cc81bc2db5fe9a8"
NGW="nat-02376555626691b26"
PUBLIC=(subnet-0038a09635262c6ff subnet-076b647b8a2e6aea4 subnet-0a04c6cdc4cfa5702)
PRIVATE=(subnet-054b35b29f8a0b7b8 subnet-068fb406194ca4f52 subnet-017775cea63e56100)
RTPUBLIC=$(aws ec2 create-route-table --vpc-id "${VPC}" --profile tobrien | awk 'NR==1{print $3}')
RTPRIVATE=$(aws ec2 create-route-table --vpc-id "${VPC}" --profile tobrien | awk 'NR==1{print $3}')
aws ec2 create-tags --resources "$RTPUBLIC" --tags "Key=Name,Value=devopsacademy-rt-public" --profile tobrien
aws ec2 create-tags --resources "$RTPRIVATE" --tags "Key=Name,Value=devopsacademy-rt-private" --profile tobrien
```

- Commands for associating the route tables with subnets:
```
for S in $PUBLIC; do
    aws ec2 associate-route-table --route-table-id "${RTPUBLIC}" --subnet-id "${S}"  --profile tobrien
done
for S in $PRIVATE; do
    aws ec2 associate-route-table --route-table-id "${RTPRIVATE}" --subnet-id "${S}"  --profile tobrien
done

OUTPUT

rtbassoc-04ece62a2678683a8
ASSOCIATIONSTATE	associated
rtbassoc-0cf9286e983a98745
ASSOCIATIONSTATE	associated
rtbassoc-0a4c0b0a2cf87ae0e
ASSOCIATIONSTATE	associated

rtbassoc-0ddce3388d682ccf1
ASSOCIATIONSTATE	associated
rtbassoc-0c5c128380d05d77d
ASSOCIATIONSTATE	associated
rtbassoc-067fba41e5cb002e7
ASSOCIATIONSTATE	associated
```

- Commands for creating the following routes:

|route table|destination|target|
|-|-|-|
|devopsacademy-rt-public|0.0.0.0|`devopsacademy-igw`|
|devopsacademy-rt-private|0.0.0.0|`devopsacademy-ngw`|

```
aws ec2 create-route --route-table-id "${RTPUBLIC}" --gateway-id "${IGW}" --destination-cidr-block "0.0.0.0/0" --profile tobrien
aws ec2 create-route --route-table-id "${RTPRIVATE}" --gateway-id "${NGW}" --destination-cidr-block "0.0.0.0/0" --profile tobrien


OUTPUT

True

True
```

- Answer the following questions:
  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    Publicly addressable hosts can route direct to the internet via an IGW. 
    So that they know how to reach the internet, we add a catch-all route 0.0.0.0/0 pointing to the IGW.
    This tells the public hosts to traverse the IGW for all non-local/undefined (internet) destinations.
    Return traffic from the internet will, in turn, be routed back to the publicly addressable hosts by the IGW.
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
    Privately addressed hosts cannot route direct to the internet, as their addresses are private and not routable publicly.
    Routing private internet (0.0.0.0/0) traffic to a NAT gateway, allows the gateway to publicly masquerade on the internet on the private node's behalf.
    The NGW communicates publicly on the internet, then maps return addresses back to the private hosts.
    ```
    
  - What is the difference of IGW and NGW?
    ```
    NAT gateways can translate private addressing to public and vice versa, so that private nodes can communicate on the internet.
    IGW routes public addressing on the internet.
    ```
    
  - Can you delete the destination route to your VPC network? Why?
    ```
    No. The gateways need to know how to reach internal nodes. 
    If the private route was removed, the nodes would not be known to the router and traffic would not be sent to them.
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
    Nothing, it remains ready for use, but does not apply to traffic until associated to a subnet.
    ```

- Any extra challenges faced? Nil

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)
