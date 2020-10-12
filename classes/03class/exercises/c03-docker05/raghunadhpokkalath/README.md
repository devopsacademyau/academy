# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
Pull the v2 and v2 docker images
Download the docker images from Docker Hub
> docker pull raghunadhp/raghusdockerrepo:exercise02v2
exercise02v2: Pulling from raghunadhp/raghusdockerrepo
aad63a933944: Pull complete 
29ade582b51e: Pull complete 
7e41ad5b6f9c: Pull complete 
ebf61b47b4ca: Pull complete 
9c060bce4eae: Pull complete 
320851e74979: Pull complete 
Digest: sha256:1d65b49567735c7c117a6968457f6b4b24a2d0a5a29b857c5f83119eeff2579a
Status: Downloaded newer image for raghunadhp/raghusdockerrepo:exercise02v2
docker.io/raghunadhp/raghusdockerrepo:exercise02v2

> docker pull raghunadhp/raghusdockerrepo:exercise02v1
exercise02v1: Pulling from raghunadhp/raghusdockerrepo
aad63a933944: Already exists 
29ade582b51e: Already exists 
7e41ad5b6f9c: Already exists 
ebf61b47b4ca: Already exists 
9c060bce4eae: Already exists 
efc1f57facc2: Pull complete 
Digest: sha256:d24833aebba57f152a651ff1a230a74ed1cfefceb6dcacd4174afa1adb9c1e61
Status: Downloaded newer image for raghunadhp/raghusdockerrepo:exercise02v1
docker.io/raghunadhp/raghusdockerrepo:exercise02v1

Run the downloaded  container v1
> docker run -p 8081:80  raghunadhp/raghusdockerrepo:exercise02v1

Verify the curl response
> curl http://localhost:8081
This is my test:02 image%

Run the downloaded  container v2

> docker run  -p 8082:80  --mount type=bind,source=/Users/raghunadhpokkalath/develop/academy/classes/03class/docker/artifacts/,target=/usr/local/apache2/htdocs/ raghunadhp/raghusdockerrepo:exercise02v1

> curl http://localhost:8082
This is my test:02 image updated% 

```

- A brief explanation of what happened when you executed the comands to run the containers:
```
Instead of rebuilding the docker image we have pulled the images from dockerhub registry and ran the run commandß
```

- Command to list all images on your local as well as its output:

```
> docker images
REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
raghunadhp/raghusdockerrepo   exercise02v2        f57b5e7386f2        18 hours ago        107MB
raghunadhp/raghusdockerrepo   exercise02v1        262a71ae5672        19 hours ago        107MB
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)