# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```
#docker push zarajoy/devops-academy:tagname

z@bacon:~$ docker tag exercise02:v1 zarajoy/devops-academy:exercise02-v1
z@bacon:~$ docker push zarajoy/devops-academy:exercise02-v1
The push refers to repository [docker.io/zarajoy/devops-academy]
Get https://registry-1.docker.io/v2/: net/http: request canceled while waiting for connection (Client.Timeout exceeded while awaiting headers)
z@bacon:~$ docker login --username zarajoy
Password: 
WARNING! Your password will be stored unencrypted in /home/z/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
z@bacon:~$ docker push zarajoy/devops-academy:exercise02-v1
The push refers to repository [docker.io/zarajoy/devops-academy]
03548b6c8043: Pushed 
8e24b43b535f: Mounted from library/httpd 
1dfb4a5d0ecd: Mounted from library/httpd 
3313c0c04ade: Mounted from library/httpd 
310889822143: Mounted from library/httpd 
beee9f30bc1f: Mounted from library/httpd 
exercise02-v1: digest: sha256:1b62c8c0957f2e2b6a9af817ac7c3b9ad7bfa50678b19577216f111ac2ca011b size: 1569
z@bacon:~$ docker tag exercise02:v2 zarajoy/devops-academy:exercise02-v2
z@bacon:~$ docker push zarajoy/devops-academy:exercise02-v2
The push refers to repository [docker.io/zarajoy/devops-academy]
9b5d68047e77: Pushed 
8e24b43b535f: Layer already exists 
1dfb4a5d0ecd: Layer already exists 
3313c0c04ade: Layer already exists 
310889822143: Layer already exists 
beee9f30bc1f: Layer already exists 
exercise02-v2: digest: sha256:7ab11bdd0e6aa4c43afee169e45e35f48c62404575c11b693c3adcc36c1b0adf size: 1569
z@bacon:~$ 



```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)