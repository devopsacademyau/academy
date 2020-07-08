# C03-Docker06

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output

- Commands used to build the image:

    ```bash
    $ docker build -t hello-name:v1 .
    Sending build context to Docker daemon  3.584kB
    Step 1/2 : FROM alpine:3.12
    ---> a24bb4013296
    Step 2/2 : ENTRYPOINT [ "echo", "Hello" ]
    ---> Running in 819193f44e49
    Removing intermediate container 819193f44e49
    ---> 849eed11a60d
    Successfully built 849eed11a60d
    Successfully tagged hello-name:v1
    ```

- Commands used to execute the image and the output of container execution:

    ```bash
    $ docker run hello-name:v1 Alan Lima
    Hello Alan Lima
    ```

***
Answer for exercise [c03-docker06](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker06/README.md)