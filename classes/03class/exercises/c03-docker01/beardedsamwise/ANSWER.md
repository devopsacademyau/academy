# C03-Docker01

## Docker 
- [Dockerfile](https://github.com/devopsacademyau/academy/blob/beardedsamwise/c03-docker01/classes/03class/exercises/c03-docker01/beardedsamwise/dockerfile)

## Command Execution Output
- Command to build the image:
```
docker build -t da-terraform:c03-docker-e01 .
```

- Command to run the image and its output.:
```
$ docker run -it da-terraform:c03-docker-e01
Terraform v0.12.20
```

- Command to validate the size is less than 80MB its output.:
```
$ docker images
REPOSITORY     TAG              IMAGE ID       CREATED          SIZE
<none>         <none>           2353581890ae   21 minutes ago   55.8MB
da-terraform   c03-docker-e01   a3017119bdaf   21 minutes ago   55.8MB
```

***
Answer for exercise [c03-docker01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker01/README.md)