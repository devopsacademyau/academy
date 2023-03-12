# C03-MAKE01

## Make
- [Dockerfile](Dockerfile)
- [Makefile](Makefile)

## Command Execution Output

- Execution and output of the command `make build`
```
make build

Output
    Building the Docker image.
    echo "This image has been created by mayu, based on the following SHA: aa97acd" > index.html
    docker build -t make01:aa97acd .
    [+] Building 2.8s (8/8) FINISHED                                                                                                                                                                             
    => [internal] load build definition from Dockerfile                                                                                                                                                    0.0s
    => => transferring dockerfile: 36B                                                                                                                                                                     0.0s
    => [internal] load .dockerignore                                                                                                                                                                       0.0s
    => => transferring context: 2B                                                                                                                                                                         0.0s
    => [internal] load metadata for docker.io/library/httpd:2.4.41-alpine                                                                                                                                  2.6s
    => [auth] library/httpd:pull token for registry-1.docker.io                                                                                                                                            0.0s
    => [internal] load build context                                                                                                                                                                       0.0s
    => => transferring context: 110B                                                                                                                                                                       0.0s
    => CACHED [1/2] FROM docker.io/library/httpd:2.4.41-alpine@sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed                                                                     0.0s
    => [2/2] COPY index.html /usr/local/apache2/htdocs/                                                                                                                                                    0.0s
    => exporting to image                                                                                                                                                                                  0.0s
    => => exporting layers                                                                                                                                                                                 0.0s
    => => writing image sha256:a95a1fff185eb8ef1bd72483a75617cfe67688fede4101c17fc7d384d36ea785                                                                                                            0.0s
    => => naming to docker.io/library/make01:aa97acd                                                                                                                                                       0.0s

```

- Execution and output of the command `make push`
```
make push

Output
    Tagging and pushing the image to DockerHub.
    docker tag make01:aa97acd h2breaker/make01:aa97acd
    docker push h2breaker/make01:aa97acd
    The push refers to repository [docker.io/h2breaker/make01]
    fdc948f89166: Pushed 
    da8b1af5d0b7: Mounted from h2breaker/exercise02 
    93203cf3884d: Mounted from h2breaker/exercise02 
    4d98b137a090: Mounted from h2breaker/exercise02 
    e77842cc6cf9: Mounted from h2breaker/exercise02 
    294ac687b5fc: Mounted from h2breaker/exercise02 
    aa97acd: digest: sha256:a9afae0c3678c1666277245bbe6979b72f475e5e4e98c12c40a28c3f0cecbdd9 size: 1569
```

- Execution and output of the command `make run`
```
make run

Output
    Start container on Port 80
    docker run -d -p 80:80 h2breaker/make01:aa97acd
    e8f5609dda1897a48727d3ace3b09e837fa01da11482c7b587e657cbd8670907
    Test container by:
    curl http://localhost:80
    This image has been created by mayu, based on the following SHA: aa97acd
```

***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)