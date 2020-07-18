# C03-COMPOSE01

## Make
- [docker-compose.yaml](docker-compose.yaml)

## Command Execution Output

```

docker pull mysql
Using default tag: latest
latest: Pulling from library/mysql
8559a31e96f4: Pull complete
d51ce1c2e575: Pull complete
c2344adc4858: Pull complete
fcf3ceff18fc: Pull complete
16da0c38dc5b: Pull complete
b905d1797e97: Pull complete
4b50d1c6b05c: Pull complete
571e8a282156: Pull complete
e7cc823c6090: Pull complete
61161ba7d2fc: Pull complete
74f29f825aaf: Pull complete
d29992fd199f: Pull complete
Digest: sha256:fe0a5b418ecf9b450d0e59062312b488d4d4ea98fc81427e3704f85154ee859c
Status: Downloaded newer image for mysql:latest
docker.io/library/mysql:latest

```

- Execution and output of the command `docker-compose ps`

```

docker-compose ps
     Name                    Command                State     Ports
-------------------------------------------------------------------
gepifanio_db_1    docker-entrypoint.sh --def ...   Exit 137
gepifanio_web_1   docker-php-entrypoint apac ...   Exit 0


docker ps -a
CONTAINER ID        IMAGE                        COMMAND                  CREATED              STATUS                        PORTS                   NAMES
4254d4991a0a        gepifanio_web                "docker-php-entrypoi…"   About a minute ago   Exited (0) 25 seconds ago                             gepifanio_web_1
991f6ab20216        mysql:5.7                    "docker-entrypoint.s…"   About a minute ago   Exited (137) 24 seconds ago                           gepifanio_db_1
3e034f59092a        guiepifanio/make01:9b9bbe1   "httpd-foreground"       About an hour ago    Up About an hour              0.0.0.0:32769->80/tcp   zealous_dirac

```

- Execution and output of the command `curl http://localhost:8100`

```

curl http://localhost:8100


Connected Successfully%

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-compose01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-compose01/README.md)