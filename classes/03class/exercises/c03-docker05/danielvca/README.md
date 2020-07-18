
# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
❯ docker run -d -p 8087:80 danielvca/exercise02:v1  
Unable to find image 'danielvca/exercise02:v1' locally  
v1: Pulling from danielvca/exercise02  
aad63a933944: Already exists  
29ade582b51e: Already exists  
7e41ad5b6f9c: Already exists  
ebf61b47b4ca: Already exists  
9c060bce4eae: Already exists  
cb4fc1ca9929: Pull complete  
Digest: sha256:e37b2133eaf73ffc341b58e57c46a0cf2376513736101e8dcfd73e663cd5ac19  
Status: Downloaded newer image for danielvca/exercise02:v1  
3e07932e9a351508ac3cc156653d22d5d7a7e8c57c549460978e518099492d84

❯ docker run -p 8089:80 -d -v /mnt/e/DevOpsAcademy/academy/classes/03class/exercies/c03-docker02/danielvca:/usr/local/apache2/htdocs danielvca/exercise02:v2  
Unable to find image 'danielvca/exercise02:v2' locally  
v2: Pulling from danielvca/exercise02  
aad63a933944: Already exists  
29ade582b51e: Already exists  
7e41ad5b6f9c: Already exists  
ebf61b47b4ca: Already exists  
9c060bce4eae: Already exists  
3f128f9e976c: Pull complete  
Digest: sha256:5173328eb8395bde23bc48dfa76aab8d8b54228820061632e9e99f2c2a3ab62d  
Status: Downloaded newer image for danielvca/exercise02:v2  
5e14e87c591902074eb2b297a514bff2a8db002151112fa4e13fa455e5fb52be

```

- A brief explanation of what happened when you executed the comands to run the containers:
```
Docker could not find the images locally, so it went to DcokerHub (which is my default registry.) to download them. 
After downloading the image, docker will execute the run command
```

- Command to list all images on your local as well as its output:
```
docker images  
REPOSITORY TAG IMAGE ID CREATED SIZE  
mcr.microsoft.com/dotnet/core/sdk 3.1 cf60f383a8d1 2 days ago 705MB  
danielvca/exercise02 v2 9ae39a573def 3 days ago 107MB  
danielvca/exercise02 v1 5cb648d04901 3 days ago 107MB


❯ docker ps  
CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES  
5e14e87c5919 danielvca/exercise02:v2 "httpd-foreground" 3 minutes ago Up 3 minutes 0.0.0.0:8089->80/tcp jovial_antonelli  
3e07932e9a35 danielvca/exercise02:v1 "httpd-foreground" 4 minutes ago Up 4 minutes 0.0.0.0:8087->80/tcp wonderful_keldysh
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)


