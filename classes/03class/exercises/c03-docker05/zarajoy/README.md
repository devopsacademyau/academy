# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
@bacon:~$ docker login --username zarajoy
Password: 
WARNING! Your password will be stored unencrypted in /home/z/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded


z@bacon:~$ docker pull zarajoy/devops-academy:exercise02-v1
exercise02-v1: Pulling from zarajoy/devops-academy
aad63a933944: Pull complete 
29ade582b51e: Pull complete 
7e41ad5b6f9c: Pull complete 
ebf61b47b4ca: Pull complete 
9c060bce4eae: Pull complete 
bd621c6a9086: Pull complete 
Digest: sha256:1b62c8c0957f2e2b6a9af817ac7c3b9ad7bfa50678b19577216f111ac2ca011b
Status: Downloaded newer image for zarajoy/devops-academy:exercise02-v1
docker.io/zarajoy/devops-academy:exercise02-v1

z@bacon:~$ docker pull zarajoy/devops-academy:exercise02-v2
exercise02-v2: Pulling from zarajoy/devops-academy
aad63a933944: Already exists 
29ade582b51e: Already exists 
7e41ad5b6f9c: Already exists 
ebf61b47b4ca: Already exists 
9c060bce4eae: Already exists 
dc825f89dd59: Pull complete 
Digest: sha256:7ab11bdd0e6aa4c43afee169e45e35f48c62404575c11b693c3adcc36c1b0adf
Status: Downloaded newer image for zarajoy/devops-academy:exercise02-v2
docker.io/zarajoy/devops-academy:exercise02-v2

z@bacon:~$ docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

z@bacon:~$ docker image ls
REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
zarajoy/devops-academy   exercise02-v2       a7a98839daaa        46 hours ago        107MB
zarajoy/devops-academy   exercise02-v1       afa39ca8a43d        46 hours ago        107MB

z@bacon:~$ docker run -d -p 8081:80 zarajoy/devops-academy:exercise02-v1
8a53a1680eecf941cef370088cc2c573dd5a5d7f7ee32976d73f533051ea46b5
@bacon:~$ docker run -v /home/z/Documents/GitHub/academy/classes/03class/docker/artifacts/c03-docker02:/usr/local/apache2/htdocs/ -d -p 8082:80 zarajoy/devops-academy:exercise02-v2
447e81324333ca849bc4791e96cdc169add5ea1e1582e024902fa8edd5ad3f5f

z@bacon:~$ docker ps 
CONTAINER ID        IMAGE                                  COMMAND              CREATED             STATUS              PORTS                  NAMES
447e81324333        zarajoy/devops-academy:exercise02-v2   "httpd-foreground"   3 seconds ago       Up 2 seconds        0.0.0.0:8082->80/tcp   modest_bouman
8a53a1680eec        zarajoy/devops-academy:exercise02-v1   "httpd-foreground"   2 minutes ago       Up 2 minutes        0.0.0.0:8081->80/tcp   blissful_volhard

z@bacon:~$ curl http://localhost:8081
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
z@bacon:~$ curl http://localhost:8082
<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

```

- A brief explanation of what happened when you executed the comands to run the containers:
```

1. Check for local image. I did not check local if the image existed as we made sure it did not in c03-docker04. Normally a check over local images would be done first.
2. Pull the images from docker hub to local if local image does not exist.  $docker pull reponame:tagname. If  the image exists on the hub it will be downloaded.
3. Create and RUN the Containers based off the images (as per c03-docker02 in this instance)
4. PVT - check the continers and images list. (docker ps and docker image ls). In this case i also checked the images returned as expected using $curl.

```

- Command to list all images on your local as well as its output:
```
z@bacon:~$ docker image ls
REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
zarajoy/devops-academy   exercise02-v2       a7a98839daaa        46 hours ago        107MB
zarajoy/devops-academy   exercise02-v1       afa39ca8a43d        46 hours ago        107MB

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)