# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output

- Curl command and its output of before changing the image:
```
# exercise02:v1

❯ docker run -dp 8081:80 --name docker-ex-v1 exercise02:v1
9c967049587d8cb4c7d5601027d2b5efed01647cdaccf2423a28eaf964610809

❯ curl http://localhost:8081                                      
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>


# exercise02:v2

❯ docker run -dp 8082:80 \
  --name docker-ex-v2 \
  --mount type=bind,source="$(pwd)"/classes/03class/docker/artifacts/c03-docker02/,target=/usr/local/apache2/htdocs/ \
  exercise02:v2
  35126f280a9edf09653b980d5dcc0a50f1ab71074bfc69a222fb6ffb6ec5923c

❯ curl http://localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

```

- Curl command and its output of after changing the image:
```
❯ curl http://localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

❯ curl http://localhost:8082
<p>-- EDITED --</p>

<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
After the changes made to the file index.html, we can see that the changes are reflecting on the webserver built with the image V2 only.

It happens because the directory on the host machine is mounted into a container (v2) therefore if I make changes to the file located on the host these changes are reflected when I call the webserver v2 again.

It does not happen for the webserver built with the image v1 because the file index.html is copied into the container. Therefore, If I make changes to the original file located on the host machine, these changes are not reflected in the webserver (V1). 

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)