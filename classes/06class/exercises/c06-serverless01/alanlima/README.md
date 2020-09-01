# c06-serverless01

## Creating a POST API using API Gateway, Lambda and DynamoDB

- [docker-compose.yml](docker-compose.yml)
- [Makefile](Makefile)
- [output.md](output.md)

- **terraform**:
    - [_provider.tf](terraform/_provider.tf)
    - [main.tf](terraform/main.tf)
    - [outputs.tf](terraform/outputs.tf)
    - [apigw.tf](terraform/apigw.tf)
    - [iam.tf](terraform/iam.tf)
    - [variables.tf](terraform/variables.tf)
- **func_customers - lambda**:
    - [main.py](src/main.py)


## Instruction

* To quick bootstrap the infra and create a new customer use:

```bash
make kick-n-run
```
> _If fails to create a customer due to Forbidden or Internal Server Error, wait a few more minutes and try again with `make warm-up`_

* To create a new customer without need to create the JSON payload use:

```bash
make create-customer FIRST_NAME="Linus" LAST_NAME="Torvalds" EMAIL="fake@mail.com"
```

* To list the customers table content:

```bash
make list-customers
```

* To deploy the terraform code only run:

```bash
make deploy
```

> _It will pack the lambda function source code into `terraform/lambda.zip`_

* To tidy up run:

```bash
make clean
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c06-serverless01](https://github.com/devopsacademyau/academy/blob/cdbf8008dd42eacd5aa6f43f66b152e8f91d0e78/classes/06class/exercises/c06-serverless01/README.md)