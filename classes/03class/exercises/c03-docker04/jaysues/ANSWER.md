# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```
➜  ~ docker container ls -a
CONTAINER ID   IMAGE                          COMMAND              CREATED      STATUS      PORTS                NAMES
17b732ad1287   jaysuesdocker/make01:5d23e6b   "httpd-foreground"   2 days ago   Up 2 days   0.0.0.0:80->80/tcp   eager_elgamal
➜  ~ docker rm -f $(docker ps -a -q)
17b732ad1287
➜  ~ docker container ls -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
➜  ~
```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```
➜  ~ docker container ls -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)