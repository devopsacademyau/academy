# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
docker run -dp 8081:80 h2breaker/exercise02:v1

Output
    Unable to find image 'h2breaker/exercise02:v1' locally
    v1: Pulling from h2breaker/exercise02
    487a2743d4b1: Already exists 
    2cdbb1f551c8: Already exists 
    d4144b5354a1: Already exists 
    13de8308cf1c: Already exists 
    4a54ac95e3ee: Already exists 
    9b7777b30b27: Already exists 
    Digest: sha256:b83ecd3bcadc2816ecf56fbc50a07e59dcfae32d4d7fc750c95b7b5002ac8ce5
    Status: Downloaded newer image for h2breaker/exercise02:v2
    f22b87d03b312c8849a927a039bfb3898d3e7ff2a68dd7ccd99454aa791bc7fd
```
Check the status of container

```
docker ps
CONTAINER ID   IMAGE                     COMMAND              CREATED         STATUS         PORTS                  NAMES
f22b87d03b31   h2breaker/exercise02:v1   "httpd-foreground"   4 seconds ago   Up 3 seconds   0.0.0.0:8081->80/tcp   stupefied_euler
```
Similarly  run the second container 

```
docker run -dp 8082:80 h2breaker/exercise02:v2

Output
    Unable to find image 'h2breaker/exercise02:v2' locally
    v2: Pulling from h2breaker/exercise02
    8a0637ca1ac9: Already exists 
    2cdbb1f551c8: Already exists 
    d4144b5354a1: Already exists 
    13de8308cf1c: Already exists 
    4a54ac95e3ee: Already exists 
    9b7777b30b27: Already exists 
    Digest: sha256:b83ecd3bcadc2816ecf56fbc50a07e59dcfae32d4d7fc750c95b7b5002ac8ce5
    Status: Downloaded newer image for h2breaker/exercise02:v2
    0fa56d2d2611be112453cce84040e6e99c5b07993ebd94b86551e61165ffcaeb
```



- A brief explanation of what happened when you executed the comands to run the containers:
```
Docker first checked the image on the local server. Because docker daemon couldn't find the server locally it then searched for any image on Docker Hub. Once found Docker pulled the required image to local machine and  ran it as expected.

```

- Command to list all images on your local as well as its output:
```
docker images

Output
REPOSITORY                                                        TAG              IMAGE ID       CREATED        SIZE
817734494987.dkr.ecr.us-east-1.amazonaws.com/weatherapp-ecrrepo   latest           fbf7f2d7595e   7 hours ago    1.02GB
weatherapp-ecrrepo                                                latest           fbf7f2d7595e   7 hours ago    1.02GB
weatherapp                                                        latest           0a07e408c8f5   9 hours ago    711MB
817734494987.dkr.ecr.us-east-1.amazonaws.com/weatherapp-ecrrepo   <none>           f697a533ad34   28 hours ago   693MB
h2breaker/exercise02                                              v1               487a2743d4b1   34 hours ago   107MB
h2breaker/exercise02                                              v2               3a52233efb06   34 hours ago   107MB
da-terraform                                                      c03-docker-e01   bade9a1b61d2   35 hours ago   88.2MB

```
***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)