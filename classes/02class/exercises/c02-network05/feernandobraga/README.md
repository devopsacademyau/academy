# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:

  - creating the gateway

    ```
    aws ec2 create-internet-gateway

    response:
    {
      "InternetGateway": {
          "Attachments": [],
          "InternetGatewayId": "igw-06df7843381ed4767",
          "OwnerId": "667211700992",
          "Tags": []
      }
    }
    ```

  - tagging the gateway

    ```
    aws ec2 create-tags --resources igw-06df7843381ed4767 --tags Key=Name,Value=devopsacademy-igw
    ```

  - attaching the gateway to a VPC
    ```
    aws ec2 attach-internet-gateway --internet-gateway-id igw-06df7843381ed4767 --vpc-id vpc-0c50c0a08b2a7dc7e
    ```

* Any extra challenges faced?

---

Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)
