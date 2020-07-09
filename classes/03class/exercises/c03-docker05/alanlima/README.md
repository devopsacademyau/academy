# C03-Docker05

## Command Execution Output

- Commands executed to run both containers:
    ```bash
    # To run image exercise02:v1
    $ docker run -dp 8081:80 \
        --name devopsc0302-v1 \
        alanrlima/exercise02:v1

    Unable to find image 'alanrlima/exercise02:v1' locally
    v1: Pulling from alanrlima/exercise02
    aad63a933944: Pull complete
    29ade582b51e: Pull complete
    7e41ad5b6f9c: Pull complete
    ebf61b47b4ca: Pull complete
    9c060bce4eae: Pull complete
    54e0ce40cb77: Pull complete
    Digest: sha256:ccd859f61363082f53f616d4cdb41d25d19dd3f8d1e91d60278c82f29102f664
    Status: Downloaded newer image for alanrlima/exercise02:v1
    c5c5946c9c9b8cfe8decf036166532df043d855a3c69b8c731e41d4e8d2489a8

    # To run image exercise02:v2 with the local folder mapped
    $ docker run -dp 8082:80 \
        --name devopsc0302-v2 \
        --volume "$(pwd)"/classes/03class/docker/artifacts/c03-docker02:/usr/local/apache2/htdocs \
        alanrlima/exercise02:v2

    Unable to find image 'alanrlima/exercise02:v2' locally
    v2: Pulling from alanrlima/exercise02
    aad63a933944: Already exists
    29ade582b51e: Already exists
    7e41ad5b6f9c: Already exists
    ebf61b47b4ca: Already exists
    9c060bce4eae: Already exists
    Digest: sha256:007c7d4ba3d9a1d92209d4cc545607c6b72f58ba2b104f1caf309428d770680a
    Status: Downloaded newer image for alanrlima/exercise02:v2
    da4c98a036edea528ef0f1f7bdbe3a948dc52d80c143635eab3b7750deda3b14

    # Checking if both containers is up and running as expected
    $ echo "<b>This is an extra content</b>" >> classes/03class/docker/artifacts/c03-docker02/index.html

    $ curl localhost:8081
    <h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

    $ curl localhost:8082
    <h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
    <b>This is an extra content</b>
    ```

- A brief explanation of what happened when you executed the comands to run the containers:
    ```
    The docker client tried to find the image locally. It could not find, so it downloads from Docker Hub before running a new container for the image.
    Since both images have the same base image (httpd), some layers were reused to run the second image (v2).
    It can be noted by the number of layers pulled on v1 and on v2.
    alanrlima/exercise02:v1 has one extra layer (54e0ce40cb77) which belongs to the line which the index.html file was copied into the image.
    ```

- Command to list all images on your local as well as its output:
    ```bash
    $ docker image ls
    REPOSITORY             TAG                 IMAGE ID            CREATED             SIZE
    alanrlima/exercise02   v1                  0a74d5de90ab        19 hours ago        107MB
    alanrlima/exercise02   v2                  54b0995a6305        3 months ago        107MB
    ```

    *I found weird the created date be 3 months ago. It looks like that since there are no changes on v2 image, it picks up the created date from the base image `httpd`.*

***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)