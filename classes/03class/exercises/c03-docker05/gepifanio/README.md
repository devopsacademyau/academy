# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
docker run guiepifanio/exercise02:v1

Unable to find image 'guiepifanio/exercise02:v1' locally
v1: Pulling from guiepifanio/exercise02
aad63a933944: Pull complete
29ade582b51e: Pull complete
7e41ad5b6f9c: Pull complete
ebf61b47b4ca: Pull complete
9c060bce4eae: Pull complete
3be9cbb33c6f: Pull complete
Digest: sha256:1a8773da5c34898fbf2b31bcf92f9d30fe87799463f0423444b76aadabb9dd6d
Status: Downloaded newer image for guiepifanio/exercise02:v1
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[Wed Jul 15 13:49:17.506256 2020] [mpm_event:notice] [pid 1:tid 140186729925960] AH00489: Apache/2.4.41 (Unix) configured -- resuming normal operations
[Wed Jul 15 13:49:17.506318 2020] [core:notice] [pid 1:tid 140186729925960] AH00094: Command line: 'httpd -D FOREGROUND'

docker run guiepifanio/exercise02:v2

Unable to find image 'guiepifanio/exercise02:v2' locally
v2: Pulling from guiepifanio/exercise02
aad63a933944: Already exists
29ade582b51e: Already exists
7e41ad5b6f9c: Already exists
ebf61b47b4ca: Already exists
9c060bce4eae: Already exists
fa72938aec26: Pull complete
Digest: sha256:b659c7fb10f86923d4bdb59a1366b4e425eceb85b7b2ba0b8e6dad1b217a1888
Status: Downloaded newer image for guiepifanio/exercise02:v2
AH00526: Syntax error on line 265 of /usr/local/apache2/conf/httpd.conf:
DocumentRoot '/usr/local/apache2/htdocs' is not a directory, or is not readable

```

- A brief explanation of what happened when you executed the comands to run the containers:
```

When the docker run first tried to find the image locally stored, however, couldnt find so it went to my dockerhub repository and searched for the image, so it pulled the image to my local repository and after executed the image.


```

- Command to list all images on your local as well as its output:
```

docker images
REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
guiepifanio/exercise02   v2                  e0256558b30d        6 hours ago         107MB
guiepifanio/exercise02   v1                  ae3f673ae115        3 days ago          107MB

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)