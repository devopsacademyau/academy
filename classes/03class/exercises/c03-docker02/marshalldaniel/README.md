# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output
- Curl command and its output of before changing the image:
```
curl localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>%
```

- Curl command and its output of after changing the image:
```
curl localhost:8082
<h1>testtesttest</h1>%
```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
When the v1 container is launched, it copies the file from source to itself and uses the local copy of the index file. For v2, it maps the folder containing the index file, so it will provide the file from the host each time that file is accessed.
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)