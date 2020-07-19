# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
docker run -dp 8081:80 mfreitassm/devopsacademy:v1
Unable to find image 'mfreitassm/devopsacademy:v1' locally
v1: Pulling from mfreitassm/devopsacademy
aad63a933944: Pull complete 
29ade582b51e: Pull complete 
7e41ad5b6f9c: Pull complete 
ebf61b47b4ca: Pull complete 
9c060bce4eae: Pull complete 
d6dd71732fec: Pull complete 
Digest: sha256:26f917769736a9257687038ba760c2ad2cc7ecf902a9f8d72eb111ebc773f452
Status: Downloaded newer image for mfreitassm/devopsacademy:v1
780676bbe522bbdec6b4fdd1471bef37af490c6573c25750d83cb59efc5141d0

docker run -dp 8082:80 mfreitassm/devopsacademy:v2
Unable to find image 'mfreitassm/devopsacademy:v2' locally
v2: Pulling from mfreitassm/devopsacademy
aad63a933944: Already exists 
29ade582b51e: Already exists 
7e41ad5b6f9c: Already exists 
ebf61b47b4ca: Already exists 
9c060bce4eae: Already exists 
6e9b91bc1a0e: Pull complete 
Digest: sha256:0c1e6acfaab9f6216af2773f168dbb7faa498ce741886fa94bde0866baa1af4e
Status: Downloaded newer image for mfreitassm/devopsacademy:v2
620554f64e541916dd63f8fdb6c70b54887a78dfd9aa3ad964b1aa76999e91f9
docker: Error response from daemon: driver failed programming external connectivity on endpoint determined_chatelet (2e546e12d9e44bcfe5badb01a8a6a00eac704505f68bbdf2bbafa8e065be88b2): Bind for 0.0.0.0:8081 failed: port is already allocated.
docker run -dp 8082:80 mfreitassm/devopsacademy:v2
015f1fc8b78a109c8becc0e8d88a4696fe91d25773a7d7668aa0bc70e4836168
```

- A brief explanation of what happened when you executed the comands to run the containers:
```
Docker first checked the image locally and then search for any image on Docker Hub.Docker pulled it to local machine and then ran it.

```

- Command to list all images on your local as well as its output:
```
docker image ls
REPOSITORY                 TAG                 IMAGE ID            CREATED             SIZE
mfreitassm/devopsacademy   v2                  fa7b00b889e7        About an hour ago   107MB
mfreitassm/devopsacademy   v1                  61be3fbf28be        2 hours ago         107MB
```
***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)