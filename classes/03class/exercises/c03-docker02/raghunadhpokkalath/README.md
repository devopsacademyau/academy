# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output
- Curl command and its output of before changing the image:
```
Web Server 1 
Build Docker Images
> docker build -t exercise02:v1 -f Dockerfile.v1 .
Start the docker and map the port 80 8081
> docker run -p 8081:80  exercise02:v1

Curl command and output
> curl http://localhost:8081
This is my test:02 image%    

Web Server 2
Build Docker Images
> docker build -t exercise02:v2 -f Dockerfile.v2 .
Start the docker and map the port 80 8081

> docker run  -p 8082:80  --mount type=bind,source=/Users/raghunadhpokkalath/develop/academy/classes/03class/docker/artifacts/,target=/usr/local/apache2/htdocs/ exercise02:v2 

> docker 

Curl command and output
> curl http://localhost:8082
This is my test:02 image%    
Use Docker inspect to check if folder is mapped
> docker inspect 

            "Mounts": [
                {
                    "Type": "bind",
                    "Source": "/Users/raghunadhpokkalath/develop/academy/classes/03class/docker/artifacts/",
                    "Target": "/usr/local/apache2/htdocs/"
                }
            ],

```
- Curl command and its output of after changing the image:
```
First Web Server
> curl http://localhost:8081   
This is my test:02 image%    
Second Web Server (Updated changes reflected)
> curl http://localhost:8082
This is my test:02 image updated% 
```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
 In the first case changes made to file after building the docker image will not be available unless the image is rebuilt.

 For the second web server, the folder is mounted as a webroot directory so any changes made on local will be available to docker immediately 
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)