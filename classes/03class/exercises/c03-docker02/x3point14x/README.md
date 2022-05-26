# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output
- Curl command and its output of before changing the image:
```
# Container 1
> curl http://localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

# Container 2
> curl http://localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

```

- Curl command and its output of after changing the image:
```
❯ curl http://localhost:8081                                 
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>


❯ curl http://localhost:8082                                 
<h1>3.14159265358979238462643383279502884197169399375105820974459...</h1>

```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
The index.html file for the container running from the image I built from Dockerfile.v1 was included during the build phase. Changing the file on my own machine would not affect the file on the container.

The index.html file for the container running from the image I build from v2 was only available to the container because I mounted the folder when running the container; Therefore any changes to the files in the folder I mounted on the container would be reflected on the container.

```

***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)