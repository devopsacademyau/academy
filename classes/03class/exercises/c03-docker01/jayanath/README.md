# C03-Docker01

## Docker
- [Dockerfile](Dockerfile)

## Command Execution Output
- Command to build the image:
```
> docker build -t da-terraform:c03-docker-e01 .

> docker image ls da-terraform

REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
da-terraform        c03-docker-e01      12291e0cc02b        11 minutes ago      76.7MB

```

- Command to run the image and its output.:
```
➜ jayanath git:(jayanath/c03-docker01) ✗ docker run -it da-terraform:c03-docker-e01
    Terraform v0.12.28

```

***
Answer for exercise [c03-docker01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker01/README.md)