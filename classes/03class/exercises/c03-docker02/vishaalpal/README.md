# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output
- Curl command and its output of before changing the image:
# Dockerfile.v1
```
curl http://localhost:8081
<!DOCTYPE html>
<html>
<head>
<title>Exercise c03-docker02</title>
</head>

<body>
Initial HTML content for c03-docker02. 
</body>

</html>%                                             
```
# Dockerfile.v2
```
curl http://localhost:8082
This is my test:02 image% 
```

- Curl command and its output of after changing the image:
# Dockerfile.v1
```
curl http://localhost:8081 
<!DOCTYPE html>
<html>
<head>
<title>Exercise c03-docker02</title>
</head>

<body>
Initial HTML content for c03-docker02. 
</body>

</html>%                                                     
```

# Dockerfile.v2
```
curl http://localhost:8082
This is my test:02 image
Adding changes
```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
The container created from Dockerfile.v1 copies the "index.html" file from the host inside the container. Changes made on the "index.html" file on the host locally will not be reflected in the container as there is a separate "index.html" file that resides in "/usr/local/apache2/htdocs/". This file must be modified within the container to reflect any changes.  

In comparison, the container created from Dockerfile.v2 attaches a filesystem to the container using the --mount option during docker run. 
As the container is referring to the local filesystem, any changes made locally will also be reflected in the container as we are modifying the same file being referenced by the container. 
Source: https://docs.docker.com/engine/reference/commandline/run/#add-bind-mounts-or-volumes-using-the---mount-flag
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)
