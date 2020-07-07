# C03-Docker03

## Commands

- Commands executed to push both images to DockerHub as well as the output from those commands:

    ```
    # We need to create an alias for the our image to indicate which repository the image should be pushed.
    
    $ docker tag exercise02:v1 alanrlima/exercise02:v1

    $ docker push alanrlima/exercise02:v1
    The push refers to repository [docker.io/alanrlima/exercise02]
    2e2b7120bdbe: Pushed
    8e24b43b535f: Pushed
    1dfb4a5d0ecd: Pushed
    3313c0c04ade: Pushed
    310889822143: Pushed
    beee9f30bc1f: Pushed
    v1: digest: sha256:ccd859f61363082f53f616d4cdb41d25d19dd3f8d1e91d60278c82f29102f664 size: 1569

    $ docker tag exercise02:v2 alanrlima/exercise02:v2

    $ docker push alanrlima/exercise02:v2
    The push refers to repository [docker.io/alanrlima/exercise02]
    8e24b43b535f: Layer already exists
    1dfb4a5d0ecd: Layer already exists
    3313c0c04ade: Layer already exists
    310889822143: Layer already exists
    beee9f30bc1f: Layer already exists
    v2: digest: sha256:007c7d4ba3d9a1d92209d4cc545607c6b72f58ba2b104f1caf309428d770680a size: 1362
    ```

[My Docker Hub](https://hub.docker.com/repository/docker/alanrlima/exercise02)

***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)