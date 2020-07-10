# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:
```
## First we tag the images
> docker tag exercise02:v1 jayforweb/teleport:exercise02v1
> docker tag exercise02:v2 jayforweb/teleport:exercise02v2

## Then push it to the DockerHub
> docker push jayforweb/teleport:exercise02v1
    The push refers to repository [docker.io/jayforweb/teleport]
    540e4101f9d4: Layer already exists
    8e24b43b535f: Layer already exists
    1dfb4a5d0ecd: Layer already exists
    3313c0c04ade: Layer already exists
    310889822143: Layer already exists
    beee9f30bc1f: Layer already exists
    exercise02v1: digest: sha256:1dcd016893aa7f562ae2901627ac6d2a8e27248f567f46b354897174509b097f size: 1569

> docker push jayforweb/teleport:exercise02v2
    The push refers to repository [docker.io/jayforweb/teleport]
    1549e94eacd0: Pushed
    8e24b43b535f: Layer already exists
    1dfb4a5d0ecd: Layer already exists
    3313c0c04ade: Layer already exists
    310889822143: Layer already exists
    beee9f30bc1f: Layer already exists
    exercise02v2: digest: sha256:59a5740f4268e3535b72541f4694eb7c677a1da1c3177b1ab127d2bc95ec0bcd size: 1569

```

***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)