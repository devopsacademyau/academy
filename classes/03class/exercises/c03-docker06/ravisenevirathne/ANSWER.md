# C03-Docker06

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Commands used to build  the image:
```
docker build -t hello-name:v1 .
```

- Commands used to execute the image and the output of container execution:
```
ravi.senevirathne@contino.io@Ravis-MacBook-Pro ravisenevirathne % docker run -it -e foo='Ravi' hello-name:v1
Hello Ravi
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)