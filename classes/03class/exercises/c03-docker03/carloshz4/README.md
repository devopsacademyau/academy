# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:

Log in to DockerHub
```
docker login --username=<username> -p <password>
WARNING! Using --password via the CLI is insecure. Use --password-stdin.
WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```

Tag images
```
docker tag 3f38bd842238 carloshz4/exercise02:v1
docker tag 5a445065cb2e carloshz4/exercise02:v2
```

Push to DockerHub
```
docker push carloshz4/exercise02:v1

The push refers to repository [docker.io/carloshz4/exercise02]
cf8968645e4e: Pushed
8e24b43b535f: Mounted from library/httpd
1dfb4a5d0ecd: Mounted from library/httpd
3313c0c04ade: Mounted from library/httpd
310889822143: Mounted from library/httpd
beee9f30bc1f: Mounted from library/httpd
v1: digest: sha256:780aa1a6a4db5adbbf81dbf8ac79656d7ff86c4c0ae1680b39aaf0b38f334e33 size: 1569


docker push carloshz4/exercise02:v2

The push refers to repository [docker.io/carloshz4/exercise02]
da54e9fb8730: Pushed
8e24b43b535f: Layer already exists
1dfb4a5d0ecd: Layer already exists
3313c0c04ade: Layer already exists
310889822143: Layer already exists
beee9f30bc1f: Layer already exists
v2: digest: sha256:e4fbe86cc627fd9ab47e627f3935261a429a5a375ce6d9f57fb446eb8b0f8a7e size: 1569
```


***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)
