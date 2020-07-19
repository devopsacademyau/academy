# C03-Docker03

## Commands

- Commands executed to push both images to DockerHub as well as the output from those commands:

  ```
  docker login

  Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
  Login Succeeded

  //tagging the containers
  docker tag exercise02:v1 fernandobraga/exercise02:v1
  docker tag exercise02:v2 fernandobraga/exercise02:v2

  //pushing to dockerhub
  docker push fernandobraga/exercise02:v1

  The push refers to repository [docker.io/fernandobraga/exercise02]
  e58ff782ed9d: Pushed
  8e24b43b535f: Mounted from library/httpd
  1dfb4a5d0ecd: Mounted from library/httpd
  3313c0c04ade: Mounted from library/httpd
  310889822143: Mounted from library/httpd
  beee9f30bc1f: Mounted from library/httpd
  v1: digest: sha256:88d03ea553aa346946335e61e1cf20f1612bcb28dbddd53a15926cd87f2ee522 size: 1569

  docker push fernandobraga/exercise02:v2

  The push refers to repository [docker.io/fernandobraga/exercise02]
  3dddf403e3a2: Pushed
  8e24b43b535f: Layer already exists
  1dfb4a5d0ecd: Layer already exists
  3313c0c04ade: Layer already exists
  310889822143: Layer already exists
  beee9f30bc1f: Layer already exists
  v2: digest: sha256:0eefc00c3a238aaa1212a1da47efdf4834cf6933ef08aa17ab796adf10355fd6 size: 1569
  ```

---

Answer for exercise [c03-docker03](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker03/README.md)
