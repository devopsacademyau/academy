# c02-network07

## Commands Execution Output

- Commands for creating the route tables:

```bash
## VPC ID = vpc-074c260483405f2bb
aws ec2 create-route-table --vpc-id vpc-074c260483405f2bb

# Output
ROUTETABLE      478433196210    rtb-0e521f95191906413   vpc-074c260483405f2bb
ROUTES  10.0.0.0/16     local   CreateRouteTable        active
```

- Commands for associating the route tables with subnets:

```
Add your commands and their outputs here
```

- Commands for creating the following routes:

| route table              | destination | target              |
| ------------------------ | ----------- | ------------------- |
| devopsacademy-rt-public  | 0.0.0.0     | `devopsacademy-igw` |
| devopsacademy-rt-private | 0.0.0.0     | `devopsacademy-ngw` |

```
Add your commands and their outputs here
```

- Answer the following questions:

  - How did you accomplish both instructions?

    ```
    Add your answer here
    ```

  - Why did you add 0.0.0.0 route to the IGW on public route table?

    ```
    Add your answer here
    ```

  - Why did you add 0.0.0.0 route to the NGW on private route table?

    ```
    Add your answer here
    ```

  - What is the difference of IGW and NGW?

    ```
    Add your answer here
    ```

  - Can you delete the destination route to your VPC network? Why?

    ```
    Add your answer here
    ```

  - What happens if you do not associate your route table with any subnets?
    ```
    Add your answer here
    ```

* Any extra challenges faced?

### Objetives

Create Custom Route Table for my VPC

### Commands

- aws ec2 create-route-table

  Creates a route table for the specified VPC.

  Obligatory arguments :

  | Parameter | Description        |
  | :-------- | :----------------- |
  | --vpc-id  | The ID of the VPC. |

- aws ec2 create-route-table

  Deletes the specified route table. You must disassociate the route ta-
  ble from any subnets before you can delete it.

  Obligatory arguments :

  | Parameter        | Description                |
  | :--------------- | :------------------------- |
  | --route-table-id | The ID of the route table. |

<!-- Don't change anything below this point-->

---

Answer for exercise [c02-network07](https://github.com/devopsacademyau/academy/blob/477b00517edd51ed2e46038ec310d324a0d3f252/classes/02class/exercises/c02-network07/README.md)
