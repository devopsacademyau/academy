# c07-serverless02

## Compliance - Shutdown EC2 instances not tagged

- [_provider.tf](_provider.tf)
- [main.tf](main.tf)
- [docker-compose.yaml](docker-compose.yaml)
- [Makefile](Makefile)
- [.env](env)

> Solution might contain other files than the ones listed above.

## Instruction

export the enviroment variables:
 - export `AWS_SECRET_ACCESS_KEY=YOUR-SECRET-ACCESS-KEY`
 - export `AWS_ACCESS_KEY_ID=YOUR-ACCESS-KEY-ID`

`make plan`
 - command to initialize the terraform and docker image with aws installed and do all the resoucses plan to be created in the aws.
  
`make apply`
 - command to apply the plan you have created before

`make destroy`
 - command to destroy all the resouces created before

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c07-serverless02](https://github.com/devopsacademyau/academy/blob/b06b4cc323b9349d904562e45551c22974928952/classes/07class/exercises/c07-serverless02/README.md)
