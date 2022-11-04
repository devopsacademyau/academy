# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output
- Curl command and its output of before changing the image:
```
curl http://localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

curl http://localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
```

- Curl command and its output of after changing the image:
```
curl http://localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

curl http://localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
<p>I have now edited this html file</p>%  
```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
Before editing the html file there was no difference.
After editing the html file, exercise02:v2 had updated with the new file.
This is because v1 has the file copied during the build process and v2 has the file map/link during execution.
```

***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)