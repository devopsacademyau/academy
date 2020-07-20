# C03-Docker01

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Command to build the image:
```
docker build -t da-terraform:c03-docker-e01 .

❯ docker image ls | grep c03 | awk '{print $7}'
56.1MB
```

- Command to run the image and its output.:
```
docker run -it da-terraform:c03-docker-e01

OUTPUT

❯ docker run -it da-terraform:c03-docker-e01
Terraform v0.12.20

Your version of Terraform is out of date! The latest version
is 0.12.28. You can update by downloading from https://www.terraform.io/downloads.html
~ $
```

***
Answer for exercise [c03-docker01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker01/README.md)
