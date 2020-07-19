

# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
```
Sorry, but i cannot remove all my images.

Commands to do so could be a prune, kill, docker rm rmi etc...
I can remove the "DA" images

danielvca/exercise02 v2 9ae39a573def 3 days ago 107MB  
danielvca/exercise02 v1 5cb648d04901 3 days ago 107MB

❯ docker rmi 9ae39a573def -f  
Untagged: danielvca/exercise02:v2  
Untagged: danielvca/exercise02@sha256:5173328eb8395bde23bc48dfa76aab8d8b54228820061632e9e99f2c2a3ab62d  
Untagged: exercise02:v2  
Deleted: sha256:9ae39a573def02896904a2a2065ea0c6fc86e69eac11f6564bc8010424628201  
Deleted: sha256:2a7409f962fb85b85dd4d482bf15c61fa78e985467925b1f7d2e33694e24e80b  
Deleted: sha256:310d172258702e2fed3289dd929e912943e770ffdeb5e83c495f0431f733d3e7
```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
```
docker ps  
CONTAINER ID IMAGE COMMAND
1f7470792f41 downercore:latest "dotnet TrainCore..."
b276eb2d2053 fabricclusterazure:latest "httpd-foreground"
7e6963a92600 boomeralambda:latest "dotnet BoomeraLambd…"
  
   /mnt/e/DevOpsAcademy/academy   on   danielvca/c03-docker04 
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)

