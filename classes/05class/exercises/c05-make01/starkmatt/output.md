## Command Execution Output

- Execution and output of the command `make build`

starkmatt git:(starkmatt/c05-make01) ✗ make build
n and output of the command `make build`
echo This image was created by Matt, based on 28b1f1e > index.html
docker build -t make01:28b1f1e . 
Sending build context to Docker daemon  5.632kB
Step 1/4 : FROM httpd:2.4.41-alpine
 ---> cb171b88ec92
Step 2/4 : COPY index.html /usr/local/apache2/htdocs/
 ---> 48c362a40a4e
Step 3/4 : CMD chmod 644 index.html
 ---> Running in d8b844512541
Removing intermediate container d8b844512541
 ---> a51f259eed2c
Step 4/4 : EXPOSE 80
 ---> Running in 4f60eeb825f3
Removing intermediate container 4f60eeb825f3
 ---> 14ebbfbaf653
Successfully built 14ebbfbaf653
Successfully tagged make01:28b1f1e

- Execution and output of the command `make push`
➜  starkmatt git:(starkmatt/c05-make01) ✗ make run
docker run -t -d make01:28b1f1e /bin/sh
bb4db9f59d79a317fe23625473319a7803618488ddf01e895c8276cad73f0

- Execution and output of the command `make run`
➜  starkmatt git:(starkmatt/c05-make01) ✗ make push
docker tag make01:28b1f1e starkmatt/make01:28b1f1e
docker push starkmatt/make01:28b1f1e
The push refers to repository [docker.io/starkmatt/make01]
7e10511ac3ed: Pushed 
b64dd1b17dce: Mounted from starkmatt/exercise02 
3924f7d08fde: Mounted from starkmatt/exercise02 
535f972b218c: Mounted from starkmatt/exercise02 
d66bb18f34c6: Mounted from starkmatt/exercise02 
5216338b40a7: Mounted from starkmatt/exercise02 
28b1f1e: digest: sha256:a07ebac9f257e8bf6a76d3c4eb1b7d8d94d48ff7dc471439f4323e6e6b11b213 size: 1569


