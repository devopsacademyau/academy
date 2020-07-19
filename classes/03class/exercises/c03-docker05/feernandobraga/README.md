# C03-Docker05

## Command Execution Output

- Commands executed to run both containers:

  ```
  docker run -d -p 8081:80 fernandobraga/exercise02:v1

  Unable to find image 'fernandobraga/exercise02:v1' locally
  v1: Pulling from fernandobraga/exercise02
  aad63a933944: Pull complete
  29ade582b51e: Pull complete
  7e41ad5b6f9c: Pull complete
  ebf61b47b4ca: Pull complete
  9c060bce4eae: Pull complete
  84f335adc5bb: Pull complete
  Digest: sha256:88d03ea553aa346946335e61e1cf20f1612bcb28dbddd53a15926cd87f2ee522
  Status: Downloaded newer image for fernandobraga/exercise02:v1
  4b8343dacb699f792c3da1eb008e65d1f91cbbe0af001cad3fe8b9f3fca41b1b

  -------------------------------

  docker run -d -p 8082:80 -v "/Users/fernandobraga/Workspace/DevOps Academy/week-3/c03-docker02/academy/classes/03class/exercises/c03-docker02/feernandobraga/artifacts/c03-docker02:/usr/local/apache2/htdocs" fernandobraga/exercise02:v2

  Unable to find image 'fernandobraga/exercise02:v2' locally
  v2: Pulling from fernandobraga/exercise02
  aad63a933944: Already exists
  29ade582b51e: Already exists
  7e41ad5b6f9c: Already exists
  ebf61b47b4ca: Already exists
  9c060bce4eae: Already exists
  7b5c0807ebdf: Pull complete
  Digest: sha256:0eefc00c3a238aaa1212a1da47efdf4834cf6933ef08aa17ab796adf10355fd6
  Status: Downloaded newer image for fernandobraga/exercise02:v2

  ```

- A brief explanation of what happened when you executed the comands to run the containers:

  ```
    when I run the first command, docker tried to find images locally, which it couldn't and then fetched it remotely.
    when I run the second command, docker found locally the dependencies and used those instead
  ```

- Command to list all images on your local as well as its output:

  ```
  docker images -a
  REPOSITORY TAG IMAGE ID CREATED SIZE
  fernandobraga/exercise02 v2 bfc48a36e6e5 2 hours ago 107MB
  fernandobraga/exercise02 v1 77bd225e9627 3 hours ago 107MB

  docker ps -a
  CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES
  8263862f1eab fernandobraga/exercise02:v2 "httpd-foreground" 3 minutes ago Up 3 minutes 0.0.0.0:8082->80/tcp sharp_black
  77972b6785ca fernandobraga/exercise02:v1 "httpd-foreground" 4 minutes ago Up 4 minutes 0.0.0.0:8081->80/tcp wizardly_pascal

  ```

---

Answer for exercise [c03-docker05](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker05/README.md)

```

```
