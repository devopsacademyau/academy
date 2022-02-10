# C03-Docker06

## Docker 
- [Dockerfile](https://github.com/devopsacademyau/academy/blob/marshalldaniel/c03-docker06/classes/03class/exercises/c03-docker06/marshalldaniel/Dockerfile)

## Command Execution Output
- Commands used to build  the image:
```
docker build -t namecontainer:v1 .
```

- Commands used to execute the image and the output of container execution:
```
docker run -it -e name='Daniel' namecontainer:v1
Hello Daniel
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)