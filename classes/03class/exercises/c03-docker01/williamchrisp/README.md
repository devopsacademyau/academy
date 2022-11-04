# C03-Docker01

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Command to build the image:
```
docker build -t da-terraform:c03-docker-e01 .
or the following if you would like to change the version
docker build --build-arg VERSION="1.2.7" -t da-terraform:c03-docker-e01 .
```

- Command to run the image and its output.:
```
docker run -it da-terraform:c03-docker-e01   
Terraform v0.12.20

docker run -it da-terraform:c03-docker-e01  
Terraform v1.2.7
on linux_amd64
```

***
Answer for exercise [c03-docker01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker01/README.md)