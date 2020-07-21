# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
docker run -it obrientimothya/exercise02:v1

Unable to find image 'obrientimothya/exercise02:v1' locally
v1: Pulling from obrientimothya/exercise02
aad63a933944: Already exists
29ade582b51e: Already exists
7e41ad5b6f9c: Already exists
ebf61b47b4ca: Already exists
9c060bce4eae: Already exists
c659b0c7c3dd: Already exists
Digest: sha256:8e5e84b943a57045767b3c9f331f755b12d4570ff86d9ceb12fc3be6e26cb8bd
Status: Downloaded newer image for obrientimothya/exercise02:v1
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
...

docker run -it obrientimothya/exercise03:v2

Unable to find image 'obrientimothya/exercise02:v2' locally
v2: Pulling from obrientimothya/exercise02
aad63a933944: Already exists
29ade582b51e: Already exists
7e41ad5b6f9c: Already exists
ebf61b47b4ca: Already exists
9c060bce4eae: Already exists
64f976e2cad5: Already exists
Digest: sha256:bbd626711373d8c34c714d84e917ef7f684393bbe7f791391f3cc7dce45a4abf
Status: Downloaded newer image for obrientimothya/exercise02:v2
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
...
```

- A brief explanation of what happened when you executed the comands to run the containers:
```
The images were not available locally, as they were deleted in the previous exercise.
Docker then searches Docker Hub to see if it can find a reference there. Of course, the image is found on Hub, then downloaded and run.
```

- Command to list all images on your local as well as its output:
```
docker image ls

REPOSITORY                                          TAG                 IMAGE ID            CREATED             SIZE
obrientimothya/exercise02                           v2                  7adc8b0b411c        2 hours ago         107MB
obrientimothya/exercise02                           v1                  4642026763e1        2 hours ago         107MB
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)
