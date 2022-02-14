# C03-MAKE01

## Make
- [Dockerfile](https://github.com/devopsacademyau/academy/blob/marshalldaniel/c03-make01/classes/03class/exercises/c03-make01/marshalldaniel/Dockerfile)
- [Makefile](https://github.com/devopsacademyau/academy/blob/marshalldaniel/c03-make01/classes/03class/exercises/c03-make01/marshalldaniel/Makefile)

## Command Execution Output

- Execution and output of the command `make build`
```
➜  marshalldaniel git:(marshalldaniel/c03-make01) ✗ make build
Creating image.
docker build -t make01:9602ffa .
[+] Building 2.3s (8/8) FINISHED
 => [internal] load build definition from Dockerfile
 => => transferring dockerfile: 118B
 => [internal] load .dockerignore
 => => transferring context: 2B
 => [internal] load metadata for docker.io/library/httpd:2.4.41-alpine
 => [auth] library/httpd:pull token for registry-1.docker.io
 => [internal] load build context
 => => transferring context: 92B
 => [1/2] FROM docker.io/library/httpd:2.4.41-alpine@sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed
 => CACHED [2/2] ADD index.html /usr/local/apache2/htdocs/
 => exporting to image
 => => exporting layers
 => => writing image sha256:5b4095f415b0433930d4faf40ef3336b4a10c45b9f9a13bf0efc30e9a88164d7
 => => naming to docker.io/library/make01:9602ffa
```

- Execution and output of the command `make push`
```
➜  marshalldaniel git:(marshalldaniel/c03-make01) ✗ make push
Tagging and pushing image.
docker tag make01:9602ffa marshalldaniel/make01:9602ffa
docker push marshalldaniel/make01:9602ffa
The push refers to repository [docker.io/marshalldaniel/make01]
5b2bf5ac12ea: Layer already exists 
da8b1af5d0b7: Layer already exists 
93203cf3884d: Layer already exists 
4d98b137a090: Layer already exists 
e77842cc6cf9: Layer already exists 
294ac687b5fc: Layer already exists 
9602ffa: digest: sha256:d5ebc147293fefdab616e4df11a546eccf51401634342a25f6c4b45be5c29c19 size: 1569
```

- Execution and output of the command `make run`
```
Running container.
docker run -d -p 8000:80 make01:9602ffa
66217786bb9681f5bcdaca0fd9ad247817c6988ef39b9e29b9ca6bb0ca6ce5af
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)