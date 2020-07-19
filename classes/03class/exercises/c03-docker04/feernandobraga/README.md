# C03-Docker04

## Command Execution Output

- Commands executed to clean up both the images and the containers(running or exited) from your local:

  ```
  docker ps
  CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS              PORTS                  NAMES
  9d1662770900        exercise02:v2       "httpd-foreground"   About an hour ago   Up About an hour    0.0.0.0:8082->80/tcp   funny_lovelace
  6ea3be39ad10        exercise02:v1       "httpd-foreground"   2 hours ago         Up 2 hours          0.0.0.0:8081->80/tcp   vibrant_heisenberg

  docker stop 9d16 6ea3
  9d16
  6ea3

  docker rm 9d16 6ea3
  9d16
  6ea3

  docker image rm exercise02:v1 exercise02:v2
  Untagged: exercise02:v1
  Untagged: exercise02:v2

  docker image rm fernandobraga/exercise02:v1 fernandobraga/exercise02:v2
  Untagged: fernandobraga/exercise02:v1
  Untagged: fernandobraga/exercise02@sha256:88d03ea553aa346946335e61e1cf20f1612bcb28dbddd53a15926cd87f2ee522
  Deleted: sha256:77bd225e962747cd0a6f9292cadf5e2f681e83d6b2737951a27c3193f1c60ddc
  Deleted: sha256:530db39ee2ab03d8a09b45f741e085b28a727348762729e0f0bb0d50629de84c
  Untagged: fernandobraga/exercise02:v2
  Untagged: fernandobraga/exercise02@sha256:0eefc00c3a238aaa1212a1da47efdf4834cf6933ef08aa17ab796adf10355fd6
  Deleted: sha256:bfc48a36e6e5e8784ce69f459a90f182882e6cc637878856ef8c88311c697794
  Deleted: sha256:bab72642a84d982683ee01072651f5350de4a90772db87e1b83c32d4502dacb6
  ```

- Command and it's output showing that there is no image or container on your local. Use only TEXT for the command output, don't include images (JPEG, PNG, etc):

  ```
  docker images -a
  REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

  docker ps -a
  CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                     PORTS                    NAMES
  ```

---

Answer for exercise [c03-docker04](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker04/README.md)
