# C03-Docker03

## Commands
- Commands executed to push both images to DockerHub as well as the output from those commands:

First we need to login to the Docker Hub
```
docker login
    username = "type in username"
    password = "respective password"

Output
    Login Succeeded
    Logging in with your password grants your terminal complete access to your account. 
    For better security, log in with a limited-privilege personal access token. Learn more at https://docs.docker.com/go/access-tokens/
```
- Tag image to be pushed to Docker Hub and then push image

```
docker tag exercise02:v1 h2breaker/exercise02:v1

docker push h2breaker/exercise02:v1

Output
   The push refers to repository [docker.io/h2breaker/exercise02]
    d5c7d9d1c7c3: Pushed 
    da8b1af5d0b7: Pushed 
    93203cf3884d: Pushed 
    4d98b137a090: Pushed 
    e77842cc6cf9: Pushed 
    294ac687b5fc: Pushed 
    v1: digest: sha256:2867ef86236b3461f74f206980a3653d96d3760dcb87b2db0d59eae42c978a88 size: 1569 

Following the exact same steps to tag second image and push it to the Docker Hub

docker tag exercise02:v2 h2breaker/exercise02:v2 

docker push h2breaker/exercise02:v2 

Output
    The push refers to repository [docker.io/h2breaker/exercise02]
    99ae4ed606b2: Pushed 
    da8b1af5d0b7: Layer already exists 
    93203cf3884d: Layer already exists 
    4d98b137a090: Layer already exists 
    e77842cc6cf9: Layer already exists 
    294ac687b5fc: Layer already exists 
    v2: digest: sha256:b83ecd3bcadc2816ecf56fbc50a07e59dcfae32d4d7fc750c95b7b5002ac8ce5 size: 1569

```
***
Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)