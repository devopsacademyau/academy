
# c02-network07

## Commands Execution Output

- Commands for creating the route tables:
```
aws ec2 create-route-table \
--vpc-id vpc-0c2c93451cdd28192
```

- Commands for associating the route tables with subnets:
```

aws ec2 associate-route-table  \
--subnet-id subnet-0adbc66199ac20610 \
--route-table-id rtb-0117d88753e0834e8

```

- Commands for creating the following routes:

|route table|destination|target|
|-|-|-|
|devopsacademy-rt-public|0.0.0.0|`devopsacademy-igw`|
|devopsacademy-rt-private|0.0.0.0|`devopsacademy-ngw`|

```
aws ec2 create-route \
--route-table-id rtb-0117d88753e0834e8 \
--destination-cidr-block 0.0.0.0/0 \
--gateway-id igw-0047722be38dccb86


aws ec2 create-route \
--route-table-id rtb-0114e72753a0509e5 \
--destination-cidr-block 0.0.0.0/0 \
--gateway-id nat-0dc90bf9294b8fa75
```

- Answer the following questions:
  - How did you accomplish both instructions?
    ```
    Through CLI
    ```

  - Why did you add 0.0.0.0 route to the IGW on public route table?
    ```
    This is the default route. All hosts will be able to access the internet
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?
    ```
        This is the default route. All hosts will be able to access the internet
    ```
    
  - What is the difference of IGW and NGW?
    ````
    IGW is a logical connection between an Amazon VPC and the Internet
    NAT Gateway:
    It allows resources in a private subnet to access the internet (think yum updates, external database connections, wget calls, OS patch, etc)
    It only works one way. The internet at large cannot get through your NAT to your private resources unless you explicitly allow it.
    ````
    [https://medium.com/awesome-cloud/aws-vpc-difference-between-internet-gateway-and-nat-gateway-c9177e710af6](https://medium.com/awesome-cloud/aws-vpc-difference-between-internet-gateway-and-nat-gateway-c9177e710af6)
  - Can you delete the destination route to your VPC network? Why?
    ```
    No since it`s required for the local route
    ```
    
  - What happens if you do not associate your route table with any subnets?
    ```
       The subnets will be associated with the main route table.
    ```


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network07/README.md)

> Written with [StackEdit](https://stackedit.io/).
