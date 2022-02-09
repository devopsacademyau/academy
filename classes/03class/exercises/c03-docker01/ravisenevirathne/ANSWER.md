# C03-Docker01

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Command to build the image:
```
docker build -t da-terraform:c03-docker-e01 .
```

- Command to run the image and its output.:
```
ravi.senevirathne@contino.io@Ravis-MacBook-Pro ravisenevirathne % docker run -it da-terraform:c03-docker-e01
Terraform v0.12.20

Your version of Terraform is out of date! The latest version
is 1.1.5. You can update by downloading from https://www.terraform.io/downloads.html

ravi.senevirathne@contino.io@Ravis-MacBook-Pro ravisenevirathne % docker images                             
REPOSITORY     TAG              IMAGE ID       CREATED          SIZE
da-terraform   c03-docker-e01   fa1aa6714ac2   18 minutes ago   55.8MB

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker01/README.md)