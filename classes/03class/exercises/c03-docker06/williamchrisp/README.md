# C03-Docker06

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Commands used to build  the image:
```
docker build -f ./Dockerfile . -t hello-name:v1  
```

- Commands used to execute the image and the output of container execution:
```
docker run -it -e NAME="Will" hello-name:v1      
Hello Will
```

***
Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)