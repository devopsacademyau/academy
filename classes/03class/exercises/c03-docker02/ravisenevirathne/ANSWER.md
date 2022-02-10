# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output
- Curl command and its output of before changing the image:
```
% curl http://localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

% curl http://localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

```

- Curl command and its output of after changing the image:
```
% curl http://localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

% curl http://localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02 ******UPDATED*****</h1>

```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
In v1 docker image,  index.html file is copied inside the docker v1 image. So changing the index.html in the host file system will not change the output result.

In v2 we are mapping external folder from host worksation to docker using as a volume (-v).  So whenever we change the index.html file in host pc, docker will read it and output it to the browser. 

```

- Commands used to run the containers
```
% docker run -it -p 8081:80  excercise02:v1

% docker run -it -v /Users/ravi.senevirathne@contino.io/DevOps/academy/classes/03class/docker/artifacts/c03-docker02:/usr/local/apache2/htdocs/ -p 8082:80  excercise02:v2

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)