# C03-MAKE01

## Make

- [Dockerfile](Dockerfile)
- [Makefile](Makefile)

## Command Execution Output

- Execution and output of the command `make build`

  ```
  make build

  docker build -t make01:0c3d2e6 .
  Sending build context to Docker daemon  5.632kB
  Step 1/3 : FROM httpd:2.4.41-alpine
  ---> 54b0995a6305
  Step 2/3 : RUN rm -rf /usr/local/apache2/htdocs/
  ---> Using cache
  ---> f8ad9df49178
  Step 3/3 : COPY index.html /usr/local/apache2/htdocs/
  ---> 16de7b7340f0
  Successfully built 16de7b7340f0
  Successfully tagged make01:0c3d2e6
  ```

- Execution and output of the command `make push`

  ```
  make push

  docker tag make01:0c3d2e6 fernandobraga/make01:0c3d2e6
  docker push fernandobraga/make01:0c3d2e6
  The push refers to repository [docker.io/fernandobraga/make01]
  d83d46d0503b: Pushed
  8e24b43b535f: Mounted from fernandobraga/exercise02
  1dfb4a5d0ecd: Mounted from fernandobraga/exercise02
  3313c0c04ade: Mounted from fernandobraga/exercise02
  310889822143: Mounted from fernandobraga/exercise02
  beee9f30bc1f: Mounted from fernandobraga/exercise02
  0c3d2e6: digest: sha256:83f4160f13fd19e0a76f2c15d1d1d98e52b059aea6ed023a44dd691268d220ba size: 1569
  ```

- Execution and output of the command `make run`

  ```
  make run

  Please enter a port number to bind to this container:
  8084
  b798c4673c9e5336a9aca58241cc30f73c50fb641d2658940e67a766aaad5c07
  ```

- Content of localhost
  ```
  curl http://localhost:8084
  This image was create by Fernando, based on the 0c3d2e6
  ```

---

Answer for exercise [c03-make01](https://github.com/devopsacademyau/academy/blob/8b64a93a228398e7342afe7b845cd197b22afaf3/classes/03class/exercises/c03-make01/README.md)
