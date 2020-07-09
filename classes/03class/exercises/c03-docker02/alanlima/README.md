# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output
- Curl command and its output of before changing the image:
    ```
    $ curl localhost:8081
    <h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

    $ curl localhost:8082
    <h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
    ```

- Curl command and its output of after changing the image:
    ```
    $ curl localhost:8081
    <h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

    $ curl localhost:8082
    <h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

    <code>
        insert your big change here 😆
    </code>
    ```

- Explain any difference between the responses of the webservers before and after changing the file locally:
    ```
    The main difference is that I can modify the index.html file locally, and those changes will be shown on image v2.
    
    The first image (v1) is built with a copy of the `index.html` file at the building time.
    Whereas, the second image (v2) does not have the `index.html` at building time, but it is mounted at running time.
    
    Also, if I use the same docker run command with mount volume arguments on the image v1, I can replace the index.html file copied at building time.
    ```

## Docker Commands

```
# To build images
docker build -t exercise02:v1 -f classes/03class/exercises/c03-docker02/alanlima/Dockerfile.v1 .

docker build -t exercise02:v2 -f classes/03class/exercises/c03-docker02/alanlima/Dockerfile.v2 .

# To run image exercise02:v1
docker run -dp 8081:80 \
    --name devopsc0302-v1 \
    exercise02:v1

# To run image exercise02:v2 with the local folder mapped
docker run -dp 8082:80 \
    --name devopsc0302-v2 \
    --volume "$(pwd)"/classes/03class/docker/artifacts/c03-docker02:/usr/local/apache2/htdocs \
    exercise02:v2
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)