# C03-Docker04


## Command Execution Output
- Commands executed to clean up both the images and the containers(running or exited) from your local:
    ```bash
    # Stop all runnning containers:
    $ docker stop $(docker ps -aq)
    f7c1850639ff
    6265be2158b6

    # Remove all containers:
    $ docker rm $(docker ps -aq)
    f7c1850639ff
    6265be2158b6

    # Remove all images
    $ docker rmi $(docker images -q) -f
    Untagged: alanrlima/exercise02:v1
    Untagged: alanrlima/exercise02@sha256:ccd859f61363082f53f616d4cdb41d25d19dd3f8d1e91d60278c82f29102f664
    Untagged: exercise02:v1
    Deleted: sha256:0a74d5de90abb542710bfa467e7fc9ad8de96c8d785d208d1327cb49e78f25ea
    Deleted: sha256:85bfd240ac57d7afef0a8cd34e3708e770c764e129b7b81a9c75cee63147de4e
    Untagged: da-terraform:c03-docker-01
    Untagged: da-terraform:c03-docker-e01
    Deleted: sha256:7dd5723e5bc90b8c3c304b021d7f89a2806a5f793f420a93200652c1f4751989
    Deleted: sha256:95d8dc5669494b13c6930c5dc5a80e7fe10eb1f545e19a3584b9a8e36e3080a5
    Deleted: sha256:cc1bb9d5f5675aa74d3f2a5a991e8d723f8863caf081e7562bccf09c5fb92e88
    Deleted: sha256:371ae9484a3a0b29c38cd9683c0a6df0eb60ca17373f2db594de1c9010f0a628
    Deleted: sha256:58f0a3085d4f37f5f08ba96d2b313828e00c4c69bcb55b21d272faedbe26443c
    Untagged: alpine:3.12
    Untagged: alpine:latest
    Untagged: alpine@sha256:185518070891758909c9f839cf4ca393ee977ac378609f700f60a771a2dfe321
    Deleted: sha256:a24bb4013296f61e89ba57005a7b3e52274d8edd3ae2077d04395f806b63d83e
    Deleted: sha256:50644c29ef5a27c9a40c393a73ece2479de78325cae7d762ef3cdc19bf42dd0a
    Untagged: alanrlima/exercise02:v2
    Untagged: alanrlima/exercise02@sha256:007c7d4ba3d9a1d92209d4cc545607c6b72f58ba2b104f1caf309428d770680a
    Untagged: exercise02:v2
    Untagged: httpd:2.4.41-alpine
    Untagged: httpd@sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed
    Deleted: sha256:54b0995a630527d5e8db6dfee1fedace23d145d7b916a455e0c8380db974d81c
    Deleted: sha256:7cc2d2925b2b34f2dd686affc440499fa783c4ab357be56c5c49344dbd40d5ce
    Deleted: sha256:72a14eca8a5cfa546ea7c391135969bf4a05ffa19518ff4441f66cadcc906fd9
    Deleted: sha256:09427ece5b0c3fb84f7f65b61418e9a0cf31671722149b3d4688d29a61f8c0e4
    Deleted: sha256:606838becbce6cc233c0d188ba9c137e32692aa75cedf12fda078512dfc8845c
    Deleted: sha256:beee9f30bc1f711043e78d4a2be0668955d4b761d587d6f60c2c8dc081efb203
    Error: No such image: 0a74d5de90ab
    Error: No such image: 7dd5723e5bc9
    Error: No such image: a24bb4013296
    Error: No such image: 54b0995a6305
    Error: No such image: 54b0995a6305
    ```

    - [Docker Client](https://docs.docker.com/engine/reference/commandline/system_prune/#usage) also provider the command **`docker system prune --all`** which will remove:
        - all stopped containers
        - all network not used by at lest one container
        - all build cache
        - all dangling images


- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):
    ```bash
    
    # Checking containers:
    $ docker ps
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

    # Checking images
    $ docker image ls
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    ```

***
Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)