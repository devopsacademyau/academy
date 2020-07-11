# C03-Docker05

## Command Execution Output
- Commands executed to run both containers:
```
> docker run -d -p 8081:80 jayforweb/teleport:exercise02v1

    Unable to find image 'jayforweb/teleport:exercise02v1' locally
    exercise02v1: Pulling from jayforweb/teleport
    aad63a933944: Pull complete
    29ade582b51e: Pull complete
    7e41ad5b6f9c: Pull complete
    ebf61b47b4ca: Pull complete
    9c060bce4eae: Pull complete
    dffa38a4bd97: Pull complete
    Digest: sha256:1dcd016893aa7f562ae2901627ac6d2a8e27248f567f46b354897174509b097f
    Status: Downloaded newer image for jayforweb/teleport:exercise02v1
    986b680f3cc097f0b380663f63a425effa50ddcec19a0e6f2772b1b01bc17c2b

> docker run -d -p 8082:80 jayforweb/teleport:exercise02v2
    Unable to find image 'jayforweb/teleport:exercise02v2' locally
    exercise02v2: Pulling from jayforweb/teleport
    aad63a933944: Already exists
    29ade582b51e: Already exists
    7e41ad5b6f9c: Already exists
    ebf61b47b4ca: Already exists
    9c060bce4eae: Already exists
    7b1191a65bc7: Pull complete
    Digest: sha256:59a5740f4268e3535b72541f4694eb7c677a1da1c3177b1ab127d2bc95ec0bcd
    Status: Downloaded newer image for jayforweb/teleport:exercise02v2
    b488ec974177747615d4f129c2c92049c1f0ee3f27e11cbefaac05d94f9243ae

## Checking the running containers
> docker ps
    CONTAINER ID        IMAGE                             COMMAND              CREATED             STATUS              PORTS                  NAMES
    b488ec974177        jayforweb/teleport:exercise02v2   "httpd-foreground"   34 seconds ago      Up 34 seconds       0.0.0.0:8082->80/tcp   frosty_buck
    986b680f3cc0        jayforweb/teleport:exercise02v1   "httpd-foreground"   3 minutes ago       Up 3 minutes        0.0.0.0:8081->80/tcp   angry_bhaskara

```

- A brief explanation of what happened when you executed the comands to run the containers:
```
When we execute docker run command
1 - Check if the image is available locally
2 - If no matching image found locally, attempt to pull the image from the default docker registry, Docker Hub
3 - If image is found in the Docker Hub registry, download it
4 - Create and run a container based on the downloaded image

```

- Command to list all images on your local as well as its output:
```
## Checking the images
> docker images
    REPOSITORY           TAG                 IMAGE ID            CREATED             SIZE
    jayforweb/teleport   exercise02v2        2a1e5faf5efb        7 hours ago         107MB
    jayforweb/teleport   exercise02v1        ab60662f25b7        10 hours ago        107MB

```

***
Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)