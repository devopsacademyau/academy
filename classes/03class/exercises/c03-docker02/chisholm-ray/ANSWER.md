# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output
- Curl command and its output of before changing the image:
```
conor.chisholm-ray@contino.io@Conors-MacBook-Pro chisholm-ray % curl localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

conor.chisholm-ray@contino.io@Conors-MacBook-Pro chisholm-ray % curl localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
```

- Curl command and its output of after changing the image:
```
conor.chisholm-ray@contino.io@Conors-MacBook-Pro chisholm-ray % curl localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

conor.chisholm-ray@contino.io@Conors-MacBook-Pro chisholm-ray % curl localhost:8082
<h1>I have changed this heading!!!</h1>
```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
The big difference is the responses received from each web server. The 2nd webserver reponds with the changed index.html file as it is mounted from the host to the docker container.

The first webserver responds with the original content of index.html as that file was copied into the container at the build stage and any edits would then need the container to be rebuilt. 
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)